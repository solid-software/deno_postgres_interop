import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/src/transport.dart';

/// [deno-postgres@v0.17.0/Session](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Session).
@JS()
class Session {
  external int? get pid;
  external bool? get tls;
}

/// [deno-postgres@v0.17.0/Session](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Session).
extension SessionProps on Session {
  String? get currentTransacton => getProperty(this, 'current_transaction');

  Transport? get transport {
    final string = getProperty<String?>(this, 'transport');

    return string == null ? null : Transport.parse(string);
  }
}
