import 'dart:js_interop';

/// [deno-postgres@v0.17.0/ConnectionOptions](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ConnectionOptions)
/// but [partial](https://www.typescriptlang.org/docs/handbook/utility-types.html#partialtype) (everything is optional).
@JS()
class PartialConnectionOptions {
  /// [deno-postgres@v0.17.0/ConnectionOptions/attempts](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ConnectionOptions#prop_attempts).
  external int? get attempts;

  /// [deno-postgres@v0.17.0/ConnectionOptions/interval](https://deno.land/x/postgres@v0.17.0/mod.ts?s=ConnectionOptions#interval).
  // external int? get interval;
}
