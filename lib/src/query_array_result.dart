import 'dart:js_interop';

import 'package:deno_postgres_interop/src/query.dart';
import 'package:deno_postgres_interop/src/query_result.dart';
import 'package:deno_postgres_interop/src/result_type.dart';

/// [postgres@v0.17.0/QueryArrayResult](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryArrayResult).
@JS()
class QueryArrayResult<T extends List<dynamic>> extends QueryResult {
  /// [postgres@v0.17.0/QueryArrayResult/rows](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryArrayResult#prop_rows).
  external List<T> get rows;

  /// [postgres@v0.17.0/QueryResult/constructor](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#ctor_0).
  external factory QueryArrayResult(Query<ResultType> query);
}
