import 'package:dartz/dartz.dart';
import 'package:electronics_app/core/error/failure.dart';
import 'package:electronics_app/features/authentication/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure,void>> login(String email, String password);
  Future<Either<Failure,void>> signup(UserModel userModel);
}