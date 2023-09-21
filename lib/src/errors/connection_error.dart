import 'dart:js_interop';

import 'package:deno_postgres_interop/src/errors/js_error.dart';

/// [deno-postgres@v0.17.0/ConnectionError](https://deno.land/x/postgres@v0.17.0/client/error.ts?s=ConnectionError).
@JS('Error')
class ConnectionError extends JSError {}
