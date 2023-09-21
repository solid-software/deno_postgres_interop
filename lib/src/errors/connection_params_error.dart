import 'dart:js_interop';

import 'package:deno_postgres_interop/src/errors/js_error.dart';

/// [js/Error](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error).
@JS('Error')
class ConnectionParamsError extends JSError {}
