import 'dart:js_interop';

import 'package:deno_postgres_interop/src/isolation_level.dart';

/// [deno-postgres@v​0.17.0/TransactionOptions](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TransactionOptions).
@JS('TransactionOptions')
extension type TransactionOptions._(JSObject _) implements JSObject {
  /// [deno-postgres@v​0.17.0/TransactionOptions/snapshot](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TransactionOptions).
  external String? get snapshot;

  @JS('isolation_level')
  external String? get _isolationLevel;

  /// [deno-postgres@v​0.17.0/TransactionOptions/isolation_level](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TransactionOptions).
  IsolationLevel? get isolationLevel {
    final jsProperty = _isolationLevel;

    return jsProperty == null ? null : IsolationLevel.parse(jsProperty);
  }

  /// [deno-postgres@v​0.17.0/TransactionOptions/read_only](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TransactionOptions).
  @JS('read_only')
  external bool? get isReadOnly;

  /// [deno-postgres@v​0.17.0/TransactionOptions/constructor](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TransactionOptions).
  factory TransactionOptions({
    IsolationLevel? isolationLevel,
    bool? isReadOnly,
    String? snapshot,
  }) =>
      TransactionOptions._(
        {
          if (isolationLevel != null) 'isolation_level': isolationLevel.name,
          if (isReadOnly != null) 'read_only': isReadOnly,
          if (snapshot != null) 'snapshot': snapshot,
        }.jsify()! as JSObject,
      );
}
