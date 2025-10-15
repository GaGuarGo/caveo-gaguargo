import 'dart:async';
import 'dart:developer';

import 'package:caveo_gaguargo/app/app_widget.dart';
import 'package:caveo_gaguargo/presentation/pages/error/error_page.dart';
import 'package:caveo_gaguargo/shared/environment.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      ErrorWidget.builder = (FlutterErrorDetails details) {
        if (kDebugMode) {
          return ErrorWidget(details.exception);
        }
        return const ErrorPage(
          title: "Erro inesperado",
          message: "Algo deu errado. Tente novamente mais tarde.",
        );
      };

      await dotenv.load(fileName: ".env");

      Environment.load();
      runApp(const AppWidget());
    },
    (error, stackTrace) {
      log(
        'Erro não capturado',
        error: error,
        stackTrace: stackTrace,
        name: 'MAIN',
      );
    },
  );
}
