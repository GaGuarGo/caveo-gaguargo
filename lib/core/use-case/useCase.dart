// ignore_for_file: file_names

abstract class UseCase<R, P extends Params> {
  Future<R> call({P? params});
}

abstract class Params {
  const Params();
}

abstract class NoParams extends Params {
  const NoParams();
}