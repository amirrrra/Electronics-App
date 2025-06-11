import 'package:dio/dio.dart';

class ApiService {
  Dio dio = Dio();

  final String _baseUrl = 'https://ib.jamalmoallart.com/api/';

  Future<List<dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? data,
  }) async {
    var response = await dio.get('$_baseUrl$endpoint', data: data);

    return response.data;
  }

  Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    var response = await dio.post(
      '${_baseUrl}v2/$endpoint',
      data: data,
      options: Options(
        headers: {
          'Accept': 'application/json',
          "Content-Type": "application/json",
        },
      ),
    );
    return response.data;
  }
}
