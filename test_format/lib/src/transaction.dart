import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:deno_postgres_interop/src/client_common.dart';
import 'package:deno_postgres_interop/src/isolation_level.dart';
import 'package:deno_postgres_interop/src/promise.dart';
import 'package:deno_postgres_interop/src/query.dart';
import 'package:deno_postgres_interop/src/query_array_result.dart';
import 'package:deno_postgres_interop/src/query_client.dart';
import 'package:deno_postgres_interop/src/query_object_options.dart';
import 'package:deno_postgres_interop/src/query_object_result.dart';
import 'package:deno_postgres_interop/src/query_result.dart';
import 'package:deno_postgres_interop/src/savepoint.dart';
import 'package:deno_postgres_interop/src/transaction_options.dart';

/// [deno-postgres@v​0.17.0/Transaction](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction).
@JS('Transaction')
extension type Transaction._(JSObject _) implements JSObject {
  /// [deno-postgres@v​0.17.0/Transaction/construtor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#ctor_0).
  factory Transaction({
    required String name,
    required QueryClient client,
    required Future<QueryResult> Function(Query query) executeQueryCallback,
    required void Function(String? name) updateClientLockCallback,
    TransactionOptions? options,
  }) => _createTransaction(
    name.toJS,
    options,
    client,
    ((Query query) => futureToPromise(executeQueryCallback(query))).toJS,
    ((JSString? name) => updateClientLockCallback(name?.toDart)).toJS,
  );

  static Transaction _createTransaction(
    JSString name,
    TransactionOptions? options,
    QueryClient client,
    JSFunction executeQueryCallback,
    JSFunction updateClientLockCallback,
  ) {
    final constructor = globalContext['Transaction'] as JSFunction?;
    if (constructor == null) {
      throw StateError('Transaction constructor not found in global context.');
    }

    return constructor.callAsConstructorVarArgs<Transaction>([
      name,
      options,
      client,
      executeQueryCallback,
      updateClientLockCallback,
    ]);
  }

  @JS('savepoints')
  external JSArray<Savepoint> get _savepoints;

  /// [deno-postgres@v​0.17.0/Transaction/savepoints](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#accessor_savepoints).
  List<Savepoint> get savepoints => _savepoints.toDart;

  /// [deno-postgres@v​0.17.0/Transaction/getSavepoint](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_getSavepoint_0).
  external Savepoint? getSavepoint(String name);

  @JS('isolation_name')
  external String get _isolationName;

  /// [deno-postgres@v​0.17.0/Transaction/isolation_level](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#accessor_isolation_level).
  IsolationLevel get isolationLevel => IsolationLevel.parse(_isolationName);

  @JS('begin')
  external JSPromise<JSAny?> _begin();

  /// [deno-postgres@v​0.17.0/Transaction/begin](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_begin_0).
  Future<void> begin() async {
    await _begin().toDart;
  }

  @JS('commit')
  external JSPromise<JSAny?> _commit([JSObject? options]);

  /// [deno-postgres@v​0.17.0/Transaction/commit](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_commit_0).
  Future<void> commit({bool? chain}) async {
    await _commit(
      chain != null ? {'chain': chain}.jsify()! as JSObject : null,
    ).toDart;
  }

  @JS('getSavepoints')
  external JSArray<JSString> _getSavepoints();

  /// [deno-postgres@v​0.17.0/Transaction/getSavepoints](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_getSavepoints_0).
  List<String> getActiveSavepointsNames() =>
      _getSavepoints().toDart.map((e) => e.toDart).toList();

  @JS('getSnapshot')
  external JSPromise<JSString> _getSnapshot();

  /// [deno-postgres@v​0.17.0/Transaction/getSnapshot](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_getSnapshot_0).
  Future<String> get snapshot async {
    final res = await _getSnapshot().toDart;

    return res.toDart;
  }

  /// [deno-postgres@v​0.17.0/Transaction/queryArray](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_queryArray_0).
  Future<QueryArrayResult<T>> queryArray<T extends List<dynamic>>(
    String query, [
    QueryArguments? args,
  ]) => ClientCommon.queryArray(this, query, args);

  /// [deno-postgres@v​0.17.0/Transaction/queryArray](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_queryArray_1).
  Future<QueryArrayResult<T>> queryArrayWithOptions<T extends List<dynamic>>(
    QueryObjectOptions config,
  ) => ClientCommon.queryArrayWithOptions(this, config);

  @JS('rollback')
  external JSPromise<JSAny?> _rollback([JSAny? savepointOrOptions]);

  /// [deno-postgres@v​0.17.0/Transaction/rollback](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_rollback_0).
  Future<void> rollback([Savepoint? savepoint]) async {
    await _rollback(savepoint).toDart;
  }

  /// [deno-postgres@v​0.17.0/Transaction/rollback](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_rollback_2).
  Future<void> rollbackWithChain() async {
    await _rollback({'chain': true}.jsify()).toDart;
  }

  /// [deno-postgres@v​0.17.0/Transaction/rollback](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_rollback_0).
  Future<void> rollbackByName(String savepoint) async {
    await _rollback(savepoint.toJS).toDart;
  }

  @JS('savepoint')
  external JSPromise<Savepoint> _savepoint(String name);

  /// [deno-postgres@v​0.17.0/Transaction/savepoint](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_savepoint_0).
  Future<Savepoint> createSavepoint(String name) => _savepoint(name).toDart;

  /// [deno-postgres@v​0.17.0/Transaction/queryObject](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_queryObject_0).
  Future<QueryObjectResult<T>> queryObject<T>(
    String query, [
    QueryArguments? arguments,
  ]) => ClientCommon.queryObject(this, query, arguments);

  /// [deno-postgres@v​0.17.0/Transaction/queryObject](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_queryObject_1).
  Future<QueryObjectResult<T>> queryObjectWithOptions<T>(
    QueryObjectOptions config,
  ) => ClientCommon.queryObjectWithOptions(this, config);
}
