import 'package:portfolio/core/models/result.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

abstract class NoParamUseCase<Type> {
  Future<Type> call();
}

abstract class StreamUseCase<Type> {
  const StreamUseCase();
  Stream<Result<Type>> call(Type params);
}
