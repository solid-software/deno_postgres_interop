import 'dart:js_interop';

import 'package:deno_postgres_interop/src/query_object.dart';
import 'package:deno_postgres_interop/src/query_object_result.dart';
import 'package:deno_postgres_interop/src/util.dart';

/// [postgres@v0.17.0/Transaction](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction).
@JS()
class Transaction {}

/// [postgres@v0.17.0/Transaction](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction).
extension TransactionProps on Transaction {
  /// [postgres@v0.17.0/Transaction/begin](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_begin_0).
  Future<void> begin() => callFutureMethod(this, 'begin');

  /// [postgres@v0.17.0/Transaction/commit](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_commit_0).
  Future<void> commit() => callFutureMethod(this, 'commit');

  /// [postgres@v0.17.0/Transaction/queryObject](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_queryObject_0).
  Future<QueryObjectResult<T>> queryObject<T>(
    String query, [
    QueryArguments? arguments,
  ]) =>
      queryObjectCommon(this, query, arguments);
}
