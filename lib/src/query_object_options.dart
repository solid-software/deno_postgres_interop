import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/src/query_options.dart';

/// [deno-postgres@v0.17.0/QueryObjectOptions](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryObjectOptions).
@JS()
class QueryObjectOptions extends QueryOptions {
  /// [deno-postgres@v0.17.0/QueryObjectOptions/fields](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#prop_fields).
  external List<String>? get fields;

  /// [deno-postgres@v0.17.0/QueryObjectOptions](https://deno.land/x/postgres@v0.17.0/query/mod.ts?s=QueryObjectOptions).
  factory QueryObjectOptions({List<String>? fields, bool? isCamelCase}) =>
      jsify(
        {
          if (isCamelCase != null) 'camelcase': isCamelCase,
          if (fields != null) 'fields': fields,
        },
      ) as QueryObjectOptions;
}

/// [deno-postgres@v0.17.0/QueryObjectOptions](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryObjectOptions).
extension QueryObjectOptionsProps on QueryObjectOptions {
  /// [deno-postgres@v0.17.0/QueryObjectOptions/camelcase](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#prop_camelcase).
  bool? get isCamelcase => getProperty(this, 'camelcase');
}
