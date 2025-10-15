import 'package:caveo_gaguargo/data/datasources/product_datasource.dart';
import 'package:caveo_gaguargo/data/dtos/product_dto.dart';
import 'package:caveo_gaguargo/domain/entities/product_entity.dart';
import 'package:caveo_gaguargo/domain/errors/product_error.dart';
import 'package:caveo_gaguargo/domain/repositories/product_repository.dart';
import 'package:result_dart/result_dart.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource _dataSource;

  ProductRepositoryImpl({required ProductDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<ResultDart<List<ProductEntity>, ProductError>> getProducts() async {
    try {
      final products = (await _dataSource.fetchProducts())
          .map((dto) => ProductEntity.fromDto(ProductDto.fromJson(dto)))
          .toList();

      return Success(products);
    } on ProductError catch (e) {
      return Failure(e);
    }
  }
}
