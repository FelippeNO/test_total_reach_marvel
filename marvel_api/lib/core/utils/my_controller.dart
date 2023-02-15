import 'package:flutter/material.dart';

class MyController extends ChangeNotifier {
  void setValueNotifier<T>(ValueNotifier<T> oldValue, T newValue) {
    oldValue.value = newValue;
    oldValue.notifyListeners();
  }
}
