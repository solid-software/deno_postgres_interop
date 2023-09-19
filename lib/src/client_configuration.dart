import 'dart:js_interop';

import 'package:deno_postgres_interop/src/transport.dart';

/// [deno-postgres@v0.17.0/ClientConfiguration](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ClientConfiguration).
@JS()
class ClientConfiguration {
  external String get applicationName;
  // external ConnectionOptions get connection;
  external String get database;
  external String get hostname;
  external Transport get host_type;
  // external Record<String, String> get options;
  external String? get password;
  external int get port;
  // external TLSOptions get tls;
  external String get user;
}
