import 'package:flutter_riverpod/flutter_riverpod.dart';

// Step 1: we need to create a 'Notifier' class
// This notifier manages an int which we call the 'state'
class CounterProvider extends Notifier<int> {
  @override
  // 'build' initializes the state (ex: counter starts from 0)
  // Note: this 'build' belongs to Riverpod not Flutter's UI
  int build() {
    return 0;
  }

  // Step 3: Adding behavior
  // Every 'Notifier' automatically has a property called 'state'
  void increment() {
    state++;
  }
}

// Step 2: we create our 'provider' with the type of our 'Notifier' class and its 'state'
final counterProvider = NotifierProvider<CounterProvider, int>(
  // this line is equivalent to: "() => CounterNotifier()" which is shorter
  // It simply gives Riverpod a way to create an object when needed (not immediately)
  CounterProvider.new,
);
