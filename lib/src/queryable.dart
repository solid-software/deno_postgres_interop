import 'package:deno_postgres_interop/src/query_object_result.dart';
import 'package:deno_postgres_interop/src/util.dart';

mixin Queryable {
  Future<QueryObjectResult<T>> queryObject<T>(String query) => callFutureMethod(
        this,
        'queryObject',
        [query],
      );
}
