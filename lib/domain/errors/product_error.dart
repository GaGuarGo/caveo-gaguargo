import 'package:caveo_gaguargo/core/error/app_error.dart';

class ProductError implements AppError {
  @override
  final String message;

  @override
  final int? code;

  @override
  String toString() => message;

  ProductError({required this.message, this.code = 400});
}
