import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/src/partial/partial_connection_options.dart';

/// [deno-postgres@v​0.17.0/ConnectionOptions](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ConnectionOptions).
@JS()
class ConnectionOptions {
  /// [deno-postgres@v​0.17.0/ConnectionOptions](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ConnectionOptions#prop_attempts).
  external int get attempts;

  /// [deno-postgres@v​0.17.0/ConnectionOptions](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ConnectionOptions).
  factory ConnectionOptions({
    required int attempts,
    int Function(int previousInterval)? nextInterval,
    int? interval,
  }) {
    return jsify(
      PartialConnectionOptions(
        attempts: attempts,
        nextInterval: nextInterval,
        interval: interval,
      ).asMap(),
    ) as ConnectionOptions;
  }
}

/// [deno-postgres@v​0.17.0/ConnectionOptions](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ConnectionOptions).
extension ConnectionOptionsProps on ConnectionOptions {
  /// [deno-postgres@v​0.17.0/ConnectionOptions](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ConnectionOptions#prop_interval).
  ///
  /// Either this or [interval] is null.
  int Function(int previousInterval)? get nextInterval {
    final prop = getProperty(this, 'interval');

    return prop is int ? null : prop as int Function(int previousInterval);
  }

  /// [deno-postgres@v​0.17.0/ConnectionOptions](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ConnectionOptions#prop_interval).
  ///
  /// Either this or [nextInterval] is null.
  int? get interval {
    final prop = getProperty(this, 'interval');

    return prop is int ? prop : null;
  }
}
