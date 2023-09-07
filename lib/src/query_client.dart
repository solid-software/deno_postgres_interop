// https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient
import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/src/can_query.dart';
import 'package:deno_postgres_interop/src/transaction.dart';

@JS()
class QueryClient with CanQuery {
  external Future<void> connect();
  external Future<void> end();
}

extension QueryClientProps on QueryClient {
  Transaction createTransaction(String name) =>
      callMethod(this, 'createTransaction', [name]);
}
