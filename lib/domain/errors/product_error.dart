import 'package:dio/dio.dart';

class ProductError extends DioException {
  final String message;
  final int? statusCode;

  ProductError({
    required super.requestOptions,
    required this.message,
    this.statusCode,
  });
}
