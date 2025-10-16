
import 'package:caveo_gaguargo/presenter/modules/error/error_view.dart';
import 'package:caveo_gaguargo/presenter/modules/products/products_view.dart';
import 'package:caveo_gaguargo/presenter/modules/splash/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static const String splash = '/';
  static const String products = '/products';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    errorBuilder: (context, state) => const ErrorView(
      title: "Erro ao carregar a página",
      message: "Não foi possível encontrar a página solicitada.",
    ),
    routes: [
      GoRoute(
        path: splash,
        name: splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: products,
        name: products,
        builder: (context, state) => const ProductsView(),
      ),
    ],
  );
}
