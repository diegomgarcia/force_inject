import 'package:flutter/foundation.dart';

class CounterViewModel {
  final ValueNotifier<int> count = ValueNotifier(0);
  void increment() => count.value++;
}
