import 'dart:js_interop';
import 'dart:js_util';

/// [deno-postgres@v​0.17.0/Notice](https://deno.land/x/postgres@v0.17.0/connection/message.ts?s=Notice).
@JS()
class Notice {
  /// [deno-postgres@v​0.17.0/Notice/severity](https://deno.land/x/postgres@v0.17.0/connection/message.ts?s=Notice#prop_severity).
  external String get severity;

  /// [deno-postgres@v​0.17.0/Notice/code](https://deno.land/x/postgres@v0.17.0/connection/message.ts?s=Notice#prop_code).
  external String get code;

  /// [deno-postgres@v​0.17.0/Notice/message](https://deno.land/x/postgres@v0.17.0/connection/message.ts?s=Notice#prop_message).
  external String get message;

  /// [deno-postgres@v​0.17.0/Notice/detail](https://deno.land/x/postgres@v0.17.0/connection/message.ts?s=Notice#prop_detail).
  external String? get detail;

  /// [deno-postgres@v​0.17.0/Notice/hint](https://deno.land/x/postgres@v0.17.0/connection/message.ts?s=Notice#prop_hint).
  external String? get hint;

  /// [deno-postgres@v​0.17.0/Notice/position](https://deno.land/x/postgres@v0.17.0/connection/message.ts?s=Notice#prop_position).
  external String? get position;

  /// [deno-postgres@v​0.17.0/Notice/internalPosition](https://deno.land/x/postgres@v0.17.0/connection/message.ts?s=Notice#prop_internalPosition).
  external String? get internalPosition;

  /// [deno-postgres@v​0.17.0/Notice/internalQuery](https://deno.land/x/postgres@v0.17.0/connection/message.ts?s=Notice#prop_internalQuery).
  external String? get internalQuery;

  /// [deno-postgres@v​0.17.0/Notice/where](https://deno.land/x/postgres@v0.17.0/connection/message.ts?s=Notice#prop_where).
  external String? get where;

  /// [deno-postgres@v​0.17.0/Notice/schema](https://deno.land/x/postgres@v0.17.0/connection/message.ts?s=Notice#prop_schema).
  external String? get schema;

  /// [deno-postgres@v​0.17.0/Notice/table](https://deno.land/x/postgres@v0.17.0/connection/message.ts?s=Notice#prop_table).
  external String? get table;

  /// [deno-postgres@v​0.17.0/Notice/column](https://deno.land/x/postgres@v0.17.0/connection/message.ts?s=Notice#prop_column).
  external String? get column;

  /// [deno-postgres@v​0.17.0/Notice/dataType](https://deno.land/x/postgres@v0.17.0/connection/message.ts?s=Notice#prop_dataType).
  external String? get dataType;

  /// [deno-postgres@v​0.17.0/Notice/constraint](https://deno.land/x/postgres@v0.17.0/connection/message.ts?s=Notice#prop_constraint).
  external String? get constraint;

  /// [deno-postgres@v​0.17.0/Notice/file](https://deno.land/x/postgres@v0.17.0/connection/message.ts?s=Notice#prop_file).
  external String? get file;

  /// [deno-postgres@v​0.17.0/Notice/line](https://deno.land/x/postgres@v0.17.0/connection/message.ts?s=Notice#prop_line).
  external String? get line;

  /// [deno-postgres@v​0.17.0/Notice/routine](https://deno.land/x/postgres@v0.17.0/connection/message.ts?s=Notice#prop_routine).
  external String? get routine;

  /// [deno-postgres@v​0.17.0/Notice](https://deno.land/x/postgres@v0.17.0/connection/message.ts?s=Notice).
  factory Notice({
    required String severity,
    required String code,
    required String message,
    String? detail,
    String? hint,
    String? position,
    String? internalPosition,
    String? internalQuery,
    String? where,
    String? schema,
    String? table,
    String? column,
    String? dataType,
    String? constraint,
    String? file,
    String? line,
    String? routine,
  }) {
    return jsify({
      'severity': severity,
      'code': code,
      'message': message,
      if (detail != null) 'detail': detail,
      if (hint != null) 'hint': hint,
      if (position != null) 'position': position,
      if (internalPosition != null) 'internalPosition': internalPosition,
      if (internalQuery != null) 'internalQuery': internalQuery,
      if (where != null) 'where': where,
      if (schema != null) 'schema': schema,
      if (table != null) 'table': table,
      if (column != null) 'column': column,
      if (dataType != null) 'dataType': dataType,
      if (constraint != null) 'constraint': constraint,
      if (file != null) 'file': file,
      if (line != null) 'line': line,
      if (routine != null) 'routine': routine,
    }) as Notice;
  }
}
