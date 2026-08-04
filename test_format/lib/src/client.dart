import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:deno_postgres_interop/src/client_options.dart';
import 'package:deno_postgres_interop/src/query_client.dart';

/// [deno-postgres@v​0.17.0/Client](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Client).
@JS('Client')
extension type Client._(JSObject _) implements QueryClient, JSObject {
  /// [deno-postgres@v​0.17.0/Client/constructor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Client#ctor_0).
  factory Client(String dbUrl) => _createClient(dbUrl.toJS);

  /// [deno-postgres@v​0.17.0/Client/constructor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Client#ctor_0).
  factory Client.config(ClientOptions config) => _createClient(config);

  /// [deno-postgres@v​0.17.0/Client/constructor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=Client#ctor_0).
  factory Client.empty() => _createClient();

  static Client _createClient([JSAny? configOrUrl]) {
    final constructor = globalContext['Client'] as JSFunction?;
    if (constructor == null) {
      throw StateError('Client constructor not found in global context.');
    }

    return configOrUrl != null
        ? constructor.callAsConstructor<Client>(configOrUrl)
        : constructor.callAsConstructor<Client>();
  }
}
