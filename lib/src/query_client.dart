import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/src/query_object_result.dart';
import 'package:deno_postgres_interop/src/transaction.dart';
import 'package:deno_postgres_interop/src/util.dart';

/// [postgres@v0.17.0/QueryClient](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient).
@JS()
class QueryClient {}

/// [postgres@v0.17.0/QueryClient](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient).
extension QueryClientProps on QueryClient {
  /// [postgres@v0.17.0/QueryClient/connect](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_connect_0).
  Future<void> connect() => callFutureMethod(this, 'connect');

  /// [postgres@v0.17.0/QueryClient/end](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_end_0).
  Future<void> end() => callFutureMethod(this, 'end');

  /// [postgres@v0.17.0/QueryClient/createTransaction](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_createTransaction_0).
  Transaction createTransaction(String name) =>
      callMethod(this, 'createTransaction', [name]);

  /// Convinience wrapper for [createTransaction],
  /// [TransactionProps.begin],
  /// and [TransactionProps.commit].
  Future<T> transaction<T>(
    String name,
    Future<T> Function(Transaction) f,
  ) async {
    final transaction = createTransaction(name);
    await transaction.begin();
    final result = await f(transaction);
    await transaction.commit();

    return result;
  }

  /// [postgres@v0.17.0/QueryClient/queryObject](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_queryObject_0).
  Future<QueryObjectResult<T>> queryObject<T>(String query) => callFutureMethod(
        this,
        'queryObject',
        [query],
      );
}