import 'dart:developer';

import 'package:dio/dio.dart';

class RequestLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('[---> Request] [${options.method.toUpperCase()}] ${options.uri} Body: ${options.data}, Headers: ${options.headers}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('[<--- Response (${response.statusCode})] ${response.requestOptions.uri} Data: ${response.data}, Headers: ${response.headers}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("[<--- Response (${err.response?.statusCode})] ${err.requestOptions.uri} Error: ${err.error}, Message: ${err.message} Headers: ${err.requestOptions.headers}");
    super.onError(err, handler);
  }
}
