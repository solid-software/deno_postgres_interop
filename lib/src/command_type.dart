/// All sql commands.
enum CommandType {
  /// insert.
  insert,

  /// delete.
  delete,

  /// update.
  update,

  /// select.
  select,

  /// move.
  move,

  /// fetch.
  fetch,

  /// copy.
  copy;

  /// Parses a string containing an [CommandType] literal into its instance.
  static CommandType parse(String string) =>
      values.firstWhere((e) => e.name.toUpperCase() == string);
}
