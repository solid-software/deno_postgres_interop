/// [postgres@v0.17.0/ResultType](https://deno.land/x/postgres@v0.17.0/query/query.ts?s=ResultType).
enum ResultType {
  /// array.
  array,

  /// object.
  object;

  /// Parses a string containing an [ResultType] literal into its instance.
  static ResultType parse(String string) =>
      values.firstWhere((e) => e.name.toUpperCase() == string);
}
