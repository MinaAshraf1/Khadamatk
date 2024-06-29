import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:gradproject/Features/register/data/models/register_model.dart';
import 'package:gradproject/Features/register/data/repo/register_repo.dart';

import 'package:gradproject/core/errors/failure.dart';
import 'package:gradproject/core/utls/api_sign.dart';

class RegisterRepoImpl implements RegisterRepo {
  final ApiServiceSign apiServiceSign;

  RegisterRepoImpl(this.apiServiceSign);

  @override
  Future<Either<Failure, String>> register(RegisterModel registerModel) async {
    try {
      final response = await apiServiceSign.sign(
        url: 'http://graduationbroject.runasp.net/api/Account/Register',
        body: registerModel.toJson(),
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
