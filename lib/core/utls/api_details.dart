import 'package:dio/dio.dart';


class ApiDetails {
  Dio dio = Dio();
  Future<List<dynamic>> get(
      {required String url, required String token}) async {
    var response = await dio.get(url,
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        
        }));
    return response.data;
  }
}
