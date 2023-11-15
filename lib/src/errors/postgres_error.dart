import 'dart:js_interop';

import 'package:deno_postgres_interop/src/errors/js_error.dart';
import 'package:deno_postgres_interop/src/notice.dart';

/// [deno-postgres@v​0.17.0/PostgresError](https://deno.land/x/postgres@v0.17.0/client/error.ts?s=TransactionError).
@JS()
class PostgresError extends JSError {
  /// [deno-postgres@v​0.17.0/PostgresError](https://deno.land/x/postgres@v0.17.0/client/error.ts?s=PostgresError#prop_fields).
  external Notice get fields;
}
