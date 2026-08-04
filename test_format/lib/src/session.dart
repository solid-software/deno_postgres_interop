import 'dart:js_interop';

import 'package:deno_postgres_interop/src/transport.dart';

/// [deno-postgres@v​0.17.0/Session](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Session).
@JS('Session')
extension type Session._(JSObject _) implements JSObject {
  /// [deno-postgres@v​0.17.0/Session/pid](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Session#prop_pid)
  external int? get pid;

  /// [deno-postgres@v​0.17.0/Session/tls](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Session#prop_tls)
  external bool? get tls;

  /// [deno-postgres@v​0.17.0/Session/current_transaction](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Session#prop_current_transaction)
  @JS('current_transaction')
  external String? get currentTransacton;

  @JS('transport')
  external String? get _transport;

  /// [deno-postgres@v​0.17.0/Session/transport](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Session#prop_transport)
  Transport? get transport {
    final string = _transport;

    return string == null ? null : Transport.parse(string);
  }
}
