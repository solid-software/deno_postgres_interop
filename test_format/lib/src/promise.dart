import 'dart:js_interop';

/// JS [Promise](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise).
typedef Promise<T extends JSAny?> = JSPromise<T>;

/// Convert darts [Future] to js' [Promise].
JSPromise<JSAny?> futureToPromise<T>(Future<T> future) {
  return future.then((value) => value?.jsify()).toJS;
}
