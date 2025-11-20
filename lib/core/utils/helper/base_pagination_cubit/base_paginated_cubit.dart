import 'package:cinemax_app_new/core/network/utils/safe_emit_state.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../errors/errors.dart';
import 'base_paginated_states.dart';

typedef PageLoader<T, P> =
    Future<Either<Failure, List<T>>> Function({
      required P params,
      required int? page,
      required CancelToken? cancelToken,
    });

abstract class BasePaginatedCubit<T, P> extends Cubit<BasePaginatedStates<T>> {
  BasePaginatedCubit(super.initialState, this.pageLoader);
  PageLoader<T, P> pageLoader;
  List<T> items = [];
  bool isFetching = false;
  bool isLastPage = false;
  int currentPage = 1;
  CancelToken? _cancelToken;
  P? _params;

  Future<void> fetchInitialData({required P params}) async {
    if (isFetching) {
      return;
    }
    _params = params;
    reset();
    await fetchData();
  }

  Future<void> fetchNextPage() async {
    if (isFetching || isLastPage) {
      return;
    }
    currentPage++;
    await fetchData();
  }

  Future<void> fetchData() async {
    isFetching = true;
    _cancelToken?.cancel();
    _cancelToken = CancelToken();

    safeEmit(
      BasePaginatedLoading<T>(
        oldData: List.unmodifiable(items),
        isFirstFetch: currentPage == 1,
      ),
    );

    final result = await pageLoader(
      params: _params as P,
      page: currentPage,
      cancelToken: _cancelToken,
    );

    result.fold(
      (failure) {
        safeEmit(
          BasePaginatedError<T>(
            errorMessage: failure.errorMessage,
            oldData: List.unmodifiable(items),
          ),
        );
      },
      (newItems) {
        items = [...items, ...newItems];
        isLastPage = newItems.isEmpty;
        safeEmit(
          BasePaginatedSuccess<T>(newData: items, isLastPage: isLastPage),
        );
      },
    );
    isFetching = false;
  }

  void reset() {
    items.clear();
    isLastPage = false;
    isFetching = false;
    currentPage = 1;
  }

  @override
  Future<void> close() {
    _cancelToken?.cancel();
    return super.close();
  }
}
