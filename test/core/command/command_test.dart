import 'package:caveo_gaguargo/core/error/app_error.dart';
import 'package:caveo_gaguargo/domain/errors/product_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:caveo_gaguargo/core/command/command.dart';

void main() {
  group('Command', () {
    test('should execute successfully', () async {
      var executed = false;

      final command = Command(() async {
        await Future.delayed(const Duration(milliseconds: 10));
        executed = true;
      });

      await command.execute();

      expect(command.running, isFalse);
      expect(command.completed, isTrue);
      expect(command.hasError, isFalse);
      expect(executed, isTrue);
    });

    test('should capture error during execution', () async {
      final command = Command<ProductError>(() async {
        throw ProductError(message: 'Simulated error');
      });

      await command.execute();

      expect(command.running, isFalse);
      expect(command.completed, isFalse);
      expect(command.hasError, isTrue);
      expect(command.error, isA<AppError>());
    });

    test('should prevent execution while already running', () async {
      var count = 0;

      final command = Command(() async {
        count++;
        await Future.delayed(const Duration(milliseconds: 50));
      });

      command.execute();
      command.execute();

      await Future.delayed(const Duration(milliseconds: 100));

      expect(count, equals(1));
    });

    test('should clear state with clear()', () async {
      final command = Command(() async {
        throw Exception('Simulated error');
      });

      await command.execute();
      command.clear();

      expect(command.running, isFalse);
      expect(command.completed, isFalse);
      expect(command.error, isNull);
      expect(command.hasError, isFalse);
    });
  });
}
