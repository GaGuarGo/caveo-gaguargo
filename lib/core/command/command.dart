import 'package:caveo_gaguargo/core/error/app_error.dart';
import 'package:caveo_gaguargo/core/error/app_generic_error.dart';

class Command<E extends AppError> {
  Command(this._action);

  bool _running = false;
  bool get running => _running;

  AppError? _error;
  AppError? get error => _error;

  bool get hasError => _error != null;

  bool _completed = false;
  bool get completed => _completed;

  final Future<void> Function() _action;

  Future<void> execute() async {
    if (_running) {
      return;
    }

    _running = true;
    _completed = false;
    _error = null;

    try {
      await _action();
      _completed = true;
    } on E catch (error) {
      _error = error;
    } on Exception catch (error) {
      _error = AppGenericError(message: error.toString());
    } finally {
      _running = false;
    }
  }

  void clear() {
    _running = false;
    _error = null;
    _completed = false;
  }
}
