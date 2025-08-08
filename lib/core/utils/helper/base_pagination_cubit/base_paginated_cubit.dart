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
  final List<T> items = [];
  bool isFetching = false;
  bool isLastPage = false;
  int currentPage = 1;
  CancelToken? _cancelToken;
  late P _params;
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
    emit(
      BasePaginatedLoading<T>(
            oldData: List.unmodifiable(items),
            isFirstFetch: currentPage == 1,
          )
          as BasePaginatedStates<T>,
    );
    final result = await pageLoader(
      params: _params,
      page: currentPage,
      cancelToken: _cancelToken,
    );
    result.fold(
      (failure) {
        if (!isClosed) {
          emit(
            BasePaginatedError<T>(
                  errorMessage: failure.errorMessage,
                  oldData: List.unmodifiable(items),
                )
                as BasePaginatedStates<T>,
          );
        }
      },
      (newItems) {
        items.addAll(newItems);
        isLastPage = newItems.isEmpty;
        if (!isClosed) {
          emit(
            BasePaginatedSuccess<T>(newData: items, isLastPage: isLastPage)
                as BasePaginatedStates<T>,
          );
        }
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
