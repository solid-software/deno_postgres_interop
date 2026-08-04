import 'dart:js_interop';

import 'package:deno_postgres_interop/src/client_common.dart';
import 'package:deno_postgres_interop/src/encoded_arg.dart';
import 'package:deno_postgres_interop/src/query_object_options.dart';
import 'package:deno_postgres_interop/src/result_type.dart';

/// [deno-postgres@v​0.17.0/Query](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query).
@JS('Query')
extension type Query._(JSObject _) implements JSObject {
  /// [deno-postgres@v​0.17.0/Query/constructor](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query#ctor_0).
  /// [deno-postgres@v​0.17.0/Query/constructor](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query#ctor_2).
  factory Query.withConfig({
    required QueryObjectOptions config,
    required ResultType resultType,
    QueryArguments? args,
  }) =>
      Query._internal(
        config,
        resultType.index,
        args?.jsify(),
      );

  /// [deno-postgres@v​0.17.0/Query/constructor](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query#ctor_1).
  /// [deno-postgres@v​0.17.0/Query/constructor](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query#ctor_2).
  factory Query.withArgs({
    required String text,
    required ResultType resultType,
    QueryArguments? args,
  }) =>
      Query._internal(
        text.toJS,
        resultType.index,
        args?.jsify(),
      );

  @JS('Query')
  external factory Query._internal(
    JSAny configOrText,
    int resultType,
    JSAny? args,
  );

  @JS('args')
  external JSArray<EncodedArg> get _args;
  @JS('args')
  external set _args(JSArray<EncodedArg> val);

  /// [deno-postgres@v​0.17.0/Query/args](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query#prop_args).
  List<EncodedArg> get args => _args.toDart;
  set args(List<EncodedArg> val) => _args = val.toJS;

  @JS('fields')
  external JSArray<JSString>? get _fields;

  /// [deno-postgres@v​0.17.0/Query/args](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query#prop_fields).
  List<String>? get fields => _fields?.toDart.map((e) => e.toDart).toList();

  /// [deno-postgres@v​0.17.0/Query/args](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query#prop_text).
  external String get text;

  /// [deno-postgres@v​0.17.0/Query/args](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query#prop_camelcase).
  @JS('camelcase')
  external bool? get isCamelCase;

  @JS('result_type')
  external int get _resultType;

  /// [deno-postgres@v​0.17.0/Query/result_type](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=Query#prop_result_type).
  ResultType get resultType => ResultType.values[_resultType];
}
