import 'package:caveo_gaguargo/presentation/pages/error/error_page.dart';
import 'package:caveo_gaguargo/presentation/pages/products/products_page.dart';
import 'package:caveo_gaguargo/presentation/pages/splash/splash_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static const String splash = '/';
  static const String products = '/products';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    errorBuilder: (context, state) => const ErrorPage(
      title: "Erro ao carregar a página",
      message: "Não foi possível encontrar a página solicitada.",
    ),
    routes: [
      GoRoute(
        path: splash,
        name: splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: products,
        name: products,
        builder: (context, state) => const ProductsPage(),
      ),
    ],
  );
}
