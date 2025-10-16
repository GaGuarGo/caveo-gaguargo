import 'package:caveo_gaguargo/app_provider.dart';
import 'package:caveo_gaguargo/presenter/providers/splash/splash_notifier.dart';
import 'package:riverpod/legacy.dart';

final splashNotifierProvider = StateNotifierProvider(
  (ref) => SplashNotifier(
    productUsecase: ref.read(productUseCaseProvider),
  ),
);