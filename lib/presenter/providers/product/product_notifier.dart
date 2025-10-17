import 'package:caveo_gaguargo/core/command/command.dart';
import 'package:caveo_gaguargo/core/use-case/useCase.dart';
import 'package:caveo_gaguargo/domain/entities/product_entity.dart';
import 'package:caveo_gaguargo/domain/errors/product_error.dart';
import 'package:caveo_gaguargo/domain/use-cases/product_usecase.dart';
import 'package:caveo_gaguargo/presenter/providers/product/product_state.dart';
import 'package:riverpod/legacy.dart';

//* OBS: Lógica adpatada para paginação simples devido falta de estrutura na api --- IGNORE ---

class ProductNotifier extends StateNotifier<ProductState> {
  final UseCase<List<ProductEntity>, void> _productUsecase;
  ProductNotifier({required ProductUsecase productUsecase})
    : _productUsecase = productUsecase,
      super(const ProductState.initial(products: []));

  List<ProductEntity> _allProducts = [];
  int _currentPage = 0;
  final int _pageSize = 10;

  void setProducts(List<ProductEntity> products) {
    _allProducts = products;
    _currentPage = 1;
    Future.microtask(() {
      state = ProductState.loaded(products: _getCurrentPageProducts());
    });
  }

  late Command<ProductError> _loadProductsCommand;

  Future<void> loadMoreProducts() async {
    if (_allProducts.isEmpty) {
      state = const ProductState.loading();
      late List<ProductEntity> products;
      _loadProductsCommand = Command<ProductError>(() async {
        products = await _productUsecase.call();
      });
      await _loadProductsCommand.execute();

      if (_loadProductsCommand.completed) {
        _allProducts = products;
        _currentPage = 1;
        await Future.microtask(() {
          state = ProductState.loaded(products: _getCurrentPageProducts());
        });
      }

      if (_loadProductsCommand.hasError) {
        await Future.microtask(() {
          state = ProductState.error(
            message: _loadProductsCommand.error.toString(),
          );
        });
      }
    } else {
      if (_currentPage * _pageSize < _allProducts.length) {
        _currentPage++;
        await Future.microtask(() {
          state = ProductState.loaded(products: _getCurrentPageProducts());
        });
      }
    }
  }

  List<ProductEntity> _getCurrentPageProducts() {
    final end = (_currentPage * _pageSize).clamp(0, _allProducts.length);
    return _allProducts.sublist(0, end);
  }
}
