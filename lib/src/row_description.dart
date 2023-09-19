import 'dart:js_interop';
import 'dart:js_util';

/// [deno-postgres@v0.17.0/RowDescription](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=RowDescription).
@JS()
class RowDescription {
  /// https://deno.land/x/postgres@v0.17.0/query/query.ts?s=RowDescription#ctor_0
  external int get columnCount;

  /// https://deno.land/x/postgres@v0.17.0/query/query.ts?s=RowDescription#ctor_0
  external List<Column> get columns;

  /// https://deno.land/x/postgres@v0.17.0/query/query.ts?s=RowDescription#ctor_0
  external factory RowDescription(int columnCount, List<Column> columns);
}

/// [deno-postgres@v0.17.0/Column](https://deno.land/x/postgres@v0.17.0/query/decode.ts?s=Column).
@JS()
class Column {
  /// [deno-postgres@v0.17.0/Column](https://deno.land/x/postgres@v0.17.0/query/decode.ts?s=Column).
  external String get name;

  /// [deno-postgres@v0.17.0/Column](https://deno.land/x/postgres@v0.17.0/query/decode.ts?s=Column).
  external int get tableOid;

  /// [deno-postgres@v0.17.0/Column](https://deno.land/x/postgres@v0.17.0/query/decode.ts?s=Column).
  external int get index;

  /// [deno-postgres@v0.17.0/Column](https://deno.land/x/postgres@v0.17.0/query/decode.ts?s=Column).
  external int get typeOid;

  /// [deno-postgres@v0.17.0/Column](https://deno.land/x/postgres@v0.17.0/query/decode.ts?s=Column).
  external int get columnLength;

  /// [deno-postgres@v0.17.0/Column](https://deno.land/x/postgres@v0.17.0/query/decode.ts?s=Column).
  external int get typeModifier;

  /// [deno-postgres@v0.17.0/Column](https://deno.land/x/postgres@v0.17.0/query/decode.ts?s=Column#ctor_0).
  factory Column({
    required String name,
    required int tableOid,
    required int index,
    required int typeOid,
    required int columnLength,
    required int typeModifier,
    required ColumnFormat format,
  }) =>
      callConstructor('Column', [
        name,
        tableOid,
        index,
        typeOid,
        columnLength,
        typeModifier,
        format.id,
      ]);
}

/// [deno-postgres@v0.17.0/Column](https://deno.land/x/postgres@v0.17.0/query/decode.ts?s=Column).
extension ColumnProps on Column {
  /// [deno-postgres@v0.17.0/Column](https://deno.land/x/postgres@v0.17.0/query/decode.ts?s=Column).
  ColumnFormat get format => ColumnFormat.values
      .firstWhere((e) => e.id == getProperty(this, 'format'));
}

/// enum Format {
///   TEXT = 0,
///   BINARY = 1,
/// }
enum ColumnFormat {
  /// text.
  text(0),

  /// binary.
  binary(1);

  /// Used for interop.
  final int id;

  const ColumnFormat(this.id);
}
