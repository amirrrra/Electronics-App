import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:electronics_app/core/error/failure.dart';
import 'package:electronics_app/core/services/api_service.dart';
import 'package:electronics_app/core/services/prefs_token.dart';
import 'package:electronics_app/features/authentication/data/models/user_model.dart';
import 'package:electronics_app/features/authentication/data/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiService apiService;
  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, void>> login(String email, String password) async {
    try {
      final response = await apiService.post('login', {
        "email": email,
        "password": password,
      });
      var token = response['data']['token'];
      saveToken(token);
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

  @override
  Future<Either<Failure, void>> logout(String token) async {
    Dio dio = Dio();
    try {
      await dio.get(
        'https://ib.jamalmoallart.com/api/v2/logout',
        queryParameters: {'token': token},
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(Failure(errMessage: e.toString()));
    }
  }
}
