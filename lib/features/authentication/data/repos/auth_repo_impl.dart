import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:electronics_app/core/error/failure.dart';
import 'package:electronics_app/core/services/api_service.dart';
import 'package:electronics_app/features/authentication/data/models/user_model.dart';
import 'package:electronics_app/features/authentication/data/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiService apiService;
  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, void>> login(String email, String password) async {
    try {
      await apiService.post('login', {"email": email, "password": password});
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signup(UserModel userModel) async {
    try {
      await apiService.post('register', userModel.toJson());
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(Failure(errMessage: e.toString()));
    }
  }
}
