/// [deno-postgres@v0.17.0/TLSOptions](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=TLSOptions).
class PartialTLSOptions {
  /// [deno-postgres@v0.17.0/TLSOptions/enabled](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=TLSOptions#prop_enabled).
  final bool? isEnabled;

  /// [deno-postgres@v0.17.0/TLSOptions/enfroce](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=TLSOptions#prop_enfroce).
  final bool? isEnforced;

  /// [deno-postgres@v0.17.0/TLSOptions/caCertificates](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=TLSOptions#prop_caCertificates).
  final List<String>? caCertificates;

  /// constructor.
  PartialTLSOptions({
    required this.isEnabled,
    required this.isEnforced,
    required this.caCertificates,
  });

  /// used for jsify.
  Map<String, dynamic> asMap() {
    return {
      if (isEnabled != null) 'enabled': isEnabled,
      if (isEnforced != null) 'enforce': isEnforced,
      if (caCertificates != null) 'caCertificates': caCertificates,
    };
  }
}
