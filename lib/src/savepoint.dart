import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/src/promise.dart';
import 'package:deno_postgres_interop/src/util.dart';

// TODO:
@JS()
class Savepoint {
  factory Savepoint(
    String name,
    Future<void> Function(String name) updateCallback,
    Future<void> Function(String name) releaseCallback,
  ) =>
      callConstructor('Savepoint', [
        name,
        (String name) => futureToPromise(updateCallback(name)),
        (String name) => futureToPromise(releaseCallback(name)),
      ]);
}

extension SavepointProps on Savepoint {
  int get instancesCount => getProperty(this, 'instances');

  Future<void> release() => callFutureMethod(this, 'release');

  Future<void> update() => callFutureMethod(this, 'update');
}
