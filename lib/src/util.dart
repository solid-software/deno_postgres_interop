import 'dart:js_interop';
import 'dart:js_interop_unsafe';

/// Convenience wrapper for promise to future call.
Future<T> callFutureMethod<T>(
  JSObject o,
  String method, [
  List<Object?> args = const [],
]) async {
  final jsArgs = args.map((e) => e?.jsify()).toList();
  final promise = o.callMethodVarArgs<JSPromise<JSAny?>>(
    method.toJS,
    jsArgs,
  );
  final result = await promise.toDart;

  return result?.dartify() as T;
}
