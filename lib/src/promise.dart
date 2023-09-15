import 'dart:js_interop';
import 'dart:js_util';

typedef Resolver<T> = void Function(T result);

typedef Executor<T> = void Function(Resolver<T> resolve, Function reject);

@JS()
class Promise<T> {
  external Promise(Executor<T> executor);

  external Promise then(Resolver<T> onFulfilled, [Function onRejected]);
}

Promise<T> futureToPromise<T>(Future<T> future) {
  return Promise<T>(
    allowInterop((resolve, reject) {
      future.then(resolve, onError: reject);
    }),
  );
}
