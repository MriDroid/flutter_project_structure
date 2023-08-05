import 'package:dio/dio.dart';

class ServerException implements Exception {
  final String message;

  const ServerException(this.message);

  @override
  String toString() {
    return message;
  }

  factory ServerException.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerException('Connection Timeout');

      case DioExceptionType.sendTimeout:
        return const ServerException('Send Timeout');

      case DioExceptionType.receiveTimeout:
        return const ServerException('Receive Timeout');

      case DioExceptionType.badCertificate:
        return const ServerException('Bad Certificate');

      case DioExceptionType.badResponse:
        return ServerException.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);

      case DioExceptionType.cancel:
        return const ServerException('Request to ApiServer was Canceled');

      case DioExceptionType.connectionError:
        return const ServerException(
            'Request Connection Error, Please Try Again Later!');

      case DioExceptionType.unknown:
        if (dioException.error.toString().contains('SocketException')) {
          return const ServerException('No Internet Connection');
        }
        return ServerException(
            dioException.message ?? 'Unexpected Error, Please Try Again!');

      default:
        return const ServerException(
            'Ops There was as Error, Please Try Again Later!');
    }
  }

  factory ServerException.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerException(response['error']['message']);
    } else if (statusCode == 404) {
      return const ServerException(
          'Your Request not Found, Please Try Again Later!');
    } else if (statusCode == 500) {
      return const ServerException(
          'Internal Server Error, Please Try Again Later!');
    } else {
      return const ServerException(
          'Ops There was as Error, Please Try Again Later!');
    }
  }
}
