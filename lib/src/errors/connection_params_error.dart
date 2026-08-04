import 'dart:js_interop';

import 'package:deno_postgres_interop/src/errors/js_error.dart';

/// [deno-postgres@v​0.17.0/ConnectionParamsError](https://deno.land/x/postgres@v0.17.0/client/error.ts?s=ConnectionParamsError).
@JS('ConnectionParamsError')
extension type ConnectionParamsError._(JSObject _)
    implements JSError, JSObject {}
