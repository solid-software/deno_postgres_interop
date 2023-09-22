/// [deno-postgres@v​0.17.0/TLSOptions](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=TLSOptions).
class PartialTLSOptions {
  /// [deno-postgres@v​0.17.0/TLSOptions/enabled](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=TLSOptions#prop_enabled).
  final bool? isEnabled;

  /// [deno-postgres@v​0.17.0/TLSOptions/enfroce](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=TLSOptions#prop_enfroce).
  final bool? isEnforced;

  /// [deno-postgres@v​0.17.0/TLSOptions/caCertificates](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=TLSOptions#prop_caCertificates).
  final List<String>? caCertificates;

  /// constructor.
  PartialTLSOptions({
    this.isEnabled,
    this.isEnforced,
    this.caCertificates,
  });

  /// used for interop.
  PartialTLSOptions.fromMap(Map<dynamic, dynamic> map)
      : caCertificates = map['caCertificates'] as List<String>?,
        isEnabled = map['enabled'] as bool?,
        isEnforced = map['enforced'] as bool?;

  /// used for jsify.
  Map<String, dynamic> asMap() {
    return {
      if (isEnabled != null) 'enabled': isEnabled,
      if (isEnforced != null) 'enforce': isEnforced,
      if (caCertificates != null) 'caCertificates': caCertificates,
    };
  }
}
