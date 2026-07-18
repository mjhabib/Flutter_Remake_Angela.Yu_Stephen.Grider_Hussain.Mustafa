import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider.g.dart';

/* This pattern is used when you need to store state that can be mutated by the user (like an active counter, a dark mode toggle, or shopping cart items) using purely synchronous logic. */
// Class-based providers must extend _$ClassName.
// This class name generates "counterProvider".
@riverpod
class Counter extends _$Counter {
  // The build method defines the initial state of your provider
  @override
  int build() {
    return 0; // Starts the counter at zero
  }

  // Custom methods modify the internal "state" variable
  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }
}
