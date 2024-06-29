import 'package:dartz/dartz.dart';
import 'package:gradproject/Features/details/data/models/details/details.dart';
import 'package:gradproject/core/errors/failure.dart';

abstract class DetailsRepo {
  Future<Either<Failure, List<Details>>> get(
      {required String url, required String token});
}
