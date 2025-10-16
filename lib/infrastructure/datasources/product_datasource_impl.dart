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
      final Response(data: data) = await _client.get(
        '/products',
        options: Options(extra: {'useCache': true}),
      );
      return (data as List<dynamic>).cast<Map<String, dynamic>>();
    } on DioException catch (e) {
      throw ProductError(
        message:
            e.response?.data['message'] ??
            'Ocorreu um erro ao buscar os produtos',
        statusCode: e.response?.statusCode,
      );
    }
  }
}
