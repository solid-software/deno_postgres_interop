import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/src/query.dart';
import 'package:deno_postgres_interop/src/query_result.dart';
import 'package:deno_postgres_interop/src/result_type.dart';

/// [postgres@v0.17.0/QueryObjectResult](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryObjectResult).
@JS()
class QueryObjectResult<T> extends QueryResult {
  /// [postgres@v0.17.0/QueryObjectResult/columns](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryObjectResult#prop_columns).
  external List<String>? get columns;

  /// [postgres@v0.17.0/QueryResult/constructor](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#ctor_0).
  external factory QueryObjectResult(Query<ResultType> query);
}

/// [postgres@v0.17.0/QueryObjectResult](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryObjectResult).
extension QueryObjectResultProps<T> on QueryObjectResult<T> {
  /// [postgres@v0.17.0/QueryObjectResult/rows](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryObjectResult#prop_rows).
  List<Map<String, dynamic>> get rows =>
      // ignore: cast_nullable_to_non_nullable
      (dartify(getProperty(this, 'rows')) as List)
          .cast<Map<dynamic, dynamic>>()
          .map((e) => e.cast<String, dynamic>())
          .toList();
}
