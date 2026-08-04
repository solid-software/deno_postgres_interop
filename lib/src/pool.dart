import 'dart:js_interop';

import 'package:deno_postgres_interop/src/client_options.dart';
import 'package:deno_postgres_interop/src/pool_client.dart';

/// [deno-postgres@v​0.17.0/Pool](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Pool).
@JS('Pool')
extension type Pool._(JSObject _) implements JSObject {
  /// [deno-postgres@v​0.17.0/Pool/constructor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Pool#ctor_0).
  factory Pool({
    required int size,
    bool? lazy,
  }) =>
      Pool._internal(
        null,
        size,
        lazy,
      );

  /// [deno-postgres@v​0.17.0/Pool/constructor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Pool#ctor_0).
  factory Pool.withOptions({
    required ClientOptions connectionParams,
    required int size,
    bool? lazy,
  }) =>
      Pool._internal(
        connectionParams,
        size,
        lazy,
      );

  /// [deno-postgres@v​0.17.0/Pool/constructor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Pool#ctor_0).
  factory Pool.withString({
    required String connectionString,
    required int size,
    bool? lazy,
  }) =>
      Pool._internal(
        connectionString.toJS,
        size,
        lazy,
      );

  @JS('Pool')
  external factory Pool._internal([
    JSAny? connectionParamsOrString,
    int? size,
    bool? lazy,
  ]);

  /// [deno-postgres@v​0.17.0/Pool/size](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Pool#prop_size).
  @JS('size')
  external int get connectionsCount;

  /// [deno-postgres@v​0.17.0/Pool/available](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Pool#prop_available).
  @JS('available')
  external int get openConnectionsCount;

  @JS('connect')
  external JSPromise<PoolClient> _connect();

  /// [deno-postgres@v​0.17.0/Pool/connect](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Pool#method_connect_0).
  Future<PoolClient> connect() => _connect().toDart;

  @JS('end')
  external JSPromise<JSAny?> _end();

  /// [deno-postgres@v​0.17.0/Pool/end](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Pool#method_end_0).
  Future<void> end() async {
    await _end().toDart;
  }

  @JS('initialized')
  external JSPromise<JSNumber> _initialized();

  /// [deno-postgres@v​0.17.0/Pool/initialized](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Pool#method_initialized_0).
  Future<int> initializedConnectionsCount() async {
    final res = await _initialized().toDart;

    return res.toDartInt;
  }
}
