import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/src/result_type.dart';

/// [deno-postgres@v0.17.0/Query](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query).
@JS()
class Query {}

/// [deno-postgres@v0.17.0/Query](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query).
extension QueryProps on Query {
  /// [deno-postgres@v0.17.0/Query/result_type](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query#prop_result_type).
  ResultType get resultType =>
      ResultType.values[getProperty(this, 'result_type')];
}
