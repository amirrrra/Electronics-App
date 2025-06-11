import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:electronics_app/core/error/failure.dart';
import 'package:electronics_app/features/profile/data/models/user_profile_model.dart';
import 'package:electronics_app/features/profile/data/repos/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  @override
  Future<Either<Failure, UserProfileModel>> fetchProfile(String? token) async {
    Dio dio = Dio();
    try {
      var response = await dio.get(
        'https://ib.jamalmoallart.com/api/v2/profile',
        data: {'token': token},
      );
      final user = UserProfileModel.fromJson(response.data['data']);
      return right(user);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(Failure(errMessage: e.toString()));
      }
    }
  }
}
