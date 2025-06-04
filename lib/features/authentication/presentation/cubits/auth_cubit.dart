import 'package:electronics_app/features/authentication/data/models/user_model.dart';
import 'package:electronics_app/features/authentication/data/repos/auth_repo.dart';
import 'package:electronics_app/features/authentication/presentation/cubits/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;
  AuthCubit(this._authRepo) : super(InitialAuthState());

  Future<void> login({required String email, required String password}) async {
    emit(LoadingLoginState());
    var result = await _authRepo.login(email, password);
    result.fold(
      (failure) => emit(FailureLoginState(errorMessage: failure.errMessage)),
      (_) => emit(SuccessLoginState()),
    );
  }

  Future<void> signup({required UserModel userModel}) async {
    emit(LoadingSignupState());
    var result = await _authRepo.signup(userModel);
    result.fold(
      (failure) => emit(FailureSignupState(errorMessage: failure.errMessage)),
      (_) => emit(SuccessSignupState()),
    );
  }
}
