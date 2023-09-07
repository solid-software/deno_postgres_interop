// https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryObjectResult
import 'dart:js_interop';
import 'dart:js_util';

@JS()
class QueryObjectResult<T> {
  external List<String>? get columns;
}

extension QueryObjectResultProps<T> on QueryObjectResult<T> {
  List<Map<String, dynamic>> get rows =>
      // ignore: cast_nullable_to_non_nullable
      (dartify(getProperty(this, 'rows')) as List)
          .cast<Map<dynamic, dynamic>>()
          .map((e) => e.cast<String, dynamic>())
          .toList();
}
