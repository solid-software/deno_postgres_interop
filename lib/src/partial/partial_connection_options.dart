/// https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ConnectionOptions
class PartialConnectionOptions {
  /// https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ConnectionOptions#prop_attempts
  final int? attempts;

  /// https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ConnectionOptions#prop_interval
  ///
  /// Either this or [interval] is null.
  final int Function(int previousInterval)? nextInterval;

  /// https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ConnectionOptions#prop_interval
  ///
  /// Either this or [nextInterval] is null.
  final int? interval;

  /// constructor.
  PartialConnectionOptions({
    required this.attempts,
    required this.nextInterval,
    required this.interval,
  });
}
