import 'dart:js_interop';

import 'package:deno_postgres_interop/src/client_common.dart';
import 'package:deno_postgres_interop/src/encoded_arg.dart';

/// [deno-postgres@v​0.17.0/QueryOptions](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryOptions).
@JS('QueryOptions')
extension type QueryOptions._(JSObject _) implements JSObject {
  @JS('args')
  external JSAny? get _args;

  /// [deno-postgres@v​0.17.0/QueryOptions/args](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryOptions#prop_args).
  QueryArguments? get args => _args?.dartify();

  @JS('encoder')
  external JSFunction? get _encoder;

  /// [deno-postgres@v​0.17.0/QueryOptions/encoder](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryOptions#prop_encoder).
  EncodedArg Function(dynamic arg)? get encoder {
    final fn = _encoder;
    if (fn == null) return null;

    return (Object? arg) => fn.callAsFunction(null, arg?.jsify());
  }

  /// [deno-postgres@v​0.17.0/QueryOptions/name](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryOptions#prop_name).
  external String? get name;

  /// [deno-postgres@v​0.17.0/QueryOptions/text](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryOptions#prop_text).
  external String get text;

  /// [deno-postgres@v​0.17.0/QueryOptions](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=QueryOptions).
  factory QueryOptions({
    required String text,
    QueryArguments? args,
    EncodedArg Function(dynamic arg)? encoder,
    String? name,
  }) => QueryOptions._(
    {
          if (args != null) 'args': args,
          if (encoder != null)
            'encoder': ((JSAny? arg) => encoder(arg?.dartify())).toJS,
          if (name != null) 'name': name,
          'text': text,
        }.jsify()!
        as JSObject,
  );
}
