import 'dart:js_interop';

import 'package:deno_postgres_interop/src/client_common.dart';
import 'package:deno_postgres_interop/src/connection.dart';
import 'package:deno_postgres_interop/src/query_array_result.dart';
import 'package:deno_postgres_interop/src/query_object_options.dart';
import 'package:deno_postgres_interop/src/query_object_result.dart';
import 'package:deno_postgres_interop/src/session.dart';
import 'package:deno_postgres_interop/src/transaction.dart';
import 'package:deno_postgres_interop/src/transaction_options.dart';

/// [deno-postgres@v​0.17.0/QueryClient](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient).
@JS('QueryClient')
extension type QueryClient._(JSObject _) implements JSObject {
  /// [deno-postgres@v​0.17.0/QueryClient/constructor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#ctor_0).
  external factory QueryClient(Connection connection);

  /// [deno-postgres@v​0.17.0/QueryClient/session](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#accessor_session).
  external Session get session;

  /// [deno-postgres@v​0.17.0/QueryClient/connected](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#accessor_connected).
  @JS('connected')
  external bool get isConnected;

  @JS('closeConnection')
  external JSPromise<JSAny?> _closeConnection();

  /// [deno-postgres@v​0.17.0/QueryClient/closeConnection](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_closeConnection_0).
  Future<void> closeConnection() async {
    await _closeConnection().toDart;
  }

  /// [deno-postgres@v​0.17.0/QueryClient/resetSessionMetadata](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_resetSessionMetadata_0).
  external void resetSessionMetadata();

  @JS('connect')
  external JSPromise<JSAny?> _connect();

  /// [deno-postgres@v​0.17.0/QueryClient/connect](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_connect_0).
  Future<void> connect() async {
    await _connect().toDart;
  }

  @JS('end')
  external JSPromise<JSAny?> _end();

  /// [deno-postgres@v​0.17.0/QueryClient/end](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_end_0).
  Future<void> end() async {
    await _end().toDart;
  }

  /// [deno-postgres@v​0.17.0/QueryClient/createTransaction](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_createTransaction_0).
  external Transaction createTransaction(
    String name, [
    TransactionOptions? options,
  ]);

  /// Convinience wrapper for [createTransaction],
  /// [Transaction.begin],
  /// and [Transaction.commit].
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

  /// [deno-postgres@v​0.17.0/QueryClient/queryArray](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_queryArray_0).
  Future<QueryArrayResult<T>> queryArray<T extends List<dynamic>>(
    String query, [
    QueryArguments? args,
  ]) =>
      ClientCommon.queryArray(this, query, args);

  /// [deno-postgres@v​0.17.0/QueryClient/queryArray](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_queryArray_1).
  Future<QueryArrayResult<T>> queryArrayWithOptions<T extends List<dynamic>>(
    QueryObjectOptions config,
  ) =>
      ClientCommon.queryArrayWithOptions(this, config);

  /// [deno-postgres@v​0.17.0/QueryClient/queryObject](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_queryObject_0).
  Future<QueryObjectResult<T>> queryObject<T>(
    String query, [
    QueryArguments? arguments,
  ]) =>
      ClientCommon.queryObject(this, query, arguments);

  /// [deno-postgres@v​0.17.0/QueryClient/queryObject](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_queryObject_1).
  Future<QueryObjectResult<T>> queryObjectWithOptions<T>(
    QueryObjectOptions config,
  ) =>
      ClientCommon.queryObjectWithOptions(this, config);
}
