import 'package:electronics_app/core/services/api_service.dart';
import 'package:electronics_app/features/authentication/data/models/user_model.dart';
import 'package:electronics_app/features/authentication/presentation/cubits/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AuthCubit extends Cubit<AuthState> {
  final ApiService _apiService;
  AuthCubit(this._apiService) : super(InitialAuthState());

  Future<void> login({required String email, required String password}) async {
    emit(LoadingLoginState());
    var response = await _apiService.post('login', {
      'email': email,
      'password': password,
    });
    if (response['state'] == false) {
      emit(FailureLoginState(errorMessage: response['message']));
      print(response);
    } else {
      print(response);
      emit(SuccessLoginState());
    }
  }

  Future<void> signup({required UserModel userModel}) async {
    emit(LoadingSignupState());
    var response = await _apiService.post('register', userModel.toJson());
    if (response['state'] == false) {
      emit(FailureSignupState(errorMessage: response['message']));
      print(response);
    } else {
      print(response);
      emit(SuccessSignupState());
    }
  }
}
