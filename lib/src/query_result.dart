import 'dart:js_interop';
import 'dart:js_util';

@JS()

/// [postgres@v0.17.0/QueryResult](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult)
class QueryResult {
  /// https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#prop_command
  external CommandType get command;

  /// https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#prop_rowCount
  external int? get rowCount;

  /// https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#accessor_rowDescription
  external RowDescription? get rowDescription;

  /// https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#prop_warnings
  external List<Notice> get warnings;

  /// https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#ctor_0
  external factory QueryResult(Query<ResultType> query);

  /// https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#method_handleCommandComplete_0
  external void handleCommandComplete(String commandTag);

  /// https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#method_loadColumnDescriptions_0
  external void loadColumnDescriptions(RowDescription description);
}

extension QueryResultProps on QueryResult {
  /// https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#method_insertRow_0
  void insertRow(List<Uint8Array> row) => callMethod(this, 'insertRow', [row]);
}

// TODO:

class Uint8Array {}

class Notice {}

class CommandType {}

class Query<T> {}

class ResultType {}

class RowDescription {}
