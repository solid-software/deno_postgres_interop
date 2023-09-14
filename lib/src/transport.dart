/// This indicates the protocol used to connect to the database.
///
/// The two supported transports are TCP and Unix sockets.
enum Transport {
  /// TCP.
  tcp,

  /// Unix sockets.
  socket;

  /// Parses a string containing an [Transport] literal into its instance.
  static Transport parse(String string) =>
      values.firstWhere((e) => e.name == string);
}
