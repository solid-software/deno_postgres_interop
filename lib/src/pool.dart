import 'dart:js_util';

import 'package:deno_postgres_interop/src/client_options.dart';
import 'package:deno_postgres_interop/src/pool_client.dart';
import 'package:deno_postgres_interop/src/undefined.dart';
import 'package:deno_postgres_interop/src/util.dart';

/// [deno-postgres@v0.17.0/Pool](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Pool).
class Pool {
  /// [deno-postgres@v0.17.0/Pool/constructor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Pool#ctor_0).
  factory Pool({
    required int size,
    bool? lazy,
  }) =>
      callConstructor('Pool', [
        undefined,
        size,
        if (lazy != null) lazy,
      ]);

  /// [deno-postgres@v0.17.0/Pool/constructor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Pool#ctor_0).
  factory Pool.withOptions({
    required ClientOptions connectionParams,
    required int size,
    bool? lazy,
  }) =>
      callConstructor('Pool', [
        connectionParams,
        size,
        if (lazy != null) lazy,
      ]);

  /// [deno-postgres@v0.17.0/Pool/constructor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Pool#ctor_0).
  factory Pool.withString({
    required String connectionString,
    required int size,
    bool? lazy,
  }) =>
      callConstructor('Pool', [
        connectionString,
        size,
        if (lazy != null) lazy,
      ]);
}

/// [deno-postgres@v0.17.0/Pool](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Pool).
extension PoolProps on Pool {
  /// [deno-postgres@v0.17.0/Pool/size](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Pool#prop_size).
  int get connectionsCount => getProperty(this, 'size');

  /// [deno-postgres@v0.17.0/Pool/available](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Pool#prop_available).
  int get openConnectionsCount => getProperty(this, 'available');

  /// [deno-postgres@v0.17.0/Pool/connect](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Pool#method_connect_0).
  Future<PoolClient> connect() => callFutureMethod(this, 'connect');

  /// [deno-postgres@v0.17.0/Pool/end](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Pool#method_end_0).
  Future<void> end() => callFutureMethod(this, 'end');

  /// [deno-postgres@v0.17.0/Pool/initialized](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Pool#method_initialized_0).
  Future<int> initializedConnectionsCount() =>
      callFutureMethod(this, 'initialized');
}
