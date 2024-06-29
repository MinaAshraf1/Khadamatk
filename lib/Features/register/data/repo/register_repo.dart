import 'package:dartz/dartz.dart';

import 'package:gradproject/Features/register/data/models/register_model.dart';
import 'package:gradproject/core/errors/failure.dart';

abstract class RegisterRepo {
  Future<Either<Failure, String>> register(RegisterModel registerModel);
}
