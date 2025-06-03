class SignupState {}

final class SignUpInitialState extends SignupState {}

final class SignUpLoadingState extends SignupState {}

final class SignUpSuccessState extends SignupState {}

final class SignUpFailureState extends SignupState {
  final String message;

  SignUpFailureState(this.message);
}
