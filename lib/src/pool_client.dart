import 'dart:js_interop';

import 'package:deno_postgres_interop/src/client_configuration.dart';
import 'package:deno_postgres_interop/src/query_client.dart';

/// [deno-postgres@v0.17.0/PoolClient](https://deno.land/x/postgres@v0.17.0/mod.ts?s=PoolClient).
@JS()
class PoolClient extends QueryClient {
  /// [deno-postgres@v0.17.0/PoolClient/constructor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=PoolClient#ctor_0).
  external factory PoolClient(
    ClientConfiguration config,
    void Function() releaseCallback,
  );

  /// [deno-postgres@v0.17.0/PoolClient/constructor/release](https://deno.land/x/postgres@v0.17.0/mod.ts?s=PoolClient#method_release_0).
  external void release();
}
