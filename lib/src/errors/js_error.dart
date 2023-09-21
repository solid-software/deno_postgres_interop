import 'dart:js_interop';

/// [js/Error](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error).
@JS('Error')
class JSError {
  /// [js/Error/name](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/name).
  external String get name;

  /// [js/Error/cause](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/cause).
  external Error? get cause;

  /// [js/Error/message](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/message).
  external String get message;
}
