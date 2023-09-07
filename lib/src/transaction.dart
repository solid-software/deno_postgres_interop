// https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction&p=prototype.commit
import 'dart:js_interop';

import 'package:deno_postgres_interop/src/query_object_result.dart';
import 'package:deno_postgres_interop/src/util.dart';

@JS()
class Transaction {}

extension TransactionProps on Transaction {
  Future<void> begin() => callFutureMethod(this, 'begin');
  Future<void> commit() => callFutureMethod(this, 'commit');

  Future<QueryObjectResult<T>> queryObject<T>(String query) => callFutureMethod(
        this,
        'queryObject',
        [query],
      );
}
