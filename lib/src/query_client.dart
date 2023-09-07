// https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient
import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/src/queryable.dart';
import 'package:deno_postgres_interop/src/transaction.dart';

@JS()
class QueryClient with Queryable {
  external Future<void> connect();
  external Future<void> end();
}

extension QueryClientProps on QueryClient {
  Transaction createTransaction(String name) =>
      callMethod(this, 'createTransaction', [name]);

  Future<T> transaction<T>(String name, Future<T> Function(Queryable) f) async {
    final transaction = createTransaction(name);
    await transaction.begin();
    final result = await f(transaction);
    await transaction.commit();

    return result;
  }
}
