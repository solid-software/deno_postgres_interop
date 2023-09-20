/// [deno-postgres@v0.17.0/ConnectionOptions](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ConnectionOptions).
class PartialConnectionOptions {
  /// [deno-postgres@v0.17.0/ConnectionOptions](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ConnectionOptions#prop_attempts).
  final int? attempts;

  /// [deno-postgres@v0.17.0/ConnectionOptions](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ConnectionOptions#prop_interval).
  ///
  /// Either this or [interval] is null.
  final int Function(int previousInterval)? nextInterval;

  /// [deno-postgres@v0.17.0/ConnectionOptions](https://deno.land/x/postgres@v0.17.0/connection/connection_params.ts?s=ConnectionOptions#prop_interval).
  ///
  /// Either this or [nextInterval] is null.
  final int? interval;

  /// constructor.
  PartialConnectionOptions({
    required this.attempts,
    required this.nextInterval,
    required this.interval,
  }) : assert(interval == null || nextInterval == null);
}
