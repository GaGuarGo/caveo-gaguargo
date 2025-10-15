import 'package:caveo_gaguargo/app/app_widget.dart';
import 'package:caveo_gaguargo/presentation/pages/error/error_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  ErrorWidget.builder = (FlutterErrorDetails details) {
    if (kDebugMode) {
      return ErrorWidget(details.exception);
    }
    return const ErrorPage(title: "Erro inesperado", message: "Algo deu errado. Tente novamente mais tarde.");
  };

  runApp(const AppWidget());
}
