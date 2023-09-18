/// [deno-postgres@v0.17.0/Transaction Isolation](https://www.postgresql.org/docs/current/transaction-iso.html).
enum IsolationLevel {
  /// [deno-postgres@v0.17.0/Transaction Isolation/Read Committed Isolation Level](https://www.postgresql.org/docs/current/transaction-iso.html#XACT-READ-COMMITTED).
  readCommitted,

  /// [deno-postgres@v0.17.0/Transaction Isolation/Repeatable Read Isolation Level](https://www.postgresql.org/docs/current/transaction-iso.html#XACT-REPEATABLE-READ).
  repeatableRead,

  /// [deno-postgres@v0.17.0/Transaction Isolation/Serializable Isolation Level](https://www.postgresql.org/docs/current/transaction-iso.html#XACT-SERIALIZABLE).
  serializable;

  /// Parses a string containing an [IsolationLevel] literal into its instance.
  static IsolationLevel parse(String string) =>
      values.firstWhere((e) => e.name == string);
}
