import 'package:dio/dio.dart';

class SearchParams {
  final String query;
  final CancelToken? cancelToken;

  const SearchParams({required this.query, this.cancelToken});

  SearchParams copyWith({String? query, CancelToken? cancelToken}) {
    return SearchParams(
      query: query ?? this.query,
      cancelToken: cancelToken ?? this.cancelToken,
    );
  }

  Map<String, dynamic> toQueryMap() {
    return {'query': query};
  }
}
