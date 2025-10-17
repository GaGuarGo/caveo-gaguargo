import 'package:caveo_gaguargo/core/use-case/useCase.dart';
import 'package:caveo_gaguargo/domain/entities/product_entity.dart';
import 'package:caveo_gaguargo/domain/repositories/product_repository.dart';

class FetchProductUseCase implements UseCase<List<ProductEntity>, void> {
  final ProductRepository _repository;
  FetchProductUseCase({required ProductRepository repository})
    : _repository = repository;

  @override
  Future<List<ProductEntity>> call({void params}) async {
    return (await _repository.getProducts()).fold(
      (products) => products,
      (error) => throw error,
    );
  }
}
