import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with API server ");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout with api server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("receive timeout api server");
      case DioExceptionType.badCertificate:
        return ServerFailure("receive bad Certificate api server");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("request canceled");

      case DioExceptionType.connectionError:
        return ServerFailure("no internet connection");
      case DioExceptionType.unknown:
        return ServerFailure("un expected error,try again");
      default:
        return ServerFailure("un expected error,try again");
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure("your request not found, please try later");
    } else if (statusCode == 500) {
      return ServerFailure("internal server error,pleas try later");
    } else {
      return ServerFailure("Opps There was an error,please try again");
    }
  }
}
