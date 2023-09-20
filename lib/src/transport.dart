/// TCP | SOCKET.
enum Transport {
  /// tcp.
  tcp,

  /// socket.
  socket;

  /// Parses a string containing an [Transport] literal into its instance.
  static Transport parse(String string) =>
      values.firstWhere((e) => e.name == string);
}
