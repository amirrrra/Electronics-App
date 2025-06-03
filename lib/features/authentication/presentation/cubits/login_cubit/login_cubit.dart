import 'package:electronics_app/features/authentication/data/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginState());

  final AuthRepo authRepo;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());
    var result = await authRepo.login(email, password);

    result.fold(
      (failure) => emit(LoginFailureState(failure.errMessage)),
      (success) => emit(LoginSuccessState()),
    );
  }
}
