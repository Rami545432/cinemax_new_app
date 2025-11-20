// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../domain/use_cases/sign_in_with_facebook_use_case.dart';
// import '../../../../domain/use_cases/sign_in_with_google_use_case.dart';
// import 'social_media_sign_up_state.dart';

// class SocialMediaSignUpCubit extends Cubit<SocialMediaSignUpState> {
//   SocialMediaSignUpCubit(this.googleSignInUseCase, this.facebookSignInUseCase)
//     : super(SocialMediaSignUpInitial());
//   final GoogleSignInUseCase googleSignInUseCase;
//   final SignInWithFacebookUseCase facebookSignInUseCase;
//   Future<void> signInWithGoolge() async {
//     emit(SocialMediaSignUpLoading());
//     var stateus = await googleSignInUseCase.call();
//     stateus.fold(
//       (failure) {
//         emit(SocialMediaSignUpFailure(errorMessage: failure.errorMessage));
//       },
//       (stateus) {
//         emit(SocialMediaSignUpSuccess());
//       },
//     );
//   }

//   Future<void> signInWithFacebook() async {
//     emit(SocialMediaSignUpLoading());
//     var stateus = await facebookSignInUseCase.call();
//     stateus.fold(
//       (failure) {
//         emit(SocialMediaSignUpFailure(errorMessage: failure.errorMessage));
//       },
//       (stateus) {
//         emit(SocialMediaSignUpSuccess());
//       },
//     );
//   }
// }
