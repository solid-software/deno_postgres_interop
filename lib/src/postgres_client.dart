import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/src/client_options.dart';
import 'package:deno_postgres_interop/src/query_client.dart';

/// [deno-postgres@v​0.17.0/Client](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Client).
@JS('Client')
class PostgresClient extends QueryClient {
  /// [deno-postgres@v​0.17.0/Client/constructor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Client#ctor_0).
  external factory PostgresClient(String dbUrl);

  /// [deno-postgres@v​0.17.0/Client/constructor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Client#ctor_0).
  factory PostgresClient.config(ClientOptions config) =>
      callConstructor('Client', [config]);

  /// [deno-postgres@v​0.17.0/Client/constructor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Client#ctor_0).
  factory PostgresClient.empty() => callConstructor('Client', null);
}
