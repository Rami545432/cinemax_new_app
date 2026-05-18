import 'package:movify/core/pagination/domain/entites/page_result.dart';
import 'package:movify/features/home/data/models/movie_model.dart';
import 'package:movify/features/home/data/models/series_model.dart';
import 'package:movify/shared/domain/entites/movie_entity.dart';

typedef RemoteDataSourceListMovieModel = Future<PageResult<MovieModel>>;
typedef RemoteDataSourceListSeriesModel = Future<PageResult<SeriesModel>>;
typedef RemoteDataSourcePaginatedMovieEntity = Future<PageResult<MovieEntity>>;
