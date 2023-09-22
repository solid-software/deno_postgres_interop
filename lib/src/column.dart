import 'dart:js_interop';
import 'dart:js_util';

/// [deno-postgres@​0.17.0/Column](https://deno.land/x/postgres@v0.17.0/query/decode.ts?s=Column).
@JS()
class Column {
  /// [deno-postgres@​0.17.0/Column](https://deno.land/x/postgres@v0.17.0/query/decode.ts?s=Column).
  external String get name;

  /// [deno-postgres@​0.17.0/Column](https://deno.land/x/postgres@v0.17.0/query/decode.ts?s=Column).
  external int get tableOid;

  /// [deno-postgres@​0.17.0/Column](https://deno.land/x/postgres@v0.17.0/query/decode.ts?s=Column).
  external int get index;

  /// [deno-postgres@​0.17.0/Column](https://deno.land/x/postgres@v0.17.0/query/decode.ts?s=Column).
  external int get typeOid;

  /// [deno-postgres@​0.17.0/Column](https://deno.land/x/postgres@v0.17.0/query/decode.ts?s=Column).
  external int get columnLength;

  /// [deno-postgres@​0.17.0/Column](https://deno.land/x/postgres@v0.17.0/query/decode.ts?s=Column).
  external int get typeModifier;

  /// [deno-postgres@​0.17.0/Column](https://deno.land/x/postgres@v0.17.0/query/decode.ts?s=Column#ctor_0).
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

/// [deno-postgres@​0.17.0/Column](https://deno.land/x/postgres@v0.17.0/query/decode.ts?s=Column).
extension ColumnProps on Column {
  /// [deno-postgres@​0.17.0/Column](https://deno.land/x/postgres@v0.17.0/query/decode.ts?s=Column).
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
