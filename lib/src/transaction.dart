// https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction&p=prototype.commit
import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/src/query_arguments.dart';
import 'package:deno_postgres_interop/src/query_object_result.dart';

@JS()
class Transaction {}

extension TransactionProps on Transaction {
  Future<void> begin() => promiseToFuture(callMethod(this, 'begin', []));
  Future<void> commit() => promiseToFuture(callMethod(this, 'commit', []));

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
}
