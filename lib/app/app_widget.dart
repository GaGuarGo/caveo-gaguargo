import 'package:caveo_gaguargo/shared/router.dart';
import 'package:caveo_gaguargo/shared/theme.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Caveo Gaguargo',
      theme: AppTheme.theme,
      routerConfig: AppRouter.router,
    );
  }
}
