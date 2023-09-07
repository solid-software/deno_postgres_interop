// https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction&p=prototype.commit
import 'dart:js_interop';

import 'package:deno_postgres_interop/src/can_query.dart';
import 'package:deno_postgres_interop/src/util.dart';

@JS()
class Transaction with CanQuery {}

extension TransactionProps on Transaction {
  Future<void> begin() => callFutureMethod(this, 'begin');
  Future<void> commit() => callFutureMethod(this, 'commit');
}
