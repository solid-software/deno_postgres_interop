import 'dart:js_util';

import 'package:deno_postgres_interop/src/transport.dart';

/// [deno-postgres@v0.17.0/ClientOptions](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions).
class ClientOptions {
  /// [deno-postgres@v0.17.0/ClientOptions/applicationName](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_applicationName).
  external String get applicationName;

  // TODO:
  /// [deno-postgres@v0.17.0/ClientOptions/connection](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_connection).
  // external Partial<ConnectionOptions> get connection;

  /// [deno-postgres@v0.17.0/ClientOptions/database](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_database).
  external String get database;

  /// [deno-postgres@v0.17.0/ClientOptions/hostname](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_hostname).
  external String get hostname;

  /// [deno-postgres@v0.17.0/ClientOptions/password](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_password).
  external String get password;

  // TODO:
  /// [deno-postgres@v0.17.0/ClientOptions/tls](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_tls).
  // external Partial<TLSOptions> get tls;

  /// [deno-postgres@v0.17.0/ClientOptions/user](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_applicationName/user).
  external String get user;
}

/// [deno-postgres@v0.17.0/ClientOptions](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions).
extension ClientOptionsProps on ClientOptions {
  /// [deno-postgres@v0.17.0/ClientOptions/host_type](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_host_type).
  Transport get hostType => getProperty(this, 'host_type');

  /// [deno-postgres@v0.17.0/ClientOptions/options](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_options).
  ///
  /// Either this or [optionsMap] is null.
  String? get optionsString {
    final prop = getProperty(this, 'options');

    return prop is String ? prop : null;
  }

  /// [deno-postgres@v0.17.0/ClientOptions/options](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_options).
  ///
  /// Either this or [optionsString] is null.
  Map<String, String>? get optionsMap {
    final prop = getProperty(this, 'options');

    return prop is String ? null : prop as Map<String, String>;
  }

  /// [deno-postgres@v0.17.0/ClientOptions/port](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_port).
  ///
  /// Either this or [port] is null.
  String? get portString {
    final prop = getProperty(this, 'port');

    return prop is String ? prop : null;
  }

  /// [deno-postgres@v0.17.0/ClientOptions/port](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions#prop_port).
  ///
  /// Either this or [portString] is null.
  int? get port {
    final prop = getProperty(this, 'port');

    return prop is int ? prop : null;
  }
}
