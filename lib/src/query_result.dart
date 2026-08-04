import 'dart:js_interop';

import 'package:deno_postgres_interop/src/command_type.dart';
import 'package:deno_postgres_interop/src/notice.dart';
import 'package:deno_postgres_interop/src/query.dart';
import 'package:deno_postgres_interop/src/row_description.dart';

/// [deno-postgres@v​0.17.0/QueryResult](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult).
@JS('QueryResult')
extension type QueryResult._(JSObject _) implements JSObject {
  /// [deno-postgres@v​0.17.0/QueryResult/constructor](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#ctor_0).
  external factory QueryResult(Query query);

  /// [deno-postgres@v​0.17.0/QueryResult/rowCount](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#prop_rowCount).
  external int? get rowCount;

  @JS('warnings')
  external JSArray<Notice> get _warnings;

  /// [deno-postgres@v​0.17.0/QueryResult/warnings](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#prop_warnings).
  List<Notice> get warnings => _warnings.toDart;

  /// [deno-postgres@v​0.17.0/QueryResult/constructor](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#ctor_0).
  external Query get query;

  /// [deno-postgres@v​0.17.0/QueryResult/rowDescription](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#accessor_rowDescription).
  external RowDescription? get rowDescription;

  /// [deno-postgres@v​0.17.0/QueryResult/handleCommandComplete](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#method_handleCommandComplete_0).
  external void handleCommandComplete(String commandTag);

  /// [deno-postgres@v​0.17.0/QueryResult/loadColumnDescriptions](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#method_loadColumnDescriptions_0).
  external void loadColumnDescriptions(RowDescription description);

  @JS('insertRow')
  external void _insertRow(JSArray<JSArray<JSNumber>> row);

  /// [deno-postgres@v​0.17.0/QueryResult/insertRow](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#method_insertRow_0).
  void insertRow(List<List<int>> row) => _insertRow(
        row
            .map((inner) => inner.map((e) => e.toJS).toList().toJS)
            .toList()
            .toJS,
      );

  @JS('command')
  external String? get _command;

  /// [deno-postgres@v​0.17.0/QueryResult/command](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#prop_command).
  CommandType get command => CommandType.parse(_command ?? '');
}
