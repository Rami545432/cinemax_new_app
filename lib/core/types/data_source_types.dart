import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';
import 'package:cinemax_app_new/features/home/data/models/movie_model.dart';
import 'package:cinemax_app_new/features/home/data/models/series_model.dart';
import 'package:cinemax_app_new/shared/domain/entites/movie_entity.dart';

typedef RemoteDataSourceListMovieModel = Future<PageResult<MovieModel>>;
typedef RemoteDataSourceListSeriesModel = Future<PageResult<SeriesModel>>;
typedef RemoteDataSourcePaginatedMovieEntity = Future<PageResult<MovieEntity>>;
