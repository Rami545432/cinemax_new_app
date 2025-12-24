import 'package:cinemax_app_new/features/home/data/models/test_model.dart';

import '../../features/home/domian/entites/movie_entity.dart';
import '../../features/home/domian/entites/series_entity.dart';
import '../../models/base_card_model.dart';

typedef RemoteDataSourceListMovieEntity = Future<PagedResult<MovieEntity>>;
typedef RemoteDataSourceListBaseCardModel = Future<PagedResult<BaseCardModel>>;
typedef RemoteDataSourceListSeriesEntity = Future<PagedResult<SeriesEntity>>;
typedef RemoteDataSourcePaginatedMovieEntity = Future<PagedResult<MovieEntity>>;
