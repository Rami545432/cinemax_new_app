import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/features/auth/data/data_sources/remote/auth_remote_data_source_impl.dart';
import 'package:cinemax_app_new/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

class MockGoogleSignInAuthentication extends Mock
    implements GoogleSignInAuthentication {}

class MockUserCredential extends Mock implements UserCredential {}

class MockUser extends Mock implements User {}

class MockUserMetadata extends Mock implements UserMetadata {}

class FakeAuthCredential extends Fake implements AuthCredential {}

void main() {
  late MockFirebaseAuth firebaseAuth;
  late MockGoogleSignIn googleSignIn;
  late AuthRemoteDataSourceImpl authRemoteDataSourceImpl;
  late MockGoogleSignInAccount googleUser;
  late MockGoogleSignInAuthentication googleAuth;
  late MockUserCredential userCredential;
  late MockUser user;
  late MockUserMetadata userMetadata;

  setUp(() {
    registerFallbackValue(FakeAuthCredential());
    firebaseAuth = MockFirebaseAuth();
    googleSignIn = MockGoogleSignIn();
    googleUser = MockGoogleSignInAccount();
    googleAuth = MockGoogleSignInAuthentication();
    userCredential = MockUserCredential();
    user = MockUser();
    userMetadata = MockUserMetadata();
    authRemoteDataSourceImpl = AuthRemoteDataSourceImpl(
      firebaseAuth: firebaseAuth,
      googleSignIn: googleSignIn,
    );
  });
  group('Sign In with Google', () {
    test(
      'should return a UserEntity when Google Sign-In is successful',
      () async {
        when(() => googleSignIn.signIn()).thenAnswer((_) async => googleUser);
        when(
          () => googleUser.authentication,
        ).thenAnswer((_) async => googleAuth);
        when(() => googleAuth.accessToken).thenReturn('test_access_token');
        when(() => googleAuth.idToken).thenReturn('test_id_token');
        when(
          () => firebaseAuth.signInWithCredential(any()),
        ).thenAnswer((_) async => userCredential);
        when(() => userCredential.user).thenReturn(user);
        when(() => user.uid).thenReturn('123');
        when(() => user.email).thenReturn('test@test.com');
        when(() => user.displayName).thenReturn('Test User');
        when(() => user.photoURL).thenReturn('url');
        when(() => user.emailVerified).thenReturn(true);
        when(() => user.isAnonymous).thenReturn(false);
        when(() => user.metadata).thenReturn(userMetadata);
        when(() => userMetadata.creationTime).thenReturn(DateTime(2023));
        final result = await authRemoteDataSourceImpl.signInWithGoogle();

        expect(result, isA<UserModel>());
        verify(() => firebaseAuth.signInWithCredential(any())).called(1);
      },
    );
    test(
      "Should Throw Server Failure when Google Sign In returns null",
      () async {
        when(() => googleSignIn.signIn()).thenAnswer((_) async => null);

        expect(
          () => authRemoteDataSourceImpl.signInWithGoogle(),
          throwsA(isA<ServerFailure>()),
        );
      },
    );
    test(
      "Should throw a ServerFailure when Google Sign-In returns null (user manual cancel)",
      () async {
        when(
          () => firebaseAuth.signInWithCredential(any()),
        ).thenThrow(FirebaseAuthException(code: 'network_error'));

        expect(
          () => authRemoteDataSourceImpl.signInWithGoogle(),
          throwsA(isA<ServerFailure>()),
        );
      },
    );
    test('should throw a ServerFailure when FirebaseAuth is Null ', () async {
      when(() => userCredential.user).thenReturn(null);
      final call = authRemoteDataSourceImpl.signInWithGoogle();

      await expectLater(call, throwsA(isA<ServerFailure>()));
    });
    test('Should throw Server Failure when FirebaseAuth Fails', () async {
      when(() => googleSignIn.signIn()).thenAnswer((_) async => googleUser);
      when(() => googleUser.authentication).thenAnswer((_) async => googleAuth);
      when(() => googleAuth.accessToken).thenReturn('access_token');
      final tException = FirebaseAuthException(
        code: 'user-disabled',
        message: 'This user account has been disabled.',
      );

      when(
        () => firebaseAuth.signInWithCredential(any()),
      ).thenThrow(tException);
      final call = authRemoteDataSourceImpl.signInWithGoogle;

      await expectLater(() => call(), throwsA(isA<ServerFailure>()));
      verify(() => googleSignIn.signIn()).called(1);
      verify(() => firebaseAuth.signInWithCredential(any())).called(1);
    });
  });
  group('get current user ', () {
    test('should return a UserEntity', () async {
      when(() => firebaseAuth.currentUser).thenAnswer((_) => user);
      when(() => user.uid).thenReturn('123');
      when(() => user.email).thenReturn('test@test.com');
      when(() => user.displayName).thenReturn('Test User');
      when(() => user.photoURL).thenReturn('url');
      when(() => user.emailVerified).thenReturn(true);
      when(() => user.isAnonymous).thenReturn(false);
      when(() => user.metadata).thenReturn(userMetadata);
      when(() => userMetadata.creationTime).thenReturn(DateTime(2023));
      final result = await authRemoteDataSourceImpl.getCurrentUser();
      expect(result, isA<UserModel>());
      verify(() => firebaseAuth.currentUser).called(1);
    });
    test('should return null when the user is not logged in', () async {
      when(() => firebaseAuth.currentUser).thenAnswer((_) => null);
      final result = await authRemoteDataSourceImpl.getCurrentUser();
      expect(result, null);
      verify(() => firebaseAuth.currentUser).called(1);
    });
    test(
      'should throw a ServerFailure when FirebaseAuth throws an exception',
      () async {
        when(
          () => firebaseAuth.currentUser,
        ).thenThrow(FirebaseAuthException(code: 'network_error'));
        final call = authRemoteDataSourceImpl.getCurrentUser();
        await expectLater(call, throwsA(isA<ServerFailure>()));
        verify(() => firebaseAuth.currentUser).called(1);
      },
    );
  });
  group('Sign out ', () {
    test('should sign out of Firebase and Google', () async {
      when(() => firebaseAuth.signOut()).thenAnswer((_) async => {});
      when(() => googleSignIn.signOut()).thenAnswer((_) async => null);
      await authRemoteDataSourceImpl.signOut();
      verify(() => firebaseAuth.signOut()).called(1);
      verify(() => googleSignIn.signOut()).called(1);
    });
    test(
      'should throw a ServerFailure when FirebaseAuth throws an exception',
      () async {
        when(
          () => firebaseAuth.signOut(),
        ).thenAnswer((_) async => FirebaseAuthException(code: 'network_error'));
        final call = authRemoteDataSourceImpl.signOut();
        await expectLater(call, throwsA(isA<ServerFailure>()));
        verify(() => firebaseAuth.signOut()).called(1);
        verify(() => googleSignIn.signOut()).called(1);
      },
    );
  });
}
