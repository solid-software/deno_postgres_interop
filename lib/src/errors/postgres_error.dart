import 'dart:js_interop';

import 'package:deno_postgres_interop/src/errors/js_error.dart';

@JS()
class PostgresError extends JSError {}
