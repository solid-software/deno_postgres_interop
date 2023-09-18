import 'dart:js_util';

/// [deno-postgres@v0.17.0/QueryObjectOptions](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryObjectOptions).
class QueryObjectOptions {
  /// [deno-postgres@v0.17.0/QueryObjectOptions/fields](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryObjectOptions#prop_fields).
  external List<String>? get fields;

  /// [deno-postgres@v0.17.0/QueryObjectOptions](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryObjectOptions).
  factory QueryObjectOptions({List<String>? fields, bool? isCamelCase}) =>
      jsify(
        {
          if (isCamelCase != null) 'camelcase': isCamelCase,
          if (fields != null) 'fields': fields,
        },
      ) as QueryObjectOptions;
}

/// [deno-postgres@v0.17.0/QueryObjectOptions](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryObjectOptions).
extension QueryObjectOptionsProps on QueryObjectOptions {
  /// [deno-postgres@v0.17.0/QueryObjectOptions/camelcase](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryObjectOptions#prop_camelcase).
  bool? get isCamelCase => getProperty(this, 'camelcase');
}
