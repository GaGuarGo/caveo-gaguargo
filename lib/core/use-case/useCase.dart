// ignore_for_file: file_names

abstract class UseCase<R, P> {
  Future<R> call({P? params});
}
