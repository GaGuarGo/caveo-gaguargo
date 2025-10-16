import 'package:caveo_gaguargo/core/client/interceptors/cache_interceptor.dart';
import 'package:caveo_gaguargo/core/environment/environment.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class CustomClient extends DioForNative {
  CustomClient()
    : super(
        BaseOptions(
          baseUrl: Environment.instance.api,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 60),
        ),
      ) {
    interceptors.addAll([PrettyDioLogger(), CacheInterceptor()]);
  }
}
