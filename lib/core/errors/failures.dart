import 'package:dio/dio.dart';

abstract class Failures {
  final String errmessage;

  Failures({required this.errmessage});
}

class ServerFailure extends Failures {
  ServerFailure({required super.errmessage});
  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errmessage: "Connection timeout");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errmessage: "Send timeout");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errmessage: "receive timeout");
      case DioExceptionType.badCertificate:
        return ServerFailure(errmessage: "certificate Error");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errmessage: "Connection cancelling");
      case DioExceptionType.connectionError:
        return ServerFailure(errmessage: "Connection error");
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure(errmessage: "No internet connection");
        }
        return ServerFailure(errmessage: "unknown error");
      default:

        return ServerFailure(
            errmessage: "Oops There was an error, Please try again");
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 402) {
      return ServerFailure(errmessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(errmessage: "try again");
    } else if (statusCode == 500) {
      return ServerFailure(errmessage: "try later");
    } else {
      
      return ServerFailure(
          errmessage: "Oops There was an error, Please try again");
    }
  }
}
