import 'dart:js_interop';
import 'dart:js_util';

import 'package:deno_postgres_interop/src/isolation_level.dart';

/// [deno-postgres@v0.17.0/TransactionOptions](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TransactionOptions).
@JS()
class TransactionOptions {
  /// [deno-postgres@v0.17.0/TransactionOptions/snapshot](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TransactionOptions).
  external String? get snapshot;

  /// [deno-postgres@v0.17.0/TransactionOptions/constructor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TransactionOptions).
  factory TransactionOptions({
    IsolationLevel? isolationLevel,
    bool? isReadOnly,
    String? snapshot,
  }) =>
      jsify({
        if (isolationLevel != null) 'isolation_level': isolationLevel.name,
        if (isReadOnly != null) 'read_only': isReadOnly,
        if (snapshot != null) 'snapshot': snapshot,
      }) as TransactionOptions;
}

/// [deno-postgres@v0.17.0/TransactionOptions](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TransactionOptions).
extension TransactionOptionsProps on TransactionOptions {
  /// [deno-postgres@v0.17.0/TransactionOptions/isolation_level](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TransactionOptions).
  IsolationLevel? get isolationLevel {
    final jsProperty = getProperty<String?>(this, 'isolation_level');

    return jsProperty == null ? null : IsolationLevel.parse(jsProperty);
  }

  /// [deno-postgres@v0.17.0/TransactionOptions/read_only](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TransactionOptions).
  bool? get isReadOnly => getProperty(this, 'read_only');
}
