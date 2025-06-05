import 'package:dio/dio.dart';

class ApiService {
  Dio dio = Dio();

  final String _baseUrl = 'https://ib.jamalmoallart.com/api/';

  Future<List<dynamic>> get(String endpoint) async {
    var response = await dio.get('${_baseUrl}v1/$endpoint');
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
     '${_baseUrl}v2/$endpoint',
      data: data,
      options: Options(
        headers: {
          'Accept': 'application/json',
          "Content-Type": "application/json",
        },
      ),
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Error occurred with response ${response.statusMessage}");

    }
  }
}
