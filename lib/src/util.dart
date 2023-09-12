import 'dart:js_util';

/// Convinience wrapper for [promiseToFuture] and [callMethod].
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
