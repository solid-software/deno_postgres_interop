import 'dart:js_interop';

import 'package:deno_postgres_interop/src/query_result.dart';

@JS()
class QueryArrayResult<T> extends QueryResult {}
