import 'dart:js_interop';

import 'package:deno_postgres_interop/src/query.dart';
import 'package:deno_postgres_interop/src/query_result.dart';

/// [deno-postgres@v​0.17.0/QueryArrayResult](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryArrayResult).
@JS('QueryArrayResult')
extension type QueryArrayResult<T extends List<dynamic>>._(JSObject _)
    implements QueryResult, JSObject {
  /// [deno-postgres@v​0.17.0/QueryResult/constructor](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#ctor_0).
  external factory QueryArrayResult(Query query);

  @JS('rows')
  external JSArray<JSArray<JSAny?>> get _rows;

  /// [deno-postgres@v​0.17.0/QueryArrayResult/rows](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryArrayResult#prop_rows).
  List<T> get rows => _rows.toDart
      .map((row) => row.toDart.map((e) => e?.dartify()).toList() as T)
      .toList();
}
