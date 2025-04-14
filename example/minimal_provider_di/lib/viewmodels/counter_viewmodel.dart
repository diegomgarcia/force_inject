import 'package:flutter/material.dart';

class CounterViewModel extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}
