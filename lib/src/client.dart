import 'dart:js_interop';

import 'package:deno_postgres_interop/src/client_options.dart';
import 'package:deno_postgres_interop/src/query_client.dart';

/// [deno-postgres@v​0.17.0/Client](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Client).
@JS('Client')
extension type Client._(JSObject _) implements QueryClient, JSObject {
  /// [deno-postgres@v​0.17.0/Client/constructor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Client#ctor_0).
  factory Client(String dbUrl) => Client._internal(dbUrl.toJS);

  /// [deno-postgres@v​0.17.0/Client/constructor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Client#ctor_0).
  factory Client.config(ClientOptions config) => Client._internal(config);

  /// [deno-postgres@v​0.17.0/Client/constructor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Client#ctor_0).
  factory Client.empty() => Client._internal();

  @JS('Client')
  external factory Client._internal([JSAny? configOrUrl]);
}
