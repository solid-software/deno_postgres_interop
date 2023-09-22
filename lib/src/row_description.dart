import 'dart:js_interop';

import 'package:deno_postgres_interop/src/column.dart';

/// [deno-postgres@​0.17.0/RowDescription](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=RowDescription).
@JS()
class RowDescription {
  /// https://deno.land/x/postgres@v0.17.0/query/query.ts?s=RowDescription#ctor_0
  external int get columnCount;

  /// https://deno.land/x/postgres@v0.17.0/query/query.ts?s=RowDescription#ctor_0
  external List<Column> get columns;

  /// https://deno.land/x/postgres@v0.17.0/query/query.ts?s=RowDescription#ctor_0
  external factory RowDescription(int columnCount, List<Column> columns);
}
