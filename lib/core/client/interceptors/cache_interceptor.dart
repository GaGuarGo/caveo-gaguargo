import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheInterceptor extends Interceptor {
  final Map<String, Response> _memoryCache = {};
  final Duration cacheDuration;

  CacheInterceptor({this.cacheDuration = const Duration(minutes: 10)});

  Future<SharedPreferences> get _sp async =>
      await SharedPreferences.getInstance();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final key = options.uri.toString();

    if (options.extra['useCache'] == true) {
      if (_memoryCache.containsKey(key)) {
        handler.resolve(_memoryCache[key]!);
        return;
      }

      final prefs = await _sp;
      final cachedData = prefs.getString(key);

      if (cachedData != null) {
        final cachedMap = jsonDecode(cachedData);
        final timestamp = DateTime.parse(cachedMap['timestamp']);
        final isExpired = DateTime.now().difference(timestamp) > cacheDuration;

        if (!isExpired) {
          final cachedResponse = Response(
            requestOptions: options,
            data: cachedMap['data'],
            statusCode: 200,
          );

          _memoryCache[key] = cachedResponse;
          handler.resolve(cachedResponse);
          return;
        } else {
          await prefs.remove(key);
        }
      }
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final key = response.requestOptions.uri.toString();

    if (response.requestOptions.extra['useCache'] == true &&
        response.statusCode! >= 200) {
      _memoryCache[key] = response;

      final prefs = await _sp;
      final cachedMap = {
        'timestamp': DateTime.now().toIso8601String(),
        'data': response.data,
      };
      await prefs.setString(key, jsonEncode(cachedMap));
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final key = err.requestOptions.uri.toString();

    if (err.requestOptions.extra['useCache'] == true &&
        _memoryCache.containsKey(key)) {
      handler.resolve(_memoryCache[key]!);
      return;
    }

    super.onError(err, handler);
  }

  Future<void> clearCache() async {
    _memoryCache.clear();
    final prefs = await _sp;
    await prefs.clear();
  }
}
