import 'dart:developer';

import 'package:flutter_grocery_app/helpers/widgets/my_exception.dart';

class BaseException extends MyException {
  Object? error;
  BaseException? exception;
  StackTrace? stackTrace;

  @override
  String toString() {
    return "This is base exception";
  }

  void setException(BaseException exception) {
    this.exception = exception;
  }

  void setErrorTrace(Object error, StackTrace stackTrace) {
    this.error = error;
    this.stackTrace = stackTrace;
    printOnConsole();
  }

  void setError(Object error) {
    this.error = error;
  }

  void setStackTrace(StackTrace stackTrace) {
    this.stackTrace = stackTrace;
  }

  void printOnConsole() {
    // return;
    if (exception != null) {
      StringBuffer stringBuffer = StringBuffer();
      stringBuffer.write('----- ${exception.runtimeType} ------ \n');
      stringBuffer.write('message : $exception');
      log(
        stringBuffer.toString(),
        stackTrace: stackTrace,
        error: error,
      );
    }
  }
}
