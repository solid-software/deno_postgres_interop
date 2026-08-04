import 'dart:js_interop';

import 'package:deno_postgres_interop/src/column.dart';

/// [deno-postgres@v​0.17.0/RowDescription](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=RowDescription).
@JS('RowDescription')
extension type RowDescription._(JSObject _) implements JSObject {
  /// https://deno.land/x/postgres@v0.17.0/query/query.ts?s=RowDescription#ctor_0
  factory RowDescription(int columnCount, List<Column> columns) =>
      RowDescription._internal(columnCount, columns.toJS);

  @JS('RowDescription')
  external factory RowDescription._internal(
    int columnCount,
    JSArray<Column> columns,
  );

  /// https://deno.land/x/postgres@v0.17.0/query/query.ts?s=RowDescription#ctor_0
  external int get columnCount;

  @JS('columns')
  external JSArray<Column> get _columns;

  /// https://deno.land/x/postgres@v0.17.0/query/query.ts?s=RowDescription#ctor_0
  List<Column> get columns => _columns.toDart;
}
