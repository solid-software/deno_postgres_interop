// https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient
import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/src/query_arguments.dart';
import 'package:deno_postgres_interop/src/query_object_result.dart';
import 'package:deno_postgres_interop/src/transaction.dart';
import 'package:deno_postgres_interop/src/transaction_options.dart';

@JS()
class QueryClient {
  // external factory QueryClient(Connection connection);

  external bool get connected;
  // external Session get session;

  external Future<void> closeConnection(); // protected
  external void resetSessionMetadata(); // protected

  external Future<void> connect();

  external Future<void> end();
}

extension QueryClientProps on QueryClient {
  Future<QueryObjectResult<T>> queryObject<T>(
    String query, [
    QueryArguments? args,
  ]) =>
      promiseToFuture(
        callMethod(
          this,
          'queryObject',
          [
            query,
            if (args != null) args,
          ],
        ),
      );

  Transaction createTransaction(
    String name, [
    TransactionOptions? options,
  ]) =>
      callMethod(
        this,
        'createTransaction',
        [
          name,
          if (options != null) options,
        ],
      );
}
