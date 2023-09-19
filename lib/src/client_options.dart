import 'package:deno_postgres_interop/src/transport.dart';

/// [deno-postgres@v0.17.0/ClientOptions](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ClientOptions).
class ClientOptions {
  external String get applicationName;
  // external Partial<ConnectionOptions> get connection;
  external String get database;
  external String get hostname;
  external Transport get host_type;
//  external String | Record<string, string> get options;
  external String get password;
//  external String | number get port;
  // external Partial<TLSOptions> get tls;
  external String get user;
}
