import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movify/core/network/client/dio_client.dart';
import 'package:movify/core/network/client/network_info.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockCacheStore extends Mock implements CacheStore {}

void main() {
  late MockNetworkInfo mockNetworkInfo;
  late MockCacheStore mockCacheStore;
  late DioClient dioClient;
  late Dio dummyDio;
  late CacheOptions defaultCacheOptions;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockCacheStore = MockCacheStore();
    dummyDio = Dio();
    defaultCacheOptions = CacheOptions(store: mockCacheStore);

    dioClient = DioClient(
      dio: dummyDio,
      cacheOptions: defaultCacheOptions,
      networkInfo: mockNetworkInfo,
    );
  });

  /// Helper to extract CachePolicy from the generated Options
  CachePolicy? extractPolicy(Options options) {
    // dio_cache_interceptor stores CacheOptions in the extra map under this key
    final cacheOptions = options.extra?['@cache_options@'] as CacheOptions?;
    return cacheOptions?.policy;
  }

  group('DioClient - cacheRequestOptions', () {
    test('should return CachePolicy.request when online', () {
      // Arrange
      when(() => mockNetworkInfo.isConnected).thenReturn(true);

      // Act
      final options = dioClient.cacheRequestOptions();

      // Assert
      expect(extractPolicy(options), CachePolicy.request);
      verify(() => mockNetworkInfo.isConnected).called(1);
    });

    test('should return CachePolicy.forceCache when offline', () {
      // Arrange
      when(() => mockNetworkInfo.isConnected).thenReturn(false);

      // Act
      final options = dioClient.cacheRequestOptions();

      // Assert
      expect(extractPolicy(options), CachePolicy.forceCache);
      verify(() => mockNetworkInfo.isConnected).called(1);
    });

    test(
        'should return overridePolicy when provided (ignoring network status)',
        () {
      // Arrange: mock it as offline to prove the override takes precedence
      when(() => mockNetworkInfo.isConnected).thenReturn(false);

      // Act
      final options = dioClient.cacheRequestOptions(
        overridePolicy: CachePolicy.noCache,
      );

      // Assert
      expect(extractPolicy(options), CachePolicy.noCache);
      // It shouldn't even check the network if an override is provided
      verifyNever(() => mockNetworkInfo.isConnected);
    });
  });

  group('DioClient - clearCache', () {
    test('should call clean() on cache store', () async {
      // Arrange
      when(() => mockCacheStore.clean()).thenAnswer((_) async {});

      // Act
      await dioClient.clearCache();

      // Assert
      verify(() => mockCacheStore.clean()).called(1);
    });
  });
}
