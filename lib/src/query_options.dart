import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/src/client_common.dart';
import 'package:deno_postgres_interop/src/encoded_arg.dart';

/// [deno-postgres@v0.17.0/QueryOptions](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryOptions).
@JS()
class QueryOptions {
  /// [deno-postgres@v0.17.0/QueryOptions/args](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryOptions#prop_args).
  external QueryArguments? get args;

  /// [deno-postgres@v0.17.0/QueryOptions/encoder](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryOptions#prop_encoder).
  external EncodedArg Function(dynamic arg)? get encoder;

  /// [deno-postgres@v0.17.0/QueryOptions/name](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryOptions#prop_name).
  external String? get name;

  /// [deno-postgres@v0.17.0/QueryOptions/text](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryOptions#prop_text.
  external String get text;

  /// [deno-postgres@v0.17.0/QueryOptions](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryOptions).
  factory QueryOptions({
    required String text,
    QueryArguments? args,
    EncodedArg Function(dynamic arg)? encoder,
    String? name,
  }) =>
      jsify({
        if (args != null) 'args': args,
        if (encoder != null) 'encoder': encoder,
        if (name != null) 'name': name,
        'text': text,
      }) as QueryOptions;
}
