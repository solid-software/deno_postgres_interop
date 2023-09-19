import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/src/connection_options.dart';
import 'package:deno_postgres_interop/src/tls_options.dart';
import 'package:deno_postgres_interop/src/transport.dart';

/// [deno-postgres@v0.17.0/ClientConfiguration](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ClientConfiguration).
@JS()
class ClientConfiguration {
  /// [deno-postgres@v0.17.0/ClientConfiguration/applicationName](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ClientConfiguration#prop_applicationName).
  external String get applicationName;

  /// [deno-postgres@v0.17.0/ClientConfiguration/connection](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ClientConfiguration#prop_connection).
  external ConnectionOptions get connection;

  /// [deno-postgres@v0.17.0/ClientConfiguration/database](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ClientConfiguration#prop_database).
  external String get database;

  /// [deno-postgres@v0.17.0/ClientConfiguration/hostname](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ClientConfiguration#prop_hostname).
  external String get hostname;

  /// [deno-postgres@v0.17.0/ClientConfiguration/options](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ClientConfiguration#prop_options).
  external Map<String, String> get options;

  /// [deno-postgres@v0.17.0/ClientConfiguration/password](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ClientConfiguration#prop_password).
  external String? get password;

  /// [deno-postgres@v0.17.0/ClientConfiguration/port](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ClientConfiguration#prop_port).
  external int get port;

  /// [deno-postgres@v0.17.0/ClientConfiguration/tls](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ClientConfiguration#prop_tls).
  external TLSOptions get tls;

  /// [deno-postgres@v0.17.0/ClientConfiguration/user](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ClientConfiguration#prop_user).
  external String get user;
}

/// [deno-postgres@v0.17.0/ClientConfiguration](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ClientConfiguration).
extension ClientConfigurationProps on ClientConfiguration {
  /// [deno-postgres@v0.17.0/ClientConfiguration/host_type](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ClientConfiguration#prop_host_type).
  Transport get hostType => getProperty(this, 'host_type');
}
