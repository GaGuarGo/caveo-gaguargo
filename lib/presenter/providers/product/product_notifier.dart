import 'package:caveo_gaguargo/core/command/command.dart';
import 'package:caveo_gaguargo/domain/entities/product_entity.dart';
import 'package:caveo_gaguargo/domain/use-cases/product_usecase.dart';
import 'package:caveo_gaguargo/presenter/providers/product/product_state.dart';
import 'package:riverpod/legacy.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  final ProductUsecase _productUsecase;
  ProductNotifier({required ProductUsecase productUsecase})
    : _productUsecase = productUsecase,
      super(const ProductState.initial(products: []));

  void setProducts(List<ProductEntity> products) {
    state = ProductState.loaded(products: products);
  }

  late Command _loadProductsCommand;

  void loadMoreProducts() async {
    late List<ProductEntity> products;

    _loadProductsCommand = Command(() async {
      products = await _productUsecase.fetchProducts();
    });

    state = const ProductState.loading();

    await _loadProductsCommand.execute();

    if (_loadProductsCommand.completed) {
      state = ProductState.loaded(products: products);
    }

    if (_loadProductsCommand.hasError) {
      state = ProductState.error(
        message: _loadProductsCommand.error.toString(),
      );
    }
  }
}
