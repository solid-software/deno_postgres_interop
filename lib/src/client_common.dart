import 'package:deno_postgres_interop/deno_postgres_interop.dart';
import 'package:deno_postgres_interop/src/query_object_options.dart';
import 'package:deno_postgres_interop/src/util.dart';

/// [postgres@v0.17.0/QueryArguments](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryArguments).
typedef QueryArguments = Object;

/// This class hosts common interops for clients.
class ClientCommon {
  /// Common method between all Clients.
  ///
  /// [postgres@v0.17.0/Transaction/queryObject](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_queryObject_0).
  /// [postgres@v0.17.0/QueryClient/queryObject](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_queryObject_0).
  static Future<QueryObjectResult<T>> queryObject<T>(
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

  /// [postgres@v0.17.0/QueryClient/queryObject](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_queryObject_1).
  static Future<QueryObjectResult<T>> queryObjectWithOptions<T>(
    QueryObjectOptions config,
  ) =>
      throw UnimplementedError(); // TODO:

  // This one won't be implemented because it doesn't make much sense for dart,
  // the query here is of type TemplateStringsArray which is used in
  // [tagged templates](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals#tagged_templates).
  //
  // [related issue](https://github.com/dart-lang/language/issues/1988).
  //
  // [postgres@v0.17.0/QueryClient/queryObject](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_queryObject_2).
  // Future<QueryObjectResult<T>> queryObjectWithOptions<T>(
  //   List<String> query,
  //   List args,
  // ) =>
  //     throw UnimplementedError();
}
