import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/src/transport.dart';

/// [deno-postgres@v0.17.0/Session](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Session).
@JS()
class Session {
  /// [deno-postgres@v0.17.0/Session/pid](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Session#prop_pid)
  external int? get pid;

  /// [deno-postgres@v0.17.0/Session/tls](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Session#prop_tls)
  external bool? get tls;
}

/// [deno-postgres@v0.17.0/Session](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Session).
extension SessionProps on Session {
  /// [deno-postgres@v0.17.0/Session/current_transaction](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Session#prop_current_transaction)
  String? get currentTransacton => getProperty(this, 'current_transaction');

  /// [deno-postgres@v0.17.0/Session/transport](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Session#prop_transport)
  Transport? get transport {
    final string = getProperty<String?>(this, 'transport');

    return string == null ? null : Transport.parse(string);
  }
}
