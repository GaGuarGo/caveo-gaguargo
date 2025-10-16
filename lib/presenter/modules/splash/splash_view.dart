import 'package:caveo_gaguargo/core/router/router.dart';
import 'package:caveo_gaguargo/core/theme/colors.dart';
import 'package:caveo_gaguargo/presenter/modules/error/error_view.dart';
import 'package:caveo_gaguargo/presenter/providers/splash/splash_provider.dart';
import 'package:caveo_gaguargo/presenter/providers/splash/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashView extends ConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(splashNotifierProvider);

    return state.when(
      initial: () => const SizedBox.shrink(),
      error: (message) => ErrorView(message: message),
      loading: () => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: 200,
              child: LinearProgressIndicator(
                color: Theme.of(context).primaryColorDark,
                minHeight: 8,
                backgroundColor: Theme.of(
                  context,
                ).primaryColorDark.withOpacity(0.3),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Carregando...',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: kSecondaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      loaded: (products) {
        context.goNamed(AppRouter.products, extra: products);
        return const SizedBox.shrink();
      },
    );
  }
}
