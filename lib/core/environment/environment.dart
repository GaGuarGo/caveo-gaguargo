import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static Environment? _instance;
  Environment._internal({required this.api});

  final String api;

  factory Environment.load() {
    _instance ??= Environment._internal(api: dotenv.env['API'] ?? '');
    return _instance!;
  }

  static Environment get instance {
    if (_instance == null) {
      throw Exception(
        'Environment não foi inicializado. Chame Environment.load() primeiro.',
      );
    }
    return _instance!;
  }
}
