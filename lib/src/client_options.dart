import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/src/partial_connection_options.dart';
import 'package:deno_postgres_interop/src/partial_tls_options.dart';
import 'package:deno_postgres_interop/src/transport.dart';

/// [deno-postgres@v0.17.0/ClientOptions](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions).
@JS()
class ClientOptions {
  /// [deno-postgres@v0.17.0/ClientOptions/applicationName](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_applicationName).
  external String get applicationName;

  /// [deno-postgres@v0.17.0/ClientOptions/database](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_database).
  external String get database;

  /// [deno-postgres@v0.17.0/ClientOptions/hostname](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_hostname).
  external String get hostname;

  /// [deno-postgres@v0.17.0/ClientOptions/password](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_password).
  external String get password;

  /// [deno-postgres@v0.17.0/ClientOptions/user](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_user).
  external String get user;
}

/// [deno-postgres@v0.17.0/ClientOptions](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions).
extension ClientOptionsProps on ClientOptions {
  /// [deno-postgres@v0.17.0/ClientOptions/connection](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_connection).
  external PartialConnectionOptions get connection;

  /// [deno-postgres@v0.17.0/ClientOptions/host_type](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_host_type).
  Transport get hostType => Transport.parse(getProperty(this, 'host_type'));

  /// [deno-postgres@v0.17.0/ClientOptions/options](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_options).
  // external String | Record<string, string> get options;

  /// [deno-postgres@v0.17.0/ClientOptions/port](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_port).
  // external String | number get port;

  /// [deno-postgres@v0.17.0/ClientOptions/tls](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_tls).
  external PartialTLSOptions get tls;
}
