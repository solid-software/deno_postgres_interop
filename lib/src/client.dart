import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/src/client_options.dart';
import 'package:deno_postgres_interop/src/query_client.dart';

/// [deno-postgres@​0.17.0/Client](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Client).
@JS()
class Client extends QueryClient {
  /// [deno-postgres@​0.17.0/Client/constructor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Client#ctor_0).
  external factory Client(String dbUrl);

  /// [deno-postgres@​0.17.0/Client/constructor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Client#ctor_0).
  factory Client.config(ClientOptions config) =>
      callConstructor('Client', [config]);

  /// [deno-postgres@​0.17.0/Client/constructor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Client#ctor_0).
  factory Client.empty() => callConstructor('Client', null);
}
