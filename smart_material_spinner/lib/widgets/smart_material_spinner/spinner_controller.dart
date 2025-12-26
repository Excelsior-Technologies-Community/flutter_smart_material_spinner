import 'package:flutter/material.dart';

class SmartSpinnerController<T> extends ChangeNotifier {
  T? _selected;

  T? get selected => _selected;

  void setValue(T? value) {
    _selected = value;
    notifyListeners();
  }

  void clear() {
    _selected = null;
    notifyListeners();
  }
}
