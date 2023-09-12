extension FunctionOrNull<T> on T Function() {
  T? orNull() {
    try {
      return this();
    } catch (_) {
      return null;
    }
  }
}
