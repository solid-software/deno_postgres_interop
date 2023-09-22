import 'package:deno_postgres_interop/src/query_array_result.dart';
import 'package:deno_postgres_interop/src/query_object_options.dart';
import 'package:deno_postgres_interop/src/query_object_result.dart';
import 'package:deno_postgres_interop/src/util.dart';

/// [deno-postgres@v​0.17.0/QueryArguments](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryArguments).
typedef QueryArguments = Object;

/// This class hosts common interops for clients.
class ClientCommon {
  /// [deno-postgres@v​0.17.0/Transaction/queryArray](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_queryArray_0).
  /// [deno-postgres@v​0.17.0/QueryClient/queryArray](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_queryArray_0).
  static Future<QueryArrayResult<T>> queryArray<T extends List<dynamic>>(
    Object queryable,
    String query, [
    QueryArguments? arguments,
  ]) =>
      _query('queryArray', queryable, query, arguments);

  /// [deno-postgres@v​0.17.0/Transaction/queryArray](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_queryArray_1).
  /// [deno-postgres@v​0.17.0/QueryClient/queryArray](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_queryArray_1).
  static Future<QueryArrayResult<T>>
      queryArrayWithOptions<T extends List<dynamic>>(
    Object queryable,
    QueryObjectOptions config,
  ) =>
          callFutureMethod(queryable, 'queryArray', [config]);

  // This one won't be implemented because it doesn't make much sense for dart,
  // the query here is of type TemplateStringsArray which is used in
  // [tagged templates](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals#tagged_templates).
  //
  // [related issue](https://github.com/dart-lang/language/issues/1988).
  //
  // queryArray<T extends Array<unknown>>(
  //   strings: TemplateStringsArray,
  //   ...args: unknown[],
  // ): Promise<QueryArrayResult<T>>
  // https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_queryArray_2

  /// [deno-postgres@v​0.17.0/Transaction/queryObject](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_queryObject_0).
  /// [deno-postgres@v​0.17.0/QueryClient/queryObject](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_queryObject_0).
  static Future<QueryObjectResult<T>> queryObject<T>(
    Object queryable,
    String query, [
    QueryArguments? arguments,
  ]) =>
      _query('queryObject', queryable, query, arguments);

  /// [deno-postgres@v​0.17.0/Transaction/queryObject](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Transaction#method_queryObject_1).
  /// [deno-postgres@v​0.17.0/QueryClient/queryObject](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_queryObject_1).
  static Future<QueryObjectResult<T>> queryObjectWithOptions<T>(
    Object queryable,
    QueryObjectOptions config,
  ) =>
      callFutureMethod(queryable, 'queryObject', [config]);

  // This one won't be implemented because it doesn't make much sense for dart,
  // the query here is of type TemplateStringsArray which is used in
  // [tagged templates](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals#tagged_templates).
  //
  // [related issue](https://github.com/dart-lang/language/issues/1988).
  //
  // [deno-postgres@v​0.17.0/QueryClient/queryObject](https://deno.land/x/postgres@v0.17.0/mod.ts?s=QueryClient#method_queryObject_2).
  // Future<QueryObjectResult<T>> queryObjectWithOptions<T>(
  //   List<String> query,
  //   List args,
  // ) =>
  //     throw UnimplementedError();

  static Future<T> _query<T>(
    String function,
    Object queryable,
    String query, [
    QueryArguments? arguments,
  ]) {
    _assertQueryArgumentsOrNull(arguments);

    return callFutureMethod(
      queryable,
      function,
      [
        query,
        if (arguments != null) arguments,
      ],
    );
  }
}

void _assertQueryArgumentsOrNull(QueryArguments? arguments) {
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
}
