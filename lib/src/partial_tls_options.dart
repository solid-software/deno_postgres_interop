import 'dart:js_interop';

/// [deno-postgres@v0.17.0/ConnectionOptions](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TLSOptions)
/// but [partial](https://www.typescriptlang.org/docs/handbook/utility-types.html#partialtype) (everything is optional).
@JS()
class PartialTLSOptions {
  /// [deno-postgres@v0.17.0/ConnectionOptions/enabled](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TLSOptions#prop_enabled).
  external bool? get enabled;

  /// [deno-postgres@v0.17.0/ConnectionOptions/enforce](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TLSOptions#prop_enforce).
  external bool? get enforce;

  /// [deno-postgres@v0.17.0/ConnectionOptions/caCertificates](https://deno.land/x/postgres@v0.17.0/mod.ts?s=TLSOptions#prop_caCertificates).
  external List<String>? get caCertificates;
}
