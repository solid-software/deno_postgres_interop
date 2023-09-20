/// https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=TLSOptions
class PartialTLSOptions {
  /// https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=TLSOptions#prop_enabled
  final bool? isEnabled;

  /// https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=TLSOptions#prop_enfroce
  final bool? isTLSEnforced;

  /// https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=TLSOptions#prop_caCertificates
  final List<String>? caCertificates;

  /// constructor.
  PartialTLSOptions({
    required this.isEnabled,
    required this.isTLSEnforced,
    required this.caCertificates,
  });
}
