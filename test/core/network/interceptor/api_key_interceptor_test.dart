import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movify/core/network/interceptors/api_key_interceptor.dart';

// Import your actual interceptor file here

class MockRequestInterceptorHandler extends Mock
    implements RequestInterceptorHandler {}

void main() {
  late ApiKeyInterceptor apiKeyInterceptor;
  late MockRequestInterceptorHandler mockHandler;

  // The fake key we will inject for testing
  const testApiKey = 'fake_tmdb_key_999';

  setUp(() {
    // Initialize the mock handler
    mockHandler = MockRequestInterceptorHandler();

    // Initialize your interceptor with the fake key
    apiKeyInterceptor = ApiKeyInterceptor(tmdbApiKey: testApiKey);
  });

  group('ApiKeyInterceptor', () {
    test('should append api_key to query parameters on every request', () {
      // 1. Arrange: Create a fake outgoing request
      final options = RequestOptions(
        path: '/movie/popular',
        // Let's pretend the request already has some query parameters
        queryParameters: {'language': 'en-US'},
      );

      // 2. Act: Trigger the interceptor
      apiKeyInterceptor.onRequest(options, mockHandler);

      // 3. Assert: Verify the api_key was added correctly
      expect(options.queryParameters['api_key'], testApiKey);

      // 3. Assert: Verify existing parameters were NOT overwritten or removed
      expect(options.queryParameters['language'], 'en-US');

      // 3. Assert: Verify that the interceptor passed the request down the chain
      verify(() {
        mockHandler.next(options);
      }).called(1);
    });
  });
}
