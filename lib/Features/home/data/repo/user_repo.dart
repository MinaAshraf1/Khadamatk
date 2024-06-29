import 'package:dartz/dartz.dart';
import 'package:gradproject/Features/home/data/models/user_data.dart';
import 'package:gradproject/core/errors/failure.dart';

abstract class UserRepo {
  Future<Either<Failure, UserData>> user({required String token});
}
