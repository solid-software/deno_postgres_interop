import 'dart:js_interop';

import 'package:deno_postgres_interop/src/client_configuration.dart';
import 'package:deno_postgres_interop/src/query_client.dart';

/// [deno-postgres@v​0.17.0/PoolClient](https://deno.land/x/postgres@v0.17.0/mod.ts?s=PoolClient).
@JS('PoolClient')
extension type PoolClient._(JSObject _) implements QueryClient, JSObject {
  /// [deno-postgres@v​0.17.0/PoolClient/constructor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=PoolClient#ctor_0).
  factory PoolClient(
    ClientConfiguration config,
    void Function() releaseCallback,
  ) => PoolClient._internal(config, releaseCallback.toJS);

  @JS('PoolClient')
  external factory PoolClient._internal(
    ClientConfiguration config,
    JSFunction releaseCallback,
  );

  /// [deno-postgres@v​0.17.0/PoolClient/constructor/release](https://deno.land/x/postgres@v0.17.0/mod.ts?s=PoolClient#method_release_0).
  external void release();
}
