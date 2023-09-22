import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/src/client_common.dart';
import 'package:deno_postgres_interop/src/encoded_arg.dart';
import 'package:deno_postgres_interop/src/query_object_options.dart';
import 'package:deno_postgres_interop/src/result_type.dart';

/// [deno-postgres@​0.17.0/Query](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query).
@JS()
class Query {
  /// [deno-postgres@​0.17.0/Query/args](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query#prop_args).
  external List<EncodedArg> args;

  /// [deno-postgres@​0.17.0/Query/args](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query#prop_fields).
  external List<String>? get fields;

  /// [deno-postgres@​0.17.0/Query/args](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query#prop_text).
  external String get text;

  /// [deno-postgres@​0.17.0/Query/constructor](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query#ctor_0).
  /// [deno-postgres@​0.17.0/Query/constructor](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query#ctor_2).
  factory Query.withConfig({
    required QueryObjectOptions config,
    required ResultType resultType,
    QueryArguments? args,
  }) =>
      callConstructor('Query', [config, resultType, args]) as Query;

  /// [deno-postgres@​0.17.0/Query/constructor](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query#ctor_1).
  /// [deno-postgres@​0.17.0/Query/constructor](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query#ctor_2).
  factory Query.withArgs({
    required String text,
    required ResultType resultType,
    QueryArguments? args,
  }) =>
      callConstructor('Query', [text, resultType, args]) as Query;
}

/// [deno-postgres@​0.17.0/Query](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query).
extension QueryProps on Query {
  /// [deno-postgres@​0.17.0/Query/args](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query#prop_camelcase).
  bool? get isCamelCase => getProperty(this, 'camelcase');

  /// [deno-postgres@​0.17.0/Query/result_type](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query#prop_result_type).
  ResultType get resultType =>
      ResultType.values[getProperty(this, 'result_type')];
}
