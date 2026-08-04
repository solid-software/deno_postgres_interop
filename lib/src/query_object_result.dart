import 'dart:js_interop';

import 'package:deno_postgres_interop/src/query.dart';
import 'package:deno_postgres_interop/src/query_result.dart';

/// [deno-postgres@v​0.17.0/QueryObjectResult](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryObjectResult).
@JS('QueryObjectResult')
extension type QueryObjectResult<T>._(JSObject _)
    implements QueryResult, JSObject {
  /// [deno-postgres@v​0.17.0/QueryResult/constructor](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#ctor_0).
  external factory QueryObjectResult(Query query);

  @JS('columns')
  external JSArray<JSString>? get _columns;

  /// [deno-postgres@v​0.17.0/QueryObjectResult/columns](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryObjectResult#prop_columns).
  List<String>? get columns => _columns?.toDart.map((e) => e.toDart).toList();

  @JS('rows')
  external JSArray<JSObject> get _rows;

  /// [deno-postgres@v​0.17.0/QueryObjectResult/rows](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryObjectResult#prop_rows).
  List<Map<String, dynamic>> get rows => (_rows.dartify()! as List)
      .cast<Map<dynamic, dynamic>>()
      .map((e) => e.cast<String, dynamic>())
      .toList();
}
