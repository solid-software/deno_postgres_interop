import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:deno_postgres_interop/src/client_options.dart';
import 'package:deno_postgres_interop/src/pool_client.dart';
import 'package:deno_postgres_interop/src/undefined.dart';

/// [deno-postgres@v​0.17.0/Pool](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Pool).
@JS('Pool')
extension type Pool._(JSObject _) implements JSObject {
  /// [deno-postgres@v​0.17.0/Pool/constructor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Pool#ctor_0).
  factory Pool({
    required int size,
    bool? lazy,
  }) => _createPool(
    undefined,
    size,
    lazy,
  );

  /// [deno-postgres@v​0.17.0/Pool/constructor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Pool#ctor_0).
  factory Pool.withOptions({
    required ClientOptions connectionParams,
    required int size,
    bool? lazy,
  }) => _createPool(
    connectionParams,
    size,
    lazy,
  );

  /// [deno-postgres@v​0.17.0/Pool/constructor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Pool#ctor_0).
  factory Pool.withString({
    required String connectionString,
    required int size,
    bool? lazy,
  }) => _createPool(
    connectionString.toJS,
    size,
    lazy,
  );

  static Pool _createPool([
    JSAny? connectionParamsOrString,
    int? size,
    bool? lazy,
  ]) {
    final constructor = globalContext['Pool'] as JSFunction?;
    if (constructor == null) {
      throw StateError('Pool constructor not found in global context.');
    }

    return constructor.callAsConstructor<Pool>(
      connectionParamsOrString,
      size?.toJS,
      lazy?.toJS,
    );
  }

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
