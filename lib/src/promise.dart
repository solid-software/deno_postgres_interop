import 'dart:js_interop';
import 'dart:js_util';

typedef _Resolver<T> = void Function(T result);
typedef _Executor<T> = void Function(_Resolver<T> resolve, Function reject);

/// JS [Promise](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise) interop.
@JS()
class Promise<T> {
  /// [js/Promise/constructor](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/Promise).
  external Promise(_Executor<T> executor);
}

/// Convert darts [Future] to js' [Promise].
Promise<T> futureToPromise<T>(Future<T> future) {
  return Promise<T>(
    allowInterop((resolve, reject) {
      future.then(resolve, onError: reject);
    }),
  );
}
