import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:gradproject/Features/forget_pass/data/models/forget_model.dart';
import 'package:gradproject/Features/forget_pass/data/repo/forget_repo.dart';
import 'package:gradproject/core/errors/failure.dart';
import 'package:gradproject/core/utls/api_sign.dart';

class ForgetRepoImpl implements ForgetRepo {
  final ApiServiceSign apiServiceSign;

  ForgetRepoImpl(this.apiServiceSign);

  @override
  Future<Either<Failure, String>> forget(ForgetModel forgetModel) async {
    try {
      final response = await apiServiceSign.sign(
        url: 'http://graduationbroject.runasp.net/api/Account/ForgetPassword',
        body: forgetModel.toJson(),
      );

      if (response.statusCode == 200) {
        return const Right('تم تغيير كلمة المرور بنجاح');
      } else {
        return Left(ServerFailure(response.data['message'] ?? 'خطأ غير معروف'));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
