import 'dart:js_interop';

/// [js/Error](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error).
@JS('Error')
extension type JSError._(JSObject _) implements JSObject {
  /// [js/Error/name](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/name).
  external String get name;

  /// [js/Error/cause](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/cause).
  external JSError? get cause;

  /// [js/Error/message](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/message).
  external String get message;
}
