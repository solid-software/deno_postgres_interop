import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/src/command_type.dart';
import 'package:deno_postgres_interop/src/notice.dart';
import 'package:deno_postgres_interop/src/query.dart';
import 'package:deno_postgres_interop/src/row_description.dart';

/// [deno-postgres@v0.17.0/QueryResult](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult).
@JS()
class QueryResult {
  /// [deno-postgres@v0.17.0/QueryResult/warnings](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#prop_warnings).
  external List<Notice> get warnings;

  /// [deno-postgres@v0.17.0/QueryResult/constructor](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#ctor_0).
  external Query get query;

  /// [deno-postgres@v0.17.0/QueryResult/rowDescription](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#accessor_rowDescription).
  external RowDescription? get rowDescription;
}

/// [deno-postgres@v0.17.0/QueryResult](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult).
extension QueryResultProps on QueryResult {
  /// [deno-postgres@v0.17.0/QueryResult/command](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryResult#prop_command).
  CommandType get command => CommandType.parse(
        getProperty(this, 'command'),
      );
}
