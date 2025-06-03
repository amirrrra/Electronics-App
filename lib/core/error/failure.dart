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

  factory ServerFailure.fromDioResponse(int? statusCode, response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(errMessage: '404 not found');
    } else {
      return ServerFailure(errMessage: 'Unexpected error, please try again');
    }
  }
}
