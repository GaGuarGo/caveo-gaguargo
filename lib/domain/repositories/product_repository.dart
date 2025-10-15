import 'package:caveo_gaguargo/domain/entities/product_entity.dart';
import 'package:caveo_gaguargo/domain/errors/product_error.dart';
import 'package:result_dart/result_dart.dart';

abstract class ProductRepository {
  Future<ResultDart<List<ProductEntity>, ProductError>> getProducts();
}
