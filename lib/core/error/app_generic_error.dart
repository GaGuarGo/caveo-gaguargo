import 'package:caveo_gaguargo/core/error/app_error.dart';

class AppGenericError implements AppError {
  @override
  final String message;

  @override
  final int code;

  AppGenericError({required this.message, this.code = 500});
}
