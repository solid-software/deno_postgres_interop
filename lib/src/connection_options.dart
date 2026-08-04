import 'dart:js_interop';

import 'package:deno_postgres_interop/src/partial/partial_connection_options.dart';

/// [deno-postgres@v​0.17.0/ConnectionOptions](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ConnectionOptions).
@JS('ConnectionOptions')
extension type ConnectionOptions._(JSObject _) implements JSObject {
  /// [deno-postgres@v​0.17.0/ConnectionOptions](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ConnectionOptions#prop_attempts).
  external int get attempts;

  @JS('interval')
  external JSAny? get _interval;

  /// [deno-postgres@v​0.17.0/ConnectionOptions](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ConnectionOptions#prop_interval).
  ///
  /// Either this or [interval] is null.
  int Function(int previousInterval)? get nextInterval {
    final prop = _interval?.dartify();

    return prop is int ? null : prop as int Function(int previousInterval)?;
  }

  /// [deno-postgres@v​0.17.0/ConnectionOptions](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ConnectionOptions#prop_interval).
  ///
  /// Either this or [nextInterval] is null.
  int? get interval {
    final prop = _interval?.dartify();

    return prop is int ? prop : null;
  }

  /// [deno-postgres@v​0.17.0/ConnectionOptions](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ConnectionOptions).
  factory ConnectionOptions({
    required int attempts,
    int Function(int previousInterval)? nextInterval,
    int? interval,
  }) =>
      ConnectionOptions._(
        PartialConnectionOptions(
          attempts: attempts,
          nextInterval: nextInterval,
          interval: interval,
        ).asMap().jsify()! as JSObject,
      );
}
