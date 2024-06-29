import 'package:dio/dio.dart';

class ApiServiceUser {
  Dio dio = Dio();

  Future<Map<String, dynamic>> user(
      {required String url, required String token}) async {
    var response = await dio.get(
      url,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );
    return response.data;
  }
}
