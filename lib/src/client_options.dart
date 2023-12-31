import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/src/partial/partial_connection_options.dart';
import 'package:deno_postgres_interop/src/partial/partial_tls_options.dart';
import 'package:deno_postgres_interop/src/transport.dart';

/// [deno-postgres@v​0.17.0/ClientOptions](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions).
@JS()
class ClientOptions {
  /// [deno-postgres@v​0.17.0/ClientOptions/applicationName](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_applicationName).
  external String? get applicationName;

  /// [deno-postgres@v​0.17.0/ClientOptions/database](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_database).
  external String? get database;

  /// [deno-postgres@v​0.17.0/ClientOptions/hostname](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_hostname).
  external String? get hostname;

  /// [deno-postgres@v​0.17.0/ClientOptions/password](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_password).
  external String? get password;

  /// [deno-postgres@v​0.17.0/ClientOptions/user](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_applicationName/user).
  external String? get user;

  /// [deno-postgres@v​0.17.0/ClientOptions](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions).
  factory ClientOptions({
    String? applicationName,
    PartialConnectionOptions? connection,
    String? database,
    String? hostname,
    Transport? hostType,
    String? optionsString,
    Map<String, String>? optionsMap,
    String? password,
    String? portString,
    int? port,
    PartialTLSOptions? tls,
    String? user,
  }) {
    assert(optionsString == null || optionsMap == null);
    assert(portString == null || port == null);

    return jsify(
      {
        if (applicationName != null) 'applicationName': applicationName,
        if (connection != null) 'connection': jsify(connection.asMap()),
        if (database != null) 'database': database,
        if (hostname != null) 'hostname': hostname,
        if (hostType != null) 'host_type': hostType.name,
        if (optionsString != null)
          'options': optionsString
        else if (optionsMap != null)
          'options': jsify(optionsMap),
        if (password != null) 'password': password,
        if (portString != null)
          'port': portString
        else if (port != null)
          'port': port,
        if (tls != null) 'tls': jsify(tls.asMap()),
        if (user != null) 'user': user,
      },
    ) as ClientOptions;
  }
}

/// [deno-postgres@v​0.17.0/ClientOptions](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions).
extension ClientOptionsProps on ClientOptions {
  /// [deno-postgres@v​0.17.0/ClientOptions/host_type](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_host_type).
  Transport get hostType => Transport.parse(getProperty(this, 'host_type'));

  /// [deno-postgres@v​0.17.0/ClientOptions/options](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_options).
  ///
  /// Either this or [optionsMap] is null.
  String? get optionsString {
    final prop = getProperty(this, 'options');

    return prop is String ? prop : null;
  }

  /// [deno-postgres@v​0.17.0/ClientOptions/options](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_options).
  ///
  /// Either this or [optionsString] is null.
  Map<String, String>? get optionsMap {
    final prop = getProperty(this, 'options');

    return prop is String ? null : prop as Map<String, String>;
  }

  /// [deno-postgres@v​0.17.0/ClientOptions/port](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_port).
  ///
  /// Either this or [port] is null.
  String? get portString {
    final prop = getProperty(this, 'port');

    return prop is String ? prop : null;
  }

  /// [deno-postgres@v​0.17.0/ClientOptions/port](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_port).
  ///
  /// Either this or [portString] is null.
  int? get port {
    final prop = getProperty(this, 'port');

    return prop is int ? prop : null;
  }

  /// [deno-postgres@v​0.17.0/ClientOptions/connection](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_connection).
  PartialConnectionOptions? get connection {
    final map =
        dartify(getProperty(this, 'connection')) as Map<dynamic, dynamic>?;

    return map == null ? null : PartialConnectionOptions.fromMap(map);
  }

  /// [deno-postgres@v​0.17.0/ClientOptions/tls](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_tls).
  PartialTLSOptions? get tls {
    final map =
        dartify(getProperty(this, 'connection')) as Map<dynamic, dynamic>?;

    if (map == null) return null;

    return PartialTLSOptions(
      caCertificates: map['caCertificates'] as List<String>?,
      isEnabled: map['enabled'] as bool?,
      isEnforced: map['enforced'] as bool?,
    );
  }
}
