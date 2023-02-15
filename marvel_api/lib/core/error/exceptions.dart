import 'package:flutter/foundation.dart';

abstract class CoreException implements Exception {
  CoreException(StackTrace? stackTrace, String? label, dynamic exception) {
    debugPrintStack(label: 'Exception :: $label', stackTrace: stackTrace);
  }
}

class RequestException extends CoreException {
  RequestException(super.stackTrace, super.label, super.exception);
}

class FromMapParsingException extends CoreException {
  FromMapParsingException(super.stackTrace, super.label, super.exception);
}

class ToMapParsingException extends CoreException {
  ToMapParsingException(super.stackTrace, super.label, super.exception);
}
