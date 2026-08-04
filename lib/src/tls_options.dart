import 'dart:js_interop';

/// [deno-postgres@v​0.17.0/TLSOptions](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TLSOptions).
@JS('TLSOptions')
extension type TLSOptions._(JSObject _) implements JSObject {
  @JS('caCertificates')
  external JSArray<JSString> get _caCertificates;

  /// [deno-postgres@v​0.17.0/TLSOptions/caCertificates](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TLSOptions#prop_caCertificates).
  List<String> get caCertificates =>
      _caCertificates.toDart.map((e) => e.toDart).toList();

  /// [deno-postgres@v​0.17.0/TLSOptions/enabled](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TLSOptions#prop_enabled).
  @JS('enabled')
  external bool get isEnabled;

  /// [deno-postgres@v​0.17.0/TLSOptions/enforce](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TLSOptions#prop_enforce).
  @JS('enforce')
  external bool get isEnforced;

  /// [deno-postgres@v​0.17.0/TLSOptions](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TLSOptions).
  factory TLSOptions({
    required List<String> caCertificates,
    required bool isEnabled,
    required bool isEnforced,
  }) => TLSOptions._(
    {
          'caCertificates': caCertificates,
          'enabled': isEnabled,
          'enforce': isEnforced,
        }.jsify()!
        as JSObject,
  );
}
