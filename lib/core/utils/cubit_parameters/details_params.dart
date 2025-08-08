import 'package:dio/dio.dart';

class DetailsParams {
  final int id;
  final String type;
  final CancelToken? cancelToken;

  const DetailsParams({required this.id, required this.type, this.cancelToken});

  DetailsParams copyWith({int? id, String? type, CancelToken? cancelToken}) {
    return DetailsParams(
      id: id ?? this.id,
      type: type ?? this.type,
      cancelToken: cancelToken ?? this.cancelToken,
    );
  }

  Map<String, dynamic> toQueryMap() {
    return {'id': id, 'type': type};
  }
}
