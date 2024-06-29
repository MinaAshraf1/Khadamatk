import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gradproject/Features/home/data/models/user_data.dart';
import 'package:gradproject/Features/home/data/repo/user_repo.dart';
import 'package:gradproject/core/errors/failure.dart';
import 'package:gradproject/core/utls/api_user.dart';

class UserRepoImpl implements UserRepo {
  ApiServiceUser apiServiceUser = ApiServiceUser();

  @override
  Future<Either<Failure, UserData>> user({required String token}) async {
    try {
      var response = await apiServiceUser.user(
        url: "http://graduationbroject.runasp.net/api/Account/ShowUser",
        token: token,
      );
      UserData userData = UserData.fromJson(response);
      return right(userData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
