import 'package:caveo_gaguargo/core/client/custom_client.dart';
import 'package:caveo_gaguargo/data/datasources/product_datasource.dart';
import 'package:caveo_gaguargo/data/repositories/product_repository_impl.dart';
import 'package:caveo_gaguargo/domain/repositories/product_repository.dart';
import 'package:caveo_gaguargo/domain/use-cases/product_usecase.dart';
import 'package:caveo_gaguargo/infrastructure/datasources/product_datasource_impl.dart';
import 'package:riverpod/riverpod.dart';

final clientProvider = Provider<CustomClient>((ref) {
  return CustomClient();
});

final _productDataSourceProvider = Provider<ProductDataSource>((ref) {
  return ProductDatasourceImpl(client: ref.watch(clientProvider));
});

final _productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepositoryImpl(dataSource: ref.read(_productDataSourceProvider));
});

final productUseCaseProvider = Provider<ProductUsecase>((ref) {
  return ProductUsecase(repository: ref.read(_productRepositoryProvider));
});
