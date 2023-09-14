/// This indicates the protocol used to connect to the database.
///
/// The two supported transports are TCP and Unix sockets.
/// [source](https://deno.land/x/postgres@v0.17.0/client.ts?source=#L43)
enum Transport {
  /// TCP.
  tcp,

  /// Unix sockets.
  socket;

  /// Parses a string containing an [Transport] literal into its instance.
  static Transport parse(String string) =>
      values.firstWhere((e) => e.name == string);
}
