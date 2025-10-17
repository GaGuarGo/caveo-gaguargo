import 'package:flutter/cupertino.dart';

abstract interface class AppError {
  final String message;
  final int? code;

  AppError({required this.message, this.code = 400});

  @override
  @protected
  String toString() => message;
}
