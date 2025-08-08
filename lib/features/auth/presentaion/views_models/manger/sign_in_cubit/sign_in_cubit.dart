import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/use_cases/sign_in_use_case.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.signInUseCase) : super(SignInInitial());
  final SignInUseCase signInUseCase;
  Future<void> signIn({required String email, required String password}) async {
    var authOperation = await signInUseCase.call(email, password);
    authOperation.fold(
      (failure) {
        emit(SignInFailure(errorMessage: failure.errorMessage));
      },
      (authOperation) {
        emit(SignInSuccess(userData: authOperation));
      },
    );
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();

    emit(SignInInitial());
  }
}
