sealed class Result<T> {
  const Result();

  R when<R>(R Function(T value) onSuccess, R Function(Object error) onFailure);
  bool get isSuccess;
  T? get valueOrNull;
  Object? get errorOrNull;

  Result<R> map<R>(R Function(T value) mapper) => switch (this) {
    Success<T>(:final value) => Success<R>(mapper(value)),
    Failure<T>(:final error) => Failure<R>(error),
  };

  Result<R> flatMap<R>(Result<R> Function(T value) mapper) => switch (this) {
    Success<T>(:final value) => mapper(value),
    Failure<T>(:final error) => Failure<R>(error),
  };
}

final class Success<T> extends Result<T> {
  const Success(this.value);
  final T value;

  @override
  R when<R>(R Function(T) onSuccess, R Function(Object) onFailure) =>
      onSuccess(value);

  @override
  bool get isSuccess => true;

  @override
  T? get valueOrNull => value;

  @override
  Object? get errorOrNull => null;

  @override
  String toString() => 'Success($value)';
}

final class Failure<T> extends Result<T> {
  const Failure(this.error);
  final Object error;

  @override
  R when<R>(R Function(T) onSuccess, R Function(Object) onFailure) =>
      onFailure(error);

  @override
  bool get isSuccess => false;

  @override
  T? get valueOrNull => null;

  @override
  Object? get errorOrNull => error;

  @override
  String toString() => 'Failure($error)';
}
