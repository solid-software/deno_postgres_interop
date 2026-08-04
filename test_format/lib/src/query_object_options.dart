import 'dart:js_interop';

import 'package:deno_postgres_interop/src/query_options.dart';

/// [deno-postgres@v​0.17.0/QueryObjectOptions](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryObjectOptions).
@JS('QueryObjectOptions')
extension type QueryObjectOptions._(JSObject _)
    implements QueryOptions, JSObject {
  @JS('fields')
  external JSArray<JSString>? get _fields;

  /// [deno-postgres@v​0.17.0/QueryObjectOptions/fields](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#prop_fields).
  List<String>? get fields => _fields?.toDart.map((e) => e.toDart).toList();

  /// [deno-postgres@v​0.17.0/QueryObjectOptions/camelcase](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#prop_camelcase).
  @JS('camelcase')
  external bool? get isCamelCase;

  /// [deno-postgres@v​0.17.0/QueryObjectOptions](https://deno.land/x/postgres@v0.17.0/query/mod.ts?s=QueryObjectOptions).
  factory QueryObjectOptions({List<String>? fields, bool? isCamelCase}) =>
      QueryObjectOptions._(
        {
              if (isCamelCase != null) 'camelcase': isCamelCase,
              if (fields != null) 'fields': fields,
            }.jsify()!
            as JSObject,
      );
}
