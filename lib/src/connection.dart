import 'dart:js_interop';

import 'package:deno_postgres_interop/src/client_configuration.dart';
import 'package:deno_postgres_interop/src/promise.dart';
import 'package:deno_postgres_interop/src/query.dart';
import 'package:deno_postgres_interop/src/query_result.dart';
import 'package:deno_postgres_interop/src/transport.dart';

/// [deno-postgres@v​0.17.0/Connection](https://deno.land/x/postgres@v0.17.0/connection/connection.ts?s=Connection).
@JS('Connection')
extension type Connection._(JSObject _) implements JSObject {
  /// [deno-postgres@v​0.17.0/Connection/constructor](https://deno.land/x/postgres@v0.17.0/connection/connection.ts?s=Connection#ctor_0).
  factory Connection({
    required ClientConfiguration connectionParams,
    required Future<void> Function() disconnectionCallback,
  }) =>
      Connection._internal(
        connectionParams,
        (() => futureToPromise(disconnectionCallback())).toJS,
      );

  @JS('Connection')
  external factory Connection._internal(
    ClientConfiguration connectionParams,
    JSFunction disconnectionCallback,
  );

  /// [deno-postgres@v​0.17.0/Connection/connected](https://deno.land/x/postgres@v0.17.0/connection/connection.ts?s=Connection#accessor_pid).
  external int get pid;

  /// [deno-postgres@v​0.17.0/Connection/connected](https://deno.land/x/postgres@v0.17.0/connection/connection.ts?s=Connection#prop_connected).
  @JS('connected')
  external bool get isConnected;

  /// [deno-postgres@v​0.17.0/Connection/tls](https://deno.land/x/postgres@v0.17.0/connection/connection.ts?s=Connection#accessor_tls).
  @JS('tls')
  external bool get isCarriedOverTLS;

  @JS('transport')
  external String get _transport;

  /// [deno-postgres@v​0.17.0/Connection/transport](https://deno.land/x/postgres@v0.17.0/connection/connection.ts?s=Connection#accessor_transport).
  Transport get transport => Transport.parse(_transport);

  @JS('end')
  external JSPromise<JSAny?> _end();

  /// [deno-postgres@v​0.17.0/Connection/end](https://deno.land/x/postgres@v0.17.0/connection/connection.ts?s=Connection#method_end_0).
  Future<void> end() async {
    await _end().toDart;
  }

  @JS('query')
  external JSPromise<JSAny?> _query(Query query);

  /// [deno-postgres@v​0.17.0/Connection/query](https://deno.land/x/postgres@v0.17.0/connection/connection.ts?s=Connection#method_query_0).
  /// [deno-postgres@v​0.17.0/Connection/query](https://deno.land/x/postgres@v0.17.0/connection/connection.ts?s=Connection#method_query_1).
  Future<T> queryArray<T extends QueryResult>(Query query) async {
    final res = await _query(query).toDart;

    return res! as T;
  }

  @JS('startup')
  external JSPromise<JSAny?> _startup(bool isReconnection);

  /// [deno-postgres@v​0.17.0/Connection/startup](https://deno.land/x/postgres@v0.17.0/connection/connection.ts?s=Connection#method_startup_0).
  Future<void> startup({required bool isReconnection}) async {
    await _startup(isReconnection).toDart;
  }
}
