import 'dart:js_util';

Future<T> callFutureMethod<T>(
  Object o,
  Object method, [
  List<Object?> args = const [],
]) =>
    promiseToFuture(
      callMethod(
        o,
        method,
        args,
      ),
    );
