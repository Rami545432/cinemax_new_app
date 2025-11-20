abstract class SocialMediaSignUpState {}

class SocialMediaSignUpInitial extends SocialMediaSignUpState {}

class SocialMediaSignUpSuccess extends SocialMediaSignUpState {}

class SocialMediaSignUpFailure extends SocialMediaSignUpState {
  final String errorMessage;

  SocialMediaSignUpFailure({required this.errorMessage});
}

class SocialMediaSignUpLoading extends SocialMediaSignUpState {}
