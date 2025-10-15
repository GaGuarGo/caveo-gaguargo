import 'dart:async';
import 'package:caveo_gaguargo/shared/colors.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Timer _timer;
  double progress = 0.0;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        progress += 0.02;
        if (progress >= 1.0) {
          progress = 1.0;
          // context.goNamed(AppRouter.products);
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: progress),
          duration: const Duration(milliseconds: 300),
          builder: (context, value, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 200,
                  child: LinearProgressIndicator(
                    value: value,
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
                  'Carregando... ${(value * 100).toInt()}%',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: kSecondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
