// https://deno.land/x/postgres@v0.17.0/mod.ts?s=Client
import 'dart:js_interop';

import 'package:deno_postgres_interop/src/query_client.dart';

@JS()
class Client extends QueryClient {
  external factory Client(String dbUrl);
}
