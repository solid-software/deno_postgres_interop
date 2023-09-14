import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/src/query_object.dart';
import 'package:deno_postgres_interop/src/query_object_result.dart';
import 'package:deno_postgres_interop/src/session.dart';
import 'package:deno_postgres_interop/src/transaction.dart';
import 'package:deno_postgres_interop/src/transaction_options.dart';
import 'package:deno_postgres_interop/src/util.dart';

/// [postgres@v0.17.0/QueryClient](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient).
@JS()
class QueryClient {
  /// [postgres@v0.17.0/QueryClient/session](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#accessor_session).
  external Session get session;
}

/// [postgres@v0.17.0/QueryClient](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient).
extension QueryClientProps on QueryClient {
  /// [postgres@v0.17.0/QueryClient/connected](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#accessor_connected).
  bool get isConnected => getProperty(this, 'connected');

  /// [postgres@v0.17.0/QueryClient/closeConnection](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_closeConnection_0).
  Future<void> closeConnection() => callFutureMethod(this, 'closeConnection');

  /// [postgres@v0.17.0/QueryClient/resetSessionMetadata](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_resetSessionMetadata_0).
  Future<void> resetSessionMetadata() =>
      callFutureMethod(this, 'resetSessionMetadata');

  /// [postgres@v0.17.0/QueryClient/connect](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_connect_0).
  Future<void> connect() => callFutureMethod(this, 'connect');

  /// [postgres@v0.17.0/QueryClient/createTransaction](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_createTransaction_0).
  Transaction createTransaction(String name, [TransactionOptions? options]) =>
      callMethod(
        this,
        'createTransaction',
        [
          name,
          if (options != null) options,
        ],
      );

  /// [postgres@v0.17.0/QueryClient/end](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_end_0).
  Future<void> end() => callFutureMethod(this, 'end');

  // TODO:
  // queryArray<T extends Array<unknown>>(
  //   query: string,
  //   args?: QueryArguments,
  // ): Promise<QueryArrayResult<T>>
  // https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_queryArray_0

  // TODO:
  // queryArray<T extends Array<unknown>>(
  //   config: QueryOptions
  // ): Promise<QueryArrayResult<T>>
  // https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_queryArray_1

  // TODO:
  // queryArray<T extends Array<unknown>>(
  //   strings: TemplateStringsArray,
  //   ...args: unknown[],
  // ): Promise<QueryArrayResult<T>>
  // https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_queryArray_2

  /// [postgres@v0.17.0/QueryClient/queryObject](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_queryObject_0).
  Future<QueryObjectResult<T>> queryObject<T>(
    String query, [
    QueryArguments? arguments,
  ]) =>
      queryObjectCommon(this, query, arguments);

  // TODO:
  // queryObject<T>(config: QueryObjectOptions): Promise<QueryObjectResult<T>>
  // https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_queryObject_1

  // TODO:
  // queryObject<T>(
  //   query: TemplateStringsArray,
  //   ...args: unknown[],
  // ): Promise<QueryObjectResult<T>>
  // https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_queryObject_2

  /// Convinience wrapper for [createTransaction],
  /// [TransactionProps.begin],
  /// and [TransactionProps.commit].
  Future<T> transaction<T>(
    String name,
    Future<T> Function(Transaction) f, [
    TransactionOptions? options,
  ]) async {
    final transaction = createTransaction(name, options);
    await transaction.begin();
    final result = await f(transaction);
    await transaction.commit();

    return result;
  }
}
