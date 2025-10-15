import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static Environment? _instance;
  final String api;

  Environment._internal({required this.api});

  factory Environment.load() {
    _instance ??= Environment._internal(api: dotenv.env['API'] ?? '');
    return _instance!;
  }
}
