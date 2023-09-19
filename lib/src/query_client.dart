import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/src/client_common.dart';
import 'package:deno_postgres_interop/src/query_array_result.dart';
import 'package:deno_postgres_interop/src/query_object_options.dart';
import 'package:deno_postgres_interop/src/query_object_result.dart';
import 'package:deno_postgres_interop/src/transaction.dart';
import 'package:deno_postgres_interop/src/transaction_options.dart';
import 'package:deno_postgres_interop/src/util.dart';

/// [deno-postgres@v0.17.0/QueryClient](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient).
@JS()
class QueryClient {}

/// [deno-postgres@v0.17.0/QueryClient](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient).
extension QueryClientProps on QueryClient {
  /// [deno-postgres@v0.17.0/QueryClient/connect](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_connect_0).
  Future<void> connect() => callFutureMethod(this, 'connect');

  /// [deno-postgres@v0.17.0/QueryClient/end](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_end_0).
  Future<void> end() => callFutureMethod(this, 'end');

  /// [deno-postgres@v0.17.0/QueryClient/createTransaction](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_createTransaction_0).
  Transaction createTransaction(String name, [TransactionOptions? options]) =>
      callMethod(
        this,
        'createTransaction',
        [
          name,
          if (options != null) options,
        ],
      );

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

  /// [deno-postgres@v0.17.0/QueryClient/queryArray](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_queryArray_0).
  Future<QueryArrayResult<T>> queryArray<T extends List<dynamic>>(
    String query, [
    QueryArguments? args,
  ]) =>
      ClientCommon.queryArray(this, query, args);

  /// [deno-postgres@v0.17.0/QueryClient/queryArray](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_queryArray_1).
  Future<QueryArrayResult<T>> queryArrayWithOptions<T extends List<dynamic>>(
    QueryObjectOptions config,
  ) =>
      ClientCommon.queryArrayWithOptions(this, config);

  /// [deno-postgres@v0.17.0/QueryClient/queryObject](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_queryObject_0).
  Future<QueryObjectResult<T>> queryObject<T>(
    String query, [
    QueryArguments? arguments,
  ]) =>
      ClientCommon.queryObject(this, query, arguments);

  /// [deno-postgres@v0.17.0/QueryClient/queryObject](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_queryObject_1).
  Future<QueryObjectResult<T>> queryObjectWithOptions<T>(
    QueryObjectOptions config,
  ) =>
      ClientCommon.queryObjectWithOptions(this, config);
}
