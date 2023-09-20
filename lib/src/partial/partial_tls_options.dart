/// [deno-postgres@v0.17.0/TLSOptions](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=TLSOptions).
class PartialTLSOptions {
  /// [deno-postgres@v0.17.0/TLSOptions/enabled](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=TLSOptions#prop_enabled).
  final bool? isEnabled;

  /// [deno-postgres@v0.17.0/TLSOptions/enfroce](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=TLSOptions#prop_enfroce).
  final bool? isTLSEnforced;

  /// [deno-postgres@v0.17.0/TLSOptions/caCertificates](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=TLSOptions#prop_caCertificates).
  final List<String>? caCertificates;

  /// constructor.
  PartialTLSOptions({
    required this.isEnabled,
    required this.isTLSEnforced,
    required this.caCertificates,
  });
}