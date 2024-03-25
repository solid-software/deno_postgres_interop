// This is an internal implementation so it is okay here.
// ignore_for_file: public_member_api_docs
typedef Predicate<T> = bool Function(T);

extension BetterMap<K, V> on Map<K, V> {
  Map<K, V1> mapValues<V1>(V1 Function(V) f) =>
      map((k, v) => MapEntry(k, f(v)));

  MapEntry<K, V> firstWhereValue(Predicate<V> predicate) =>
      entries.firstWhere((e) => predicate(e.value));
}
