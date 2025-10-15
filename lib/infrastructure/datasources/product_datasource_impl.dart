import 'package:caveo_gaguargo/core/client/custom_client.dart';
import 'package:caveo_gaguargo/domain/errors/product_error.dart';
import 'package:caveo_gaguargo/data/datasources/product_datasource.dart';
import 'package:dio/dio.dart';

class ProductDatasourceImpl implements ProductDataSource {
  final CustomClient _client;
  ProductDatasourceImpl({required CustomClient client}) : _client = client;

  @override
  Future<List<Map<String, dynamic>>> fetchProducts() async {
    try {
      final Response(data: data) = await _client.get('/products');
      return data;
    } on DioException catch (e) {
      throw ProductError(
        requestOptions: e.requestOptions,
        message:
            e.response?.data['message'] ??
            'Ocorreu um erro ao buscar os produtos',
        statusCode: e.response?.statusCode,
      );
    }
  }
}
