import 'dart:js_interop';

/// [deno-postgres@v0.17.0/ClientOptions](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions)
@JS()
class ClientOptions {
  /// [deno-postgres@v0.17.0/]()
  external String get applicationName;

  /// [deno-postgres@v0.17.0/]()
  // external Partial<ConnectionOptions> get connection;

  /// [deno-postgres@v0.17.0/]()
  external String get database;

  /// [deno-postgres@v0.17.0/]()
  external String get hostname;

  // TODO: convert
  /// [deno-postgres@v0.17.0/]()
  // external Transport get host_type;

  /// [deno-postgres@v0.17.0/]()
  // external String | Record<string, string> get options;

  /// [deno-postgres@v0.17.0/]()
  external String get password;

  /// [deno-postgres@v0.17.0/]()
  // external String | number get port;

  /// [deno-postgres@v0.17.0/]()
  // external Partial<TLSOptions> get tls;

  /// [deno-postgres@v0.17.0/]()
  external String get user;
}
