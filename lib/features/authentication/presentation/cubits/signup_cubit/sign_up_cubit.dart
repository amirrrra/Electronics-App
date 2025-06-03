import 'package:electronics_app/features/authentication/data/models/user_model.dart';
import 'package:electronics_app/features/authentication/data/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_up_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupState());

  final AuthRepo authRepo;

  Future<void> signUp({required UserModel userModel}) async {
    emit(SignUpLoadingState());
    var result = await authRepo.signup(userModel);

    result.fold(
      (failure) => emit(SignUpFailureState(failure.errMessage)),
      (success) => emit(SignUpSuccessState()),
    );
  }
}
