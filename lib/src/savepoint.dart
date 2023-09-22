import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/src/promise.dart';
import 'package:deno_postgres_interop/src/util.dart';

/// [deno-postgres@v​0.17.0/Savepoint](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Savepoint).
@JS()
class Savepoint {
  /// [deno-postgres@v​0.17.0/Savepoint/constructor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Savepoint#ctor_0).
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

/// [deno-postgres@v​0.17.0/Savepoint](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Savepoint).
extension SavepointProps on Savepoint {
  /// [deno-postgres@v​0.17.0/Savepoint/instances](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Savepoint#accessor_instances).
  int get instancesCount => getProperty(this, 'instances');

  /// [deno-postgres@v​0.17.0/Savepoint/instances](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Savepoint#method_release_0).
  Future<void> release() => callFutureMethod(this, 'release');

  /// [deno-postgres@v​0.17.0/Savepoint/instances](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Savepoint#method_update_0).
  Future<void> update() => callFutureMethod(this, 'update');
}
