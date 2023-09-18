import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/src/query_object.dart';
import 'package:deno_postgres_interop/src/result_type.dart';

/// [deno-postgres@v0.17.0/Query](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query).
@JS()
class Query<T extends ResultType> {
  /// [deno-postgres@v0.17.0/Query/args](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query#prop_args).
  external List<EncodedArg> args;

  /// [deno-postgres@v0.17.0/Query/args](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query#prop_fields).
  external List<String>? get fields;

  /// [deno-postgres@v0.17.0/Query/args](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query#prop_text).
  external String get text;

  /// [deno-postgres@v0.17.0/Query/constructor](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query#ctor_0).
  /// [deno-postgres@v0.17.0/Query/constructor](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query#ctor_2).
  factory Query.withConfig({
    required QueryObjectOptions config,
    required T resultType,
    QueryArguments? args,
  }) =>
      callConstructor('Query', [config, resultType, args]) as Query<T>;

  /// [deno-postgres@v0.17.0/Query/constructor](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query#ctor_1).
  /// [deno-postgres@v0.17.0/Query/constructor](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query#ctor_2).
  factory Query.withArgs({
    required String text,
    required T resultType,
    QueryArguments? args,
  }) =>
      callConstructor('Query', [text, resultType, args]) as Query<T>;
}

/// [deno-postgres@v0.17.0/Query](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query).
extension QueryProps<T extends ResultType> on Query<T> {
  /// [deno-postgres@v0.17.0/Query/args](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query#prop_result_type).
  ResultType get resultType => getProperty(this, 'result_type');

  /// [deno-postgres@v0.17.0/Query/args](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query#prop_camelcase).
  bool? get isCamelCase => getProperty(this, 'camelcase');
}

class QueryObjectOptions {}

class EncodedArg {}
