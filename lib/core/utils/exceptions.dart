import 'dart:async';
import 'dart:io';

class ExceptionHandlers {
  getExceptionString(error) {
    if (error is SocketException) {
      return 'No Internet Connection';
    } else if (error is HttpException) {
      return 'Something Went Wrong. Try again Later';
    } else if (error is FormatException) {
      return "Invalid data format.";
    } else if (error is TimeoutException) {
      return "Poor Internet. Request Timed out";
    } else {
      return "Something Went Wrong Try again ";
    }
  }
}

class AppException implements Exception {
  final String message;
  AppException({required this.message});

  @override
  String toString() {
    return message;
  }
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException({required super.message});
}

class NotFoundException extends AppException {
  NotFoundException({required super.message});
}

class ApiNotResponding extends AppException {
  ApiNotResponding({required super.message});
}

class BadRequestException extends AppException {
  BadRequestException({required super.message});
}
