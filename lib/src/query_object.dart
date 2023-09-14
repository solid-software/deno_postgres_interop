import 'package:deno_postgres_interop/deno_postgres_interop.dart';
import 'package:deno_postgres_interop/src/util.dart';

/// [postgres@v0.17.0/QueryArguments](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryArguments).
typedef QueryArguments = Object;

/// Common method between all Clients.
///
/// [postgres@v0.17.0/Transaction/queryObject](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_queryObject_0).
/// [postgres@v0.17.0/QueryClient/queryObject](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_queryObject_0).
Future<QueryObjectResult<T>> queryObjectCommon<T>(
  Object queryable,
  String query, [
  QueryArguments? arguments,
]) {
  final isCorrectType = arguments is List ||
      arguments is Map<String, dynamic> ||
      arguments == null;

  if (!isCorrectType) {
    throw ArgumentError.value(
      arguments,
      'arguments',
      'Accepted types are List<any> and Map<String, any>.',
    );
  }

  return callFutureMethod(
    queryable,
    'queryObject',
    [
      query,
      if (arguments != null) arguments,
    ],
  );
}
