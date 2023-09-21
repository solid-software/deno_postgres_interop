import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/src/client_configuration.dart';
import 'package:deno_postgres_interop/src/promise.dart';
import 'package:deno_postgres_interop/src/transport.dart';
import 'package:deno_postgres_interop/src/util.dart';

/// [deno-postgres@v0.17.0/Connection](https://deno.land/x/postgres@v0.17.0/connection/connection.ts?s=Connection).
@JS()
class Connection {
  /// [deno-postgres@v0.17.0/Connection/connected](https://deno.land/x/postgres@v0.17.0/connection/connection.ts?s=Connection#accessor_pid).
  external int get pid;

  /// [deno-postgres@v0.17.0/Connection/constructor](https://deno.land/x/postgres@v0.17.0/connection/connection.ts?s=Connection#ctor_0).
  factory Connection({
    required ClientConfiguration connectionParams,
    required Future<void> Function() disconnectionCallback,
  }) =>
      callConstructor(
        'Connection',
        [connectionParams, () => futureToPromise(disconnectionCallback())],
      );
}

/// [deno-postgres@v0.17.0/Connection](https://deno.land/x/postgres@v0.17.0/connection/connection.ts?s=Connection).
extension ConnectionProps on Connection {
  /// [deno-postgres@v0.17.0/Connection/connected](https://deno.land/x/postgres@v0.17.0/connection/connection.ts?s=Connection#prop_connected).
  bool get isConnected => getProperty(this, 'connected');

  /// [deno-postgres@v0.17.0/Connection/tls](https://deno.land/x/postgres@v0.17.0/connection/connection.ts?s=Connection#accessor_tls).
  bool get isCarriedOverTLS => getProperty(this, 'tls');

  /// [deno-postgres@v0.17.0/Connection/transport](https://deno.land/x/postgres@v0.17.0/connection/connection.ts?s=Connection#accessor_transport).
  Transport get transport => Transport.parse(getProperty(this, 'transport'));

  /// [deno-postgres@v0.17.0/Connection/end](https://deno.land/x/postgres@v0.17.0/connection/connection.ts?s=Connection#method_end_0).
  Future<void> end() => callFutureMethod(this, 'end');

  // https://deno.land/x/postgres@v0.17.0/connection/connection.ts?s=Connection#method_query_0
  // query(query: Query<ResultType.ARRAY>): Promise<QueryArrayResult>

  // https://deno.land/x/postgres@v0.17.0/connection/connection.ts?s=Connection#method_query_1
  // query(query: Query<ResultType.OBJECT>): Promise<QueryObjectResult>

  // https://deno.land/x/postgres@v0.17.0/connection/connection.ts?s=Connection#method_startup_0
  // startup(is_reconnection: boolean)
}
