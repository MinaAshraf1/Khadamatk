import 'package:dartz/dartz.dart';
import 'package:gradproject/Features/login/data/models/login_model.dart';
import 'package:gradproject/core/errors/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure, String>> login(LoginModel loginModel);
}
