import 'package:caveo_gaguargo/app_provider.dart';
import 'package:caveo_gaguargo/presenter/providers/product/product_notifier.dart';
import 'package:riverpod/legacy.dart';

final productNotifierProvider = StateNotifierProvider(
  (ref) => ProductNotifier(productUsecase: ref.read(productUseCaseProvider)),
);
