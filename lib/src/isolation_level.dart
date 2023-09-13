enum IsolationLevel {
  readCommited,
  repeatableRead,
  serializable;

  static IsolationLevel parse(String string) =>
      values.firstWhere((e) => e.name == string);
}
