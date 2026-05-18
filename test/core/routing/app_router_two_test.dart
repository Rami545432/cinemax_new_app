// test/features/routing/app_router_test.dart
//
// Pattern tested: Pure Function Testing
// _redirect() is a pure function — same inputs always produce same output.
// Zero Flutter widgets, zero async, zero mocks needed.
// This is the fastest possible test — runs in milliseconds.
//
// Coverage matrix:
// ┌─────────────────────────────────────────────────────────────────┐
// │  SessionState        │ SettingsState      │ Path       │ Result │
// ├─────────────────────────────────────────────────────────────────┤
// │  SessionUnknown      │ any                │ any        │ root   │
// │  any                 │ SettingsUnknown    │ any        │ root   │
// │  any                 │ SettingsFirstTime  │ onboarding │ null   │
// │  any                 │ SettingsFirstTime  │ other      │ board  │
// │  SessionAuthenticated│ SettingsLoaded     │ blocked    │ home   │
// │  SessionAuthenticated│ SettingsLoaded     │ free       │ null   │
// │  SessionGuest        │ SettingsLoaded     │ blocked    │ home   │
// │  SessionGuest        │ SettingsLoaded     │ login      │ null   │
// │  SessionUnauthenticated│ SettingsLoaded   │ any        │ null   │
// └─────────────────────────────────────────────────────────────────┘

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movify/core/routing/app_router.dart';
import 'package:movify/core/routing/route_paths.dart';
import 'package:movify/features/auth/domain/entities/user_entity.dart';
import 'package:movify/features/auth/presentation/cubits/session_cubit.dart';
import 'package:movify/features/auth/presentation/cubits/session_state.dart';
import 'package:movify/features/settings/presentation/cubits/settings_cubit.dart';
import 'package:movify/features/settings/presentation/cubits/settings_state.dart';

// ── Helpers ───────────────────────────────────────────────────────────────

/// Fake user — redirect only checks state type, not user content.
final _fakeUser = UserEntity(
  uid: 'test-uid',
  email: 'test@test.com',
  isGuest: false,
  displayName: 'test',
  createdAt: DateTime(2022),
  isEmailVerified: true,
  photoUrl: null,
);

final _fakeGuestUser = UserEntity.guest();

/// Shorthand states — keeps test bodies readable.
final _unknown = SettingsUnknown();
const _firstTime = SettingsLoaded(isFirstTime: true);
const _notFirstTime = SettingsLoaded(isFirstTime: false);

SessionAuthenticated get _authenticated =>
    SessionAuthenticated(user: _fakeUser);

SessionGuest get _guest => SessionGuest(user: _fakeGuestUser);

final _sessionUnknown = SessionUnknown();
final _sessionUnauthenticated = SessionUnauthenticated();

/// Calls the private _redirect via a test-only subclass.
/// We expose _redirect as @visibleForTesting OR test via a thin wrapper.
/// This keeps AppRouters production code unchanged.
String? redirect(SessionState session, SettingsState settings, String path) =>
    AppRoutersTestHelper.redirect(session, settings, path);

// ── Test helper — exposes _redirect without changing production code ───────

class AppRoutersTestHelper extends AppRouters {
  AppRoutersTestHelper()
    : super(
        // SessionCubit and SettingsCubit are NOT used by _redirect directly.
        // _redirect is a pure function that takes state values.
        // We pass nulls here because createRouter() is never called in tests.
        sessionCubit: MockSessionCubit(),
        settingsCubit: MockSettingsCubit(),
      );

  static String? redirect(
    SessionState session,
    SettingsState settings,
    String path,
  ) => AppRoutersTestHelper().redirectLogic(session, settings, path);
}

class MockSessionCubit extends Mock implements SessionCubit {}

class MockSettingsCubit extends Mock implements SettingsCubit {}

// ══════════════════════════════════════════════════════════════════════════
// TESTS
// ══════════════════════════════════════════════════════════════════════════

void main() {
  // ── GROUP 1: Initialization guard ──────────────────────────────────────
  // Rule: while either state is Unknown, stay at root.
  // This is the splash screen guard — nothing should render until
  // both SessionCubit and SettingsCubit have real state.

  group('1️⃣  Initialization guard (SessionUnknown or SettingsUnknown)', () {
    test('SessionUnknown + SettingsUnknown + root path → null (stay)', () {
      expect(redirect(_sessionUnknown, _unknown, RoutePaths.root), isNull);
    });

    test('SessionUnknown + SettingsUnknown + home path → redirect to root', () {
      expect(
        redirect(_sessionUnknown, _unknown, RoutePaths.home),
        equals(RoutePaths.root),
      );
    });

    test('SessionUnknown + SettingsLoaded + any path → redirect to root', () {
      expect(
        redirect(_sessionUnknown, _notFirstTime, RoutePaths.home),
        equals(RoutePaths.root),
      );
    });

    test(
      'SessionAuthenticated + SettingsUnknown + any path → redirect to root',
      () {
        // Settings not ready yet — still hold at splash regardless of session
        expect(
          redirect(_authenticated, _unknown, RoutePaths.home),
          equals(RoutePaths.root),
        );
      },
    );

    test('SessionGuest + SettingsUnknown + any path → redirect to root', () {
      expect(
        redirect(_guest, _unknown, RoutePaths.home),
        equals(RoutePaths.root),
      );
    });

    test(
      'SessionUnauthenticated + SettingsUnknown + any path → redirect to root',
      () {
        expect(
          redirect(_sessionUnauthenticated, _unknown, RoutePaths.home),
          equals(RoutePaths.root),
        );
      },
    );
  });

  // ── GROUP 2: First time user → onboarding ──────────────────────────────
  // Rule: isFirstTime = true means force onboarding regardless of session.
  // Once in onboarding routes, stay there.

  group('2️⃣  First time user → onboarding', () {
    test('isFirstTime + already at boardingZero → null (stay)', () {
      expect(
        redirect(_sessionUnauthenticated, _firstTime, RoutePaths.boardingZero),
        isNull,
      );
    });

    test('isFirstTime + at boardingOne → null (stay)', () {
      expect(
        redirect(_sessionUnauthenticated, _firstTime, RoutePaths.boardingOne),
        isNull,
      );
    });

    test('isFirstTime + at boardingTwo → null (stay)', () {
      expect(
        redirect(_sessionUnauthenticated, _firstTime, RoutePaths.boardingTwo),
        isNull,
      );
    });

    test('isFirstTime + at boardingThree → null (stay)', () {
      expect(
        redirect(_sessionUnauthenticated, _firstTime, RoutePaths.boardingThree),
        isNull,
      );
    });

    test('isFirstTime + at onBoardingPageView → null (stay)', () {
      expect(
        redirect(
          _sessionUnauthenticated,
          _firstTime,
          RoutePaths.onBoardingPageView,
        ),
        isNull,
      );
    });

    test('isFirstTime + at home → redirect to boardingZero', () {
      expect(
        redirect(_sessionUnauthenticated, _firstTime, RoutePaths.home),
        equals(RoutePaths.boardingZero),
      );
    });

    test('isFirstTime + at login → redirect to boardingZero', () {
      expect(
        redirect(_sessionUnauthenticated, _firstTime, RoutePaths.login),
        equals(RoutePaths.boardingZero),
      );
    });

    test('isFirstTime + at root → redirect to boardingZero', () {
      expect(
        redirect(_sessionUnauthenticated, _firstTime, RoutePaths.root),
        equals(RoutePaths.boardingZero),
      );
    });

    test(
      'isFirstTime + authenticated user + at home → still redirect to onboarding',
      () {
        // Onboarding takes priority over session state
        expect(
          redirect(_authenticated, _firstTime, RoutePaths.home),
          equals(RoutePaths.boardingZero),
        );
      },
    );

    test(
      'isFirstTime + guest user + at home → still redirect to onboarding',
      () {
        expect(
          redirect(_guest, _firstTime, RoutePaths.home),
          equals(RoutePaths.boardingZero),
        );
      },
    );
  });

  // ── GROUP 3: Authenticated user ────────────────────────────────────────
  // Rule: authenticated users cannot access root, boardingZero, or login.
  // All other routes are free.

  group('3️⃣  SessionAuthenticated — blocked routes redirect to home', () {
    test('authenticated + root path → redirect to home', () {
      expect(
        redirect(_authenticated, _notFirstTime, RoutePaths.root),
        equals(RoutePaths.home),
      );
    });

    test('authenticated + boardingZero → redirect to home', () {
      expect(
        redirect(_authenticated, _notFirstTime, RoutePaths.boardingZero),
        equals(RoutePaths.home),
      );
    });

    test('authenticated + login → redirect to home', () {
      expect(
        redirect(_authenticated, _notFirstTime, RoutePaths.login),
        equals(RoutePaths.home),
      );
    });
  });

  group('3️⃣  SessionAuthenticated — free routes return null (stay)', () {
    test('authenticated + home → null (stay)', () {
      expect(redirect(_authenticated, _notFirstTime, RoutePaths.home), isNull);
    });

    test('authenticated + search → null (stay)', () {
      expect(
        redirect(_authenticated, _notFirstTime, RoutePaths.search),
        isNull,
      );
    });

    test('authenticated + favorite → null (stay)', () {
      expect(
        redirect(_authenticated, _notFirstTime, RoutePaths.favorite),
        isNull,
      );
    });

    test('authenticated + profile → null (stay)', () {
      expect(
        redirect(_authenticated, _notFirstTime, RoutePaths.profile),
        isNull,
      );
    });

    test('authenticated + discover → null (stay)', () {
      expect(
        redirect(_authenticated, _notFirstTime, RoutePaths.discover),
        isNull,
      );
    });

    test('authenticated + movieDetail → null (stay)', () {
      expect(
        redirect(_authenticated, _notFirstTime, RoutePaths.movieDetail),
        isNull,
      );
    });
  });

  // ── GROUP 4: Guest user ────────────────────────────────────────────────
  // Rule: guests are blocked from root and boardingZero only.
  // Guests CAN access login — they might want to sign in.

  group('4️⃣  SessionGuest — blocked routes redirect to home', () {
    test('guest + root → redirect to home', () {
      expect(
        redirect(_guest, _notFirstTime, RoutePaths.root),
        equals(RoutePaths.home),
      );
    });

    test('guest + boardingZero → redirect to home', () {
      expect(
        redirect(_guest, _notFirstTime, RoutePaths.boardingZero),
        equals(RoutePaths.home),
      );
    });
  });

  group('4️⃣  SessionGuest — free routes return null (stay)', () {
    test('guest + login → null (guest CAN access login)', () {
      // Key difference from authenticated: guests can reach login
      expect(redirect(_guest, _notFirstTime, RoutePaths.login), isNull);
    });

    test('guest + home → null (stay)', () {
      expect(redirect(_guest, _notFirstTime, RoutePaths.home), isNull);
    });

    test('guest + search → null (stay)', () {
      expect(redirect(_guest, _notFirstTime, RoutePaths.search), isNull);
    });

    test('guest + discover → null (stay)', () {
      expect(redirect(_guest, _notFirstTime, RoutePaths.discover), isNull);
    });
  });

  // ── GROUP 5: Unauthenticated user ──────────────────────────────────────
  // Rule: unauthenticated users have no redirect rules — they fall through
  // to null. The router shows whatever route they're on (usually login).

  group('5️⃣  SessionUnauthenticated — no redirect rules (falls through)', () {
    test('unauthenticated + login → null (stay — this is correct landing)', () {
      expect(
        redirect(_sessionUnauthenticated, _notFirstTime, RoutePaths.login),
        isNull,
      );
    });

    test('unauthenticated + home → null (no guard — consider adding one)', () {
      // ⚠️ NOTE: Your current _redirect has no guard for unauthenticated
      // users trying to access protected routes like /app/home.
      // This test documents current behavior — if you add a guard later,
      // update this test to expect(result, equals(RoutePaths.login)).
      expect(
        redirect(_sessionUnauthenticated, _notFirstTime, RoutePaths.home),
        isNull,
      );
    });

    test('unauthenticated + root → null', () {
      expect(
        redirect(_sessionUnauthenticated, _notFirstTime, RoutePaths.root),
        isNull,
      );
    });
  });

  // ── GROUP 6: Edge cases ────────────────────────────────────────────────

  group('6️⃣  Edge cases', () {
    test(
      'authenticated + boardingOne → null (only boardingZero is blocked)',
      () {
        // boardingOne is NOT in _blockedWhenAuthenticated
        // This documents that authenticated users can technically reach
        // boarding sub-pages if linked directly — intentional?
        expect(
          redirect(_authenticated, _notFirstTime, RoutePaths.boardingOne),
          isNull,
        );
      },
    );

    test(
      'guest + boardingOne → null (only boardingZero is blocked for guests)',
      () {
        expect(redirect(_guest, _notFirstTime, RoutePaths.boardingOne), isNull);
      },
    );

    test('authenticated + youtubePlayer → null (utility routes are free)', () {
      expect(
        redirect(_authenticated, _notFirstTime, RoutePaths.youtubePlayer),
        isNull,
      );
    });

    test('authenticated + chatBot → null', () {
      expect(
        redirect(_authenticated, _notFirstTime, RoutePaths.chatBot),
        isNull,
      );
    });
  });
}
