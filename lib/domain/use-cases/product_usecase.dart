import 'package:caveo_gaguargo/domain/entities/product_entity.dart';
import 'package:caveo_gaguargo/domain/repositories/product_repository.dart';

class ProductUsecase {
  final ProductRepository _repository;
  ProductUsecase({required ProductRepository repository})
    : _repository = repository;

  Future<List<ProductEntity>> fetchProducts() async {
    return (await _repository.getProducts()).fold(
      (products) => products,
      (error) => throw error,
    );
  }
}
