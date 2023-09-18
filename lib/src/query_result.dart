import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/src/command_type.dart';
import 'package:deno_postgres_interop/src/notice.dart';
import 'package:deno_postgres_interop/src/query.dart';
import 'package:deno_postgres_interop/src/result_type.dart';
import 'package:deno_postgres_interop/src/row_description.dart';
import 'package:deno_postgres_interop/src/uint_8_array.dart';

@JS()

/// [postgres@v0.17.0/QueryResult](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult).
class QueryResult {
  /// [postgres@v0.17.0/QueryResult/command](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#prop_command).
  external CommandType get command;

  /// [postgres@v0.17.0/QueryResult/rowCount](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#prop_rowCount).
  external int? get rowCount;

  /// [postgres@v0.17.0/QueryResult/rowDescription](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#accessor_rowDescription).
  external RowDescription? get rowDescription;

  /// [postgres@v0.17.0/QueryResult/warnings](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#prop_warnings).
  external List<Notice> get warnings;

  /// [postgres@v0.17.0/QueryResult/constructor](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#ctor_0).
  external factory QueryResult(Query<ResultType> query);

  /// [postgres@v0.17.0/QueryResult/handleCommandComplete](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#method_handleCommandComplete_0).
  external void handleCommandComplete(String commandTag);

  /// [postgres@v0.17.0/QueryResult/loadColumnDescriptions](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#method_loadColumnDescriptions_0).
  external void loadColumnDescriptions(RowDescription description);
}

/// [postgres@v0.17.0/QueryResult](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult).
extension QueryResultProps on QueryResult {
  /// [postgres@v0.17.0/QueryResult/insertRow](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#method_insertRow_0).
  void insertRow(List<Uint8Array> row) => callMethod(this, 'insertRow', [row]);
}
