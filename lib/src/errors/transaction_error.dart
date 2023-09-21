import 'dart:js_interop';

import 'package:deno_postgres_interop/src/errors/postgres_error.dart';

/// [deno-postgres@v0.17.0/TransactionError](https://deno.land/x/postgres@v0.17.0/client/error.ts?s=TransactionError).
@JS()
class TransactionError {
  /// [js/Error/cause](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/cause).
  /// [deno-postgres@v0.17.0/TransactionError/constructor](https://deno.land/x/postgres@v0.17.0/client/error.ts?s=TransactionError#ctor_0).
  external PostgresError get cause;

  /// [js/Error/message](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/message).
  external String get message;

  /// [js/Error/name](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/name).
  external String get name;
}
