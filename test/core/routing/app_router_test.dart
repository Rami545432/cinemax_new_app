import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movify/core/routing/app_router.dart';
import 'package:movify/core/routing/route_paths.dart';
import 'package:movify/features/auth/domain/entities/user_entity.dart';
import 'package:movify/features/auth/presentation/cubits/session_cubit.dart';
import 'package:movify/features/auth/presentation/cubits/session_state.dart';
import 'package:movify/features/settings/presentation/cubits/settings_cubit.dart';
import 'package:movify/features/settings/presentation/cubits/settings_state.dart';

class MockSessionCubit extends Mock implements SessionCubit {}

class MockSettingsCubit extends Mock implements SettingsCubit {}

class MockUserEntity extends Mock implements UserEntity {}

void main() {
  group('AppRouters redirectLogic', () {
    late AppRouters appRouters;
    late MockSessionCubit mockSessionCubit;
    late MockSettingsCubit mockSettingsCubit;
    late MockUserEntity mockUser;

    setUp(() {
      mockSessionCubit = MockSessionCubit();
      mockSettingsCubit = MockSettingsCubit();
      mockUser = MockUserEntity();
      appRouters = AppRouters(
        sessionCubit: mockSessionCubit,
        settingsCubit: mockSettingsCubit,
      );
    });

    test('returns null if SessionUnknown and path is root', () {
      final result = appRouters.redirectLogic(
        SessionUnknown(),
        const SettingsLoaded(isFirstTime: false),
        RoutePaths.root,
      );
      expect(result, isNull);
    });

    test('returns root if SessionUnknown and path is not root', () {
      final result = appRouters.redirectLogic(
        SessionUnknown(),
        const SettingsLoaded(isFirstTime: false),
        RoutePaths.home,
      );
      expect(result, equals(RoutePaths.root));
    });

    test('returns root if SettingsUnknown and path is not root', () {
      final result = appRouters.redirectLogic(
        SessionAuthenticated(user: mockUser),
        SettingsUnknown(),
        RoutePaths.home,
      );
      expect(result, equals(RoutePaths.root));
    });

    test(
      'returns null if SettingsLoaded (first time) and path is an onboarding route',
      () {
        final result = appRouters.redirectLogic(
          SessionUnauthenticated(),
          const SettingsLoaded(isFirstTime: true),
          RoutePaths.boardingOne,
        );
        expect(result, isNull);
      },
    );

    test(
      'returns boardingZero if SettingsLoaded (first time) and path is not an onboarding route',
      () {
        final result = appRouters.redirectLogic(
          SessionUnauthenticated(),
          const SettingsLoaded(isFirstTime: true),
          RoutePaths.home,
        );
        expect(result, equals(RoutePaths.boardingZero));
      },
    );

    test(
      'returns home if SessionAuthenticated and path is blocked for authenticated users',
      () {
        final result = appRouters.redirectLogic(
          SessionAuthenticated(user: mockUser),
          const SettingsLoaded(isFirstTime: false),
          RoutePaths.login,
        );
        expect(result, equals(RoutePaths.home));
      },
    );

    test('returns null if SessionAuthenticated and path is not blocked', () {
      final result = appRouters.redirectLogic(
        SessionAuthenticated(user: mockUser),
        const SettingsLoaded(isFirstTime: false),
        RoutePaths.profile,
      );
      expect(result, isNull);
    });

    test('returns home if SessionGuest and path is blocked for guests', () {
      final result = appRouters.redirectLogic(
        SessionGuest(user: mockUser),
        const SettingsLoaded(isFirstTime: false),
        RoutePaths.root,
      );
      expect(result, equals(RoutePaths.home));
    });

    test('returns null if SessionGuest and path is not blocked', () {
      final result = appRouters.redirectLogic(
        SessionGuest(user: mockUser),
        const SettingsLoaded(isFirstTime: false),
        RoutePaths.discover,
      );
      expect(result, isNull);
    });

    test('returns null for default case', () {
      final result = appRouters.redirectLogic(
        SessionUnauthenticated(),
        const SettingsLoaded(isFirstTime: false),
        RoutePaths.login,
      );
      expect(result, isNull);
    });
  });
}
