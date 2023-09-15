import 'dart:js_interop';
import 'dart:js_util';

/// [postgres@v0.17.0/QueryObjectOptions](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryObjectOptions).
@JS()
class QueryObjectOptions {
  /// [postgres@v0.17.0/QueryObjectOptions/fields](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#prop_fields).
  external List<String>? get fields;
}

/// [postgres@v0.17.0/QueryObjectOptions](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryObjectOptions).
extension QueryObjectOptionsProps on QueryObjectOptions {
  /// [postgres@v0.17.0/QueryObjectOptions/camelcase](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#prop_camelcase).
  bool? get isCamelcase => getProperty(this, 'camelcase');
}
