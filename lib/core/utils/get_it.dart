import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/favorite/data/local_favorite_data_source/local_favorite_data_source_impl.dart';
import '../../features/favorite/data/remote_favorite_data_source/remote_favorite_data_source_impl.dart';
import '../../features/favorite/data/repos/favorite_repo_impl.dart';
import '../../features/home/data/data_soureces/local_home_data_source.dart';
import '../../features/home/data/data_soureces/remote_home_data_source.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/search/data/data_sources/local_search_data_source.dart';
import '../../features/search/data/data_sources/remote_search_data_source.dart';
import '../../features/search/data/repos/search_repo_impl.dart';
import '../../features/series/data/data_soureces/local_series_tv_data_source.dart';
import '../../features/series/data/data_soureces/remote_seires_tv_data_source.dart';
import '../../features/series/data/repos/series_repo_impl.dart';

import 'services/api_service.dart';

GetIt getIt = GetIt.instance;
void serviceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      localHomeDataSource: LocalHomeDataSourceImpl(),
      remoteHomeDataSource: RemoteHomeDataSourceImpl(
        apiService: getIt.get<ApiService>(),
      ),
    ),
  );
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
      remoteDataSource: RemoteSearchDataSourceImpl(
        apiService: getIt.get<ApiService>(),
      ),
      localSearchDataSource: LocalSearchDataSourceImpl(),
    ),
  );
  getIt.registerSingleton<SeriesRepoImpl>(
    SeriesRepoImpl(
      LocalSeriesDataSourceImpl(),
      remoteSeiresTvDataSource: RemoteSeiresTvDataSourceImpl(
        apiService: getIt.get<ApiService>(),
      ),
    ),
  );
  getIt.registerSingleton<FavoriteRepoImpl>(
    FavoriteRepoImpl(
      remoteDataSource: RemoteFavoriteDataSourceImpl(),
      localDataSource: LocalFavoriteDataSourceImpl(),
    ),
  );
}
