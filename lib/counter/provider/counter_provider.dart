import 'package:hooks_riverpod/hooks_riverpod.dart';

class Counter extends StateNotifier<int> {
  Counter() : super(0);

  void increment() => state++;
  void decrement() => state--;
}

final counter = StateNotifierProvider<Counter>((ref) {
  return Counter();
}, name: 'counter');
