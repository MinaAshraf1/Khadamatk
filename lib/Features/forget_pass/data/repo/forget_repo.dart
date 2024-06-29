import 'package:dartz/dartz.dart';

import 'package:gradproject/Features/forget_pass/data/models/forget_model.dart';
import 'package:gradproject/core/errors/failure.dart';

abstract class ForgetRepo {
  Future<Either<Failure, String>> forget(ForgetModel forgetModel);
}
