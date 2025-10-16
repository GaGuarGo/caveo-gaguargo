import 'dart:async';
import 'dart:developer';

import 'package:caveo_gaguargo/app_widget.dart';
import 'package:caveo_gaguargo/core/environment/environment.dart';
import 'package:caveo_gaguargo/presenter/modules/error/error_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      ErrorWidget.builder = (FlutterErrorDetails details) {
        if (kDebugMode) {
          return ErrorWidget(details.exception);
        }
        return const ErrorView(
          title: "Ops! Ocorreu um erro durante sua sessão",
          message:
              "Algo deu errado. Nãos se preocupe, estamos trabalhando nisso.",
        );
      };

      await dotenv.load(fileName: ".env");

      Environment.load();
      runApp(ProviderScope(child: const AppWidget()));
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
