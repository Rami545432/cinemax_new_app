// import 'package:cinemax_app_new/core/utils/errors/errors.dart';
// import 'package:cinemax_app_new/features/home/data/models/test_entity.dart';
// import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
// import 'package:cinemax_app_new/features/home/domian/repos/home_repo.dart';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';

// class TestUseCase extends UseCase<List<TestEntity>, NoParams> {
//   final HomeRepo homeRepo;

//   TestUseCase({required this.homeRepo});
//   @override
//   Future<Either<Failure, List<TestEntity>>> call([NoParams? params, int? page, CancelToken? cancelToken]) async {
//     return homeRepo.test(page: page!, cancelToken: cancelToken);
//   }
// }
