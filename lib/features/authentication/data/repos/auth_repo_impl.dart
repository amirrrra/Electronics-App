import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:electronics_app/core/error/failure.dart';
import 'package:electronics_app/features/authentication/data/models/user_model.dart';
import 'package:electronics_app/features/authentication/data/repos/auth_repo.dart';
import 'package:electronics_app/services/api_service.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiService apiService;
  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, void>> login(String email, String password) async {
    try {
      await apiService.post('login', {"email": email, "password": password});
      return const Right(null);
    } catch (e) {
      log(
        ' Exception in AuthRepoImpl.signIn: '
        '${e.toString()}',
      );
      return Left(ServerFailure(errMessage: 'Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, void>> signup(UserModel userModel) async {
    try {
      await apiService.post('register', userModel.toJson());
      return const Right(null);
    } catch (e) {
      log(
        ' Exception in AuthRepoImpl.signUp: '
        '${e.toString()}',
      );
      return Left(ServerFailure(errMessage: 'Something went wrong'));
    }
  }
}
