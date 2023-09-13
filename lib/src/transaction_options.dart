import 'dart:js_interop';
import 'dart:js_util';

/// [postgres@v0.17.0/TransactionOptions](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TransactionOptions)
@JS()
class TransactionOptions {
  /// [postgres@v0.17.0/TransactionOptions](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TransactionOptions)
  external String? get snapshot;

  /// [postgres@v0.17.0/TransactionOptions](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TransactionOptions)
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

extension TransactionOptionsProps on TransactionOptions {
  IsolationLevel? get isolationLevel {
    final jsProperty = getProperty<String?>(this, 'isolation_level');

    return jsProperty == null ? null : IsolationLevel.parse(jsProperty);
  }

  bool? get isReadOnly => getProperty(this, 'read_only');
}

enum IsolationLevel {
  readCommited,
  repeatableRead,
  serializable;

  static IsolationLevel parse(String string) =>
      values.firstWhere((e) => e.name == string);
}
