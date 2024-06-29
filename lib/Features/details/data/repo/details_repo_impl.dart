import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gradproject/Features/details/data/models/details/details.dart';
import 'package:gradproject/Features/details/data/repo/details_repo.dart';
import 'package:gradproject/core/errors/failure.dart';
import 'package:gradproject/core/utls/api_details.dart';

class DetailsRepoImpl implements DetailsRepo {
  ApiDetails apiDetails = ApiDetails();

  @override
  Future<Either<Failure, List<Details>>> get({
    required String url,
    required String token,
  }) async {
    try {
      var result = await apiDetails.get(url: url, token: token);
      List<Details> all = [];
      for (var item in result) {
        all.add(Details.fromJson(item));
      }
      return Right(all);
    } catch (e) {
        if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
