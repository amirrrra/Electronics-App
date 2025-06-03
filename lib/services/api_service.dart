import 'package:dio/dio.dart';

class ApiService {
  Dio dio = Dio();

  final String _baseUrl = 'https://ib.jamalmoallart.com/api/v1/';

  Future<Map<String, dynamic>> get(
    String endpoint,
  ) async {
    var response = await dio.get(
      '$_baseUrl$endpoint',
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Error occurred with response ${response.statusCode}");
    }
  }

  Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    var response = await dio.post(
      '$_baseUrl$endpoint',
      data: data,
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Error occurred with response ${response.statusCode}");
    }
  }
}
