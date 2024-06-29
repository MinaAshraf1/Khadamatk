import 'package:dio/dio.dart';

class ApiServiceSign {
  final Dio dio = Dio();

  Future<Response> sign(
      {required String url, required Map<String, dynamic> body}) async {
    var formData = FormData.fromMap(body);
    try {
      var response = await dio.post(
        url,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
      return response;
    } catch (e) {
      if (e is DioException) {
        rethrow;
      } else {
        throw Exception('Unexpected error occurred');
      }
    }
  }
}
