import 'package:dartz/dartz.dart';
import 'package:electronics_app/core/error/failure.dart';
import 'package:electronics_app/features/profile/data/models/user_profile_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserProfileModel>> fetchProfile(String? token);
}
