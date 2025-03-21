import 'package:dio/dio.dart';
import 'package:weather_app/core/services/network/api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return ApiErrorModel(message: "Week or no connection");
      case DioExceptionType.cancel:
        return ApiErrorModel(message: "Request to the server was cancelled");
      case DioExceptionType.unknown:
        return ApiErrorModel(message: "Unknown error occurred");
      case DioExceptionType.badResponse:
        return ApiErrorModel.fromJson(error.response?.data);
      default:
        return ApiErrorModel(message: "Something went wrong");
    }
  }
}
