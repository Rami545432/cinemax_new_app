import '../../features/home/domian/entites/movie_entity.dart';
import '../../features/series/domain/entites/series_entity.dart';
import '../../models/base_card_model.dart';

typedef RemoteDataSourceListMovieEntity = Future<List<MovieEntity>>;
typedef RemoteDataSourceListBaseCardModel = Future<List<BaseCardModel>>;
typedef RemoteDataSourceListSeriesEntity = Future<List<SeriesEntity>>;
