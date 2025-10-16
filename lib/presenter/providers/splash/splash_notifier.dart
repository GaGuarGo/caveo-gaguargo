import 'package:caveo_gaguargo/core/command/command.dart';
import 'package:caveo_gaguargo/domain/entities/product_entity.dart';
import 'package:caveo_gaguargo/domain/use-cases/product_usecase.dart';
import 'package:caveo_gaguargo/presenter/providers/splash/splash_state.dart';
import 'package:riverpod/legacy.dart';

class SplashNotifier extends StateNotifier<SplashState> {
  final ProductUsecase _productUsecase;
  SplashNotifier({required ProductUsecase productUsecase})
    : _productUsecase = productUsecase,
      super(const SplashInitial()) {
    loadApp();
  }

  late final Command _loadProductsCommand;

  Future<void> loadApp() async {
    late List<ProductEntity> products;

    _loadProductsCommand = Command(() async {
      products = await _productUsecase.fetchProducts();
    });

    state = SplashState.loading();

    await _loadProductsCommand.execute();

    if (_loadProductsCommand.completed) {
      state = SplashState.loaded(products: products);
    }

    if (_loadProductsCommand.hasError) {
      state = SplashState.error(message: _loadProductsCommand.error.toString());
    }
  }
}
