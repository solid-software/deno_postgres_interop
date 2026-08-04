import 'dart:js_interop';

import 'package:deno_postgres_interop/src/connection_options.dart';
import 'package:deno_postgres_interop/src/tls_options.dart';
import 'package:deno_postgres_interop/src/transport.dart';

/// [deno-postgres@v​0.17.0/ClientConfiguration](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ClientConfiguration).
@JS('ClientConfiguration')
extension type ClientConfiguration._(JSObject _) implements JSObject {
  /// [deno-postgres@v​0.17.0/ClientConfiguration/applicationName](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ClientConfiguration#prop_applicationName).
  external String get applicationName;

  /// [deno-postgres@v​0.17.0/ClientConfiguration/connection](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ClientConfiguration#prop_connection).
  external ConnectionOptions get connection;

  /// [deno-postgres@v​0.17.0/ClientConfiguration/database](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ClientConfiguration#prop_database).
  external String get database;

  /// [deno-postgres@v​0.17.0/ClientConfiguration/hostname](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ClientConfiguration#prop_hostname).
  external String get hostname;

  @JS('options')
  external JSAny? get _options;

  /// [deno-postgres@v​0.17.0/ClientConfiguration/options](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ClientConfiguration#prop_options).
  Map<String, String> get options {
    final map = _options?.dartify();
    if (map is Map) {
      return map.cast<String, String>();
    }

    return const {};
  }

  /// [deno-postgres@v​0.17.0/ClientConfiguration/password](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ClientConfiguration#prop_password).
  external String? get password;

  /// [deno-postgres@v​0.17.0/ClientConfiguration/port](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ClientConfiguration#prop_port).
  external int get port;

  /// [deno-postgres@v​0.17.0/ClientConfiguration/tls](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ClientConfiguration#prop_tls).
  external TLSOptions get tls;

  /// [deno-postgres@v​0.17.0/ClientConfiguration/user](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ClientConfiguration#prop_user).
  external String get user;

  @JS('host_type')
  external String get _hostType;

  /// [deno-postgres@v​0.17.0/ClientConfiguration/host_type](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ClientConfiguration#prop_host_type).
  Transport get hostType => Transport.parse(_hostType);

  /// [deno-postgres@v​0.17.0/ClientConfiguration](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ClientConfiguration).
  factory ClientConfiguration({
    required String applicationName,
    required ConnectionOptions connection,
    required String database,
    required String hostname,
    required String options,
    required int port,
    required TLSOptions tls,
    required String user,
    required Transport hostType,
    String? password,
  }) =>
      ClientConfiguration._(
        {
          'applicationName': applicationName,
          'connection': connection,
          'database': database,
          'hostname': hostname,
          'options': options,
          if (password != null) 'password': password,
          'port': port,
          'tls': tls,
          'user': user,
          'hostType': hostType.name,
        }.jsify()! as JSObject,
      );
}
