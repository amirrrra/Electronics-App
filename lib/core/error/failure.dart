import 'package:dio/dio.dart';

class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'connectionTimeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'sendTimeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'receiveTimeout');
      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: 'badCertificate');
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'The request is cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: 'No Internet Connection');
      case DioExceptionType.badResponse:
        return ServerFailure.fromDioResponse(
          dioException.response?.statusCode,
          dioException.response,
        );
      default:
        return ServerFailure(errMessage: 'Unexpected error, please try again');
    }
  }

  factory ServerFailure.fromDioResponse(int? statusCode, Response? response) {
    try {
      final responseData = response?.data;

      if (responseData is Map<String, dynamic>) {
        if (responseData.containsKey('data') &&
            responseData['data'] is String &&
            responseData['data'].toString().isNotEmpty) {
          return ServerFailure(errMessage: responseData['data']);
        }

        if (responseData.containsKey('message') &&
            responseData['message'] is String) {
          return ServerFailure(errMessage: responseData['message']);
        }
      }

      if (statusCode == 404) {
        return ServerFailure(errMessage: '404 Not Found');
      } else if (statusCode == 500) {
        return ServerFailure(errMessage: 'Internal Server Error');
      } else {
        return ServerFailure(errMessage: 'Unexpected error, please try again');
      }
    } catch (e) {
      return ServerFailure(errMessage: 'Failed to parse error message');
    }
  }
}
