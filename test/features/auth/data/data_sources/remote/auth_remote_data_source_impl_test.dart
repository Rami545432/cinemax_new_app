import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/features/auth/data/data_sources/remote/auth_remote_data_source_impl.dart';
import 'package:movify/features/auth/data/models/user_model.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUser extends Mock implements User {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

class MockGoogleSignInAuthentication extends Mock
    implements GoogleSignInAuthentication {}

class MockUserCredential extends Mock implements UserCredential {}

class FakeAuthCredential extends Fake implements AuthCredential {}

class MockUserMetadata extends Mock implements UserMetadata {}

void main() {
  late AuthRemoteDataSourceImpl dataSource;
  late MockGoogleSignInAccount mockGoogleUser;
  late MockGoogleSignInAuthentication mockGoogleAuth;
  late MockUserCredential mockCredential;
  late MockUser mockUser;
  late MockFirebaseAuth mockFirebaseAuth;
  late MockGoogleSignIn mockGoogleSignIn;
  late MockUserMetadata mockUserMetadata;

  setUp(() {
    registerFallbackValue(FakeAuthCredential());
    mockUserMetadata = MockUserMetadata();
    mockCredential = MockUserCredential();
    mockGoogleUser = MockGoogleSignInAccount();
    mockGoogleAuth = MockGoogleSignInAuthentication();
    mockUser = MockUser();
    mockFirebaseAuth = MockFirebaseAuth();
    mockGoogleSignIn = MockGoogleSignIn();
    dataSource = AuthRemoteDataSourceImpl(
      firebaseAuth: mockFirebaseAuth,
      googleSignIn: mockGoogleSignIn,
    );
  });

  group('signInWithGoogle', () {
    test(
      'should return a UserEntity when Google Sign-In is successful',
      () async {
        when(
          () => mockGoogleSignIn.signIn(),
        ).thenAnswer((_) async => mockGoogleUser);
        when(
          () => mockGoogleUser.authentication,
        ).thenAnswer((_) async => mockGoogleAuth);
        when(() => mockGoogleAuth.accessToken).thenReturn('access token');
        when(() => mockGoogleAuth.idToken).thenReturn('id token');
        when(
          () => mockFirebaseAuth.signInWithCredential(any()),
        ).thenAnswer((_) async => mockCredential);
        when(() => mockCredential.user).thenReturn(mockUser);

        when(() => mockUser.uid).thenReturn('123');
        when(() => mockUser.email).thenReturn('test@test.com');
        when(() => mockUser.displayName).thenReturn('Test User');
        when(() => mockUser.photoURL).thenReturn('url');
        when(() => mockUser.emailVerified).thenReturn(true);
        when(() => mockUser.isAnonymous).thenReturn(false);
        when(() => mockUser.metadata).thenReturn(mockUserMetadata);
        when(() => mockUserMetadata.creationTime).thenReturn(DateTime(2023));

        final result = await dataSource.signInWithGoogle();

        expect(result, isA<UserModel>());
        verify(() => mockFirebaseAuth.signInWithCredential(any())).called(1);
      },
    );

    test(
      'should throw a ServerFailure when Google Sign-In returns null (user manual cancel)',
      () async {
        // Arrange: If a user closes the Google pop-up, googleSignIn.signIn() returns null.
        when(() => mockGoogleSignIn.signIn()).thenAnswer((_) async => null);

        // Act & Assert: We expect the Try block to catch the null and throw a ServerFailure!
        expect(
          () => dataSource.signInWithGoogle(),
          throwsA(isA<ServerFailure>()),
        );
        verify(() => mockGoogleSignIn.signIn()).called(1);
        verifyNever(() => mockFirebaseAuth.signInWithCredential(any()));
      },
    );
  });

  group('signOut', () {
    test('should call signOut on FirebaseAuth', () async {
      when(() => mockFirebaseAuth.signOut()).thenAnswer((_) async => {});
      when(
        () => mockGoogleSignIn.signOut(),
      ).thenAnswer((_) async => mockGoogleUser);

      await dataSource.signOut();

      verify(() => mockFirebaseAuth.signOut()).called(1);
    });

    test('should call signOut on GoogleSignIn', () async {
      when(() => mockFirebaseAuth.signOut()).thenAnswer((_) async => {});
      when(
        () => mockGoogleSignIn.signOut(),
      ).thenAnswer((_) async => mockGoogleUser);

      await dataSource.signOut();

      verify(() => mockGoogleSignIn.signOut()).called(1);
    });
  });
}
