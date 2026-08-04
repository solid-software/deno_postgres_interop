import 'dart:js_interop';

import 'package:deno_postgres_interop/src/promise.dart';

/// [deno-postgres@v​0.17.0/Savepoint](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Savepoint).
@JS('Savepoint')
extension type Savepoint._(JSObject _) implements JSObject {
  /// [deno-postgres@v​0.17.0/Savepoint/constructor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Savepoint#ctor_0).
  factory Savepoint(
    String name,
    Future<void> Function(String name) updateCallback,
    Future<void> Function(String name) releaseCallback,
  ) =>
      Savepoint._internal(
        name,
        ((JSString name) => futureToPromise(updateCallback(name.toDart))).toJS,
        ((JSString name) => futureToPromise(releaseCallback(name.toDart))).toJS,
      );

  @JS('Savepoint')
  external factory Savepoint._internal(
    String name,
    JSFunction updateCallback,
    JSFunction releaseCallback,
  );

  /// [deno-postgres@v​0.17.0/Savepoint/instances](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Savepoint#accessor_instances).
  @JS('instances')
  external int get instancesCount;

  @JS('release')
  external JSPromise<JSAny?> _release();

  /// [deno-postgres@v​0.17.0/Savepoint/instances](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Savepoint#method_release_0).
  Future<void> release() async {
    await _release().toDart;
  }

  @JS('update')
  external JSPromise<JSAny?> _update();

  /// [deno-postgres@v​0.17.0/Savepoint/instances](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Savepoint#method_update_0).
  Future<void> update() async {
    await _update().toDart;
  }
}
