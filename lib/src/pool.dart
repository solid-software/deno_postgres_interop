import 'dart:js_util';

import 'package:deno_postgres_interop/src/client_options.dart';
import 'package:deno_postgres_interop/src/undefined.dart';

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

// available: number
// size: number

// connect(): Promise<PoolClient>

// end(): Promise<void>

// initialized(): Promise<number>
}
