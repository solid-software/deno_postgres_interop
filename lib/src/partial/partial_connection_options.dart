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
    this.attempts,
    this.nextInterval,
    this.interval,
  }) : assert(interval == null || nextInterval == null);

  /// used for interop.
  factory PartialConnectionOptions.fromMap(Map<dynamic, dynamic> map) {
    final intervalProp = map['interval'];

    return PartialConnectionOptions(
      attempts: map['attempts'] as int?,
      interval: intervalProp is int ? intervalProp : null,
      nextInterval: intervalProp is! int
          ? intervalProp as int Function(int previousInterval)?
          : null,
    );
  }

  /// used for jsify.
  Map<String, dynamic> asMap() {
    return {
      if (attempts != null) 'attempts': attempts,
      if (nextInterval != null)
        'interval': nextInterval
      else if (interval != null)
        'interval': interval,
    };
  }
}
