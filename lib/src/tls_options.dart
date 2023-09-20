import 'dart:js_interop';
import 'dart:js_util';

/// [deno-postgres@v0.17.0/TLSOptions](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TLSOptions).
@JS()
class TLSOptions {
  /// [deno-postgres@v0.17.0/TLSOptions/caCertificates](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TLSOptions#prop_caCertificates).
  external List<String> get caCertificates;

  /// [deno-postgres@v0.17.0/TLSOptions](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TLSOptions).
  factory TLSOptions({
    required List<String> caCertificates,
    required bool isEnabled,
    required bool isEnforced,
  }) =>
      jsify({
        'caCertificates': caCertificates,
        'enabled': isEnabled,
        'enforce': isEnforced,
      }) as TLSOptions;
}

/// [deno-postgres@v0.17.0/TLSOptions](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TLSOptions).
class TLSOptionsProps {
  /// [deno-postgres@v0.17.0/TLSOptions/enabled](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TLSOptions#prop_enabled).
  bool get isEnabled => getProperty(this, 'isEnabled');

  /// [deno-postgres@v0.17.0/TLSOptions/enforce](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TLSOptions#prop_enforce).
  bool get isEnforced => getProperty(this, 'enforce');
}
