import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gradproject/Features/login/data/models/login_model.dart';
import 'package:gradproject/Features/login/data/repo/login_repo.dart';
import 'package:gradproject/core/errors/failure.dart';
import 'package:gradproject/core/utls/api_sign.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiServiceSign apiServiceSign;

  LoginRepoImpl(this.apiServiceSign);

  @override
  Future<Either<Failure, String>> login(LoginModel loginModel) async {
    try {
      final response = await apiServiceSign.sign(
        url: 'http://graduationbroject.runasp.net/api/Account/login',
        body: loginModel.toJson(),
      );

      if (response.statusCode == 200) {
        return Right(response.data['token']);
      } else {
        print('object');
        return Left(ServerFailure(response.data['message'] ?? 'Unknown error'));
      }
    } catch (e) {
      print("youssef");
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
