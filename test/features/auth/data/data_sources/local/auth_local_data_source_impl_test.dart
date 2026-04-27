import 'package:cinemax_app_new/features/auth/data/data_sources/local/auth_local_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 1. Mock the 3rd party library!
class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late AuthLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = AuthLocalDataSourceImpl(
      sharedPreferences: mockSharedPreferences,
    );
  });

  group('getGuestMode', () {
    test(
      'should return exactly what SharedPreferences returns (true)',
      () async {
        // Arrange: When the database is asked for IS_GUEST_MODE, return true
        when(
          () => mockSharedPreferences.getBool('IS_GUEST_MODE'),
        ).thenReturn(true);

        // Act
        final result = await dataSource.getGuestMode();

        // Assert
        expect(result, true);
        verify(() => mockSharedPreferences.getBool('IS_GUEST_MODE')).called(1);
      },
    );

    test('should return false when DB returns null', () async {
      // Arrange: When the database is empty (returns null)
      when(
        () => mockSharedPreferences.getBool('IS_GUEST_MODE'),
      ).thenReturn(null);

      // Act
      final result = await dataSource.getGuestMode();

      // Assert: Our implementation is smart and falls back to false instead of crashing!
      expect(result, false);
    });
  });

  group('setGuestMode', () {
    test('should call setBool on SharedPreferences database', () async {
      // Arrange:
      // setBool returns a Future<bool>, so we must mock it to return true
      when(
        () => mockSharedPreferences.setBool('IS_GUEST_MODE', true),
      ).thenAnswer((_) async => true);

      // Act
      await dataSource.setGuestMode(true);

      // Assert: Verify our data source actually sent the write command to the database!
      verify(
        () => mockSharedPreferences.setBool('IS_GUEST_MODE', true),
      ).called(1);
    });
    test('Should clear guest mode', () async {
      // Arrange:
      // setBool returns a Future<bool>, so we must mock it to return true
      when(
        () => mockSharedPreferences.remove('IS_GUEST_MODE'),
      ).thenAnswer((_) async => true);

      // Act
      await dataSource.clearGuestMode();

      // Assert: Verify our data source actually sent the write command to the database!
      verify(() => mockSharedPreferences.remove('IS_GUEST_MODE')).called(1);
    });
  });
}
