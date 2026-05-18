// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:movify/core/errors/failure.dart';
// import 'package:movify/features/auth/data/data_sources/local/auth_local_data_source.dart';
// import 'package:movify/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
// import 'package:movify/features/auth/data/models/user_model.dart';
// import 'package:movify/features/auth/data/repos/auth_repo_impl.dart';
// import 'package:movify/features/auth/domain/entities/user_entity.dart';
// import 'package:movify/shared/domain/auth_event.dart';
// import 'package:movify/shared/domain/repos/auth_event_sink.dart';

// class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

// class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {}

// class MockAuthEventSink extends Mock implements AuthEventSink {}

// // ✅ Real fake user — never mock data classes
// final fakeUserModel = UserModel(
//   isEmailVerified: true,
//   photoUrl: 'url',
//   uid: 'uid',
//   displayName: 'name',
//   email: 'email',
//   isGuest: false,
//   createdAt: DateTime.now(),
// );

// void main() {
//   late MockAuthRemoteDataSource mockRemote;
//   late MockAuthLocalDataSource mockLocal;
//   late MockAuthEventSink mockSink;

//   // ✅ Register fallback values ONCE before all tests
//   setUpAll(() {
//     registerFallbackValue(AuthEventGuest(user: UserEntity.guest()));
//     registerFallbackValue(
//       AuthEventSignedIn(user: UserEntity.guest(), isNewSignIn: false),
//     );
//     registerFallbackValue(const AuthEventSignedOut());
//   });

//   // ✅ Only create mocks in setUp — NOT AuthRepoImpl
//   // AuthRepoImpl is created inside each test AFTER stubs are set up
//   setUp(() {
//     mockRemote = MockAuthRemoteDataSource();
//     mockLocal = MockAuthLocalDataSource();
//     mockSink = MockAuthEventSink();
//   });

//   // ✅ Helper — creates AuthRepoImpl AFTER stubs are ready
//   // and waits for _initAuthState() to complete
//   Future<void> buildRepo() async {
//     AuthRepoImpl(
//       localDataSource: mockLocal,
//       remoteDataSource: mockRemote,
//       authEventSink: mockSink,
//     );
//     // Give _initAuthState() time to complete
//     // Duration.zero = one microtask cycle
//     await Future.delayed(Duration.zero);
//   }

//   group('_initAuthState() — cold start session restore', () {
//     test(
//       'no user + not guest → emits AuthEventGuest (auto guest mode)',
//       () async {
//         // ✅ Stubs set up BEFORE repo is constructed
//         when(() => mockLocal.getGuestMode()).thenAnswer((_) async => false);
//         when(() => mockRemote.getCurrentUser()).thenAnswer((_) async => null);
//         // ✅ Stub for enableGuestMode() internal call
//         when(() => mockLocal.setGuestMode(true)).thenAnswer((_) async {});

//         await buildRepo(); // construct + wait

//         verify(
//           () => mockSink.addEvent(any(that: isA<AuthEventGuest>())),
//         ).called(1);
//         verifyNever(
//           () => mockSink.addEvent(any(that: isA<AuthEventSignedOut>())),
//         );
//       },
//     );

//     test(
//       'existing user at boot → emits AuthEventSignedIn(isNewSignIn: false)',
//       () async {
//         when(() => mockLocal.getGuestMode()).thenAnswer((_) async => false);
//         when(
//           () => mockRemote.getCurrentUser(),
//         ).thenAnswer((_) async => fakeUserModel);

//         await buildRepo();

//         verify(
//           () => mockSink.addEvent(
//             any(
//               that: isA<AuthEventSignedIn>()
//                   .having((e) => e.isNewSignIn, 'isNewSignIn', isFalse)
//                   .having((e) => e.user.uid, 'uid', equals('uid')),
//             ),
//           ),
//         ).called(1);
//       },
//     );

//     test('guest mode active at boot → emits AuthEventGuest', () async {
//       when(() => mockLocal.getGuestMode()).thenAnswer((_) async => true);

//       await buildRepo();

//       verify(
//         () => mockSink.addEvent(any(that: isA<AuthEventGuest>())),
//       ).called(1);
//     });

//     test('getCurrentUser fails → emits AuthEventSignedOut', () async {
//       when(
//         () => mockLocal.getGuestMode(),
//       ).thenThrow(const ServerFailure(errorMessage: 'cache error'));

//       await buildRepo();

//       verify(
//         () => mockSink.addEvent(any(that: isA<AuthEventSignedOut>())),
//       ).called(1);
//     });
//   });
// }
