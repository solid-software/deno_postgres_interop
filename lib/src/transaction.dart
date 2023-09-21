import 'dart:js_interop';
import 'dart:js_util';

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
import 'package:deno_postgres_interop/src/undefined.dart';
import 'package:deno_postgres_interop/src/util.dart';

/// [deno-postgres@v0.17.0/Transaction](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction).
@JS()
class Transaction {
  /// [deno-postgres@v0.17.0/Transaction/savepoints](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#accessor_savepoints).
  external List<Savepoint> get savepoints;

  /// [deno-postgres@v0.17.0/Transaction/construtor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#ctor_0).
  factory Transaction({
    required String name,
    required QueryClient client,
    required Future<QueryResult> Function(Query query) executeQueryCallback,
    required void Function(String? name) updateClientLockCallback,
    TransactionOptions? options,
  }) =>
      callConstructor(
        'Transaction',
        [
          name,
          if (options != null) options else undefined,
          client,
          (Query query) => futureToPromise(executeQueryCallback(query)),
          updateClientLockCallback,
        ],
      );

  /// [deno-postgres@v0.17.0/Transaction/getSavepoint](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_getSavepoint_0).
  external Savepoint? getSavepoint(String name);
}

/// [deno-postgres@v0.17.0/Transaction](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction).
extension TransactionProps on Transaction {
  /// [deno-postgres@v0.17.0/Transaction/isolation_level](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#accessor_isolation_level).
  IsolationLevel get isolationLevel =>
      IsolationLevel.parse(getProperty(this, 'isolation_name'));

  /// [deno-postgres@v0.17.0/Transaction/begin](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_begin_0).
  Future<void> begin() => callFutureMethod(this, 'begin');

  /// [deno-postgres@v0.17.0/Transaction/commit](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_commit_0).
  Future<void> commit({bool? chain}) => callFutureMethod(
        this,
        'commit',
        [
          if (chain != null) {'chain': chain},
        ],
      );

  /// [deno-postgres@v0.17.0/Transaction/getSavepoints](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_getSavepoints_0).
  List<String> getActiveSavepointsNames() =>
      callMethod(this, 'getSavepoints', []);

  /// [deno-postgres@v0.17.0/Transaction/getSnapshot](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_getSnapshot_0).
  Future<String> get snapshot => callFutureMethod(this, 'getSnapshot');

  /// [deno-postgres@v0.17.0/Transaction/queryArray](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_queryArray_0).
  Future<QueryArrayResult<T>> queryArray<T extends List<dynamic>>(
    String query, [
    QueryArguments? args,
  ]) =>
      ClientCommon.queryArray(this, query, args);

  /// [deno-postgres@v0.17.0/Transaction/queryArray](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_queryArray_1).
  Future<QueryArrayResult<T>> queryArrayWithOptions<T extends List<dynamic>>(
    QueryObjectOptions config,
  ) =>
      ClientCommon.queryArrayWithOptions(this, config);

  /// [deno-postgres@v0.17.0/Transaction/rollback](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_rollback_0).
  Future<void> rollback([Savepoint? savepoint]) => callFutureMethod(
        this,
        'rollback',
        [if (savepoint != null) savepoint],
      );

  // [deno-postgres@v0.17.0/Transaction/rollback](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_rollback_1).
  // this has the same functionality as [rollback] and [rollbackByName]
  // so it won't be implemented.

  /// [deno-postgres@v0.17.0/Transaction/rollback](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_rollback_2).
  Future<void> rollbackWithChain() => callFutureMethod(
        this,
        'rollback',
        [
          jsify({'chain': true}),
        ],
      );

  /// [deno-postgres@v0.17.0/Transaction/rollback](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_rollback_0).
  Future<void> rollbackByName(String savepoint) =>
      callFutureMethod(this, 'rollback', [savepoint]);

  /// [deno-postgres@v0.17.0/Transaction/savepoint](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_savepoint_0).
  Future<Savepoint> createSavepoint(String name) =>
      callFutureMethod(this, 'savepoint', [name]);

  /// [deno-postgres@v0.17.0/Transaction/queryObject](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_queryObject_0).
  Future<QueryObjectResult<T>> queryObject<T>(
    String query, [
    QueryArguments? arguments,
  ]) =>
      ClientCommon.queryObject(this, query, arguments);

  /// [deno-postgres@v0.17.0/Transaction/queryObject](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_queryObject_1).
  Future<QueryObjectResult<T>> queryObjectWithOptions<T>(
    QueryObjectOptions config,
  ) =>
      ClientCommon.queryObjectWithOptions(this, config);
}
