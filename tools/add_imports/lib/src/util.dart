T mapException<T, U extends Object, K extends Object>(
  T Function() f,
  K Function(U) m,
) {
  try {
    return f();
  } on U catch (e) {
    throw m(e);
  }
}
