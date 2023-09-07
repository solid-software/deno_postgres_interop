// https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient
import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/src/query_object_result.dart';
import 'package:deno_postgres_interop/src/transaction.dart';
import 'package:deno_postgres_interop/src/util.dart';

@JS()
class QueryClient {}

extension QueryClientProps on QueryClient {
  Future<void> connect() => callFutureMethod(this, 'connect');
  Future<void> end() => callFutureMethod(this, 'end');

  Transaction createTransaction(String name) =>
      callMethod(this, 'createTransaction', [name]);

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

  Future<QueryObjectResult<T>> queryObject<T>(String query) => callFutureMethod(
        this,
        'queryObject',
        [query],
      );
}
