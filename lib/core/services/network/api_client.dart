import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weather_app/core/services/network/api_error_handler.dart';
import 'package:weather_app/core/services/network/api_error_model.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._();
  factory ApiClient() => _instance;
  final Dio _dio = Dio();

  /// attributes
  static final mainDomain = "https://api.openweathermap.org";
  final String _baseURL = "$mainDomain/data/2.5//";

  final String _acceptLanguage = "Accept-Language";
  // final String _authorization = "authorization";
  // var cancelToken = CancelToken();
  final timeOut = const Duration(seconds: 30);

  ApiClient._() {
    _dio.options = BaseOptions(
      baseUrl: _baseURL,
      receiveDataWhenStatusError: true,
      connectTimeout: timeOut,
      receiveTimeout: timeOut,
      sendTimeout: timeOut,
      validateStatus: (status) => (status ?? 500) < 400,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Charset': 'utf-8',
        _acceptLanguage: 'en',
      },
    );
    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true));
    }
  }
  void changeLocale(String languageCode) => _dio.options.headers[_acceptLanguage] = languageCode;

  Future<({Response? response, ApiErrorModel? error})> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    Response? response;
    try {
      response = await _dio.get(endpoint, queryParameters: queryParameters, options: Options(headers: headers));
      return (response: response, error: null);
    } on DioException catch (e) {
      shouldShowOfflineWidget(e.type);

      /// trigger bus event

      return (response: response, error: ApiErrorHandler.handle(e));
    } catch (e) {
      return _defaultError();
    }
  }

  Future<({Response? response, ApiErrorModel? error})> post({
    required String endpoint,
    required var requestBody,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Duration? customRequestDuration,
    void Function(int, int)? onSendProgress,
  }) async {
    Response? response;

    try {
      response = await _dio.post(
        endpoint,
        queryParameters: queryParameters,
        data: requestBody,
        onSendProgress: onSendProgress,
        options: Options(receiveTimeout: customRequestDuration, sendTimeout: customRequestDuration, headers: headers),
      );
      return (response: response, error: null);
    } on DioException catch (e) {
      shouldShowOfflineWidget(e.type);
      return (response: response, error: ApiErrorHandler.handle(e));
    } catch (e) {
      return _defaultError();
    }
  }

  ({Response? response, ApiErrorModel? error}) _defaultError() {
    return (response: null, error: ApiErrorModel(message: "Something went wrong"));
  }

  void shouldShowOfflineWidget(DioExceptionType e) {
    switch (e) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.connectionError:
        // NetworkConnectionBus.inst.networkDisconnected();
        break;
      default:
        return;
    }
  }
}
