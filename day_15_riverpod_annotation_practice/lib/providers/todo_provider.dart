// Riverpod Code Generation (@riverpod)

// The generated code mainly exists to:
// - infer types correctly
// - generate provider names
// - generate the right provider class (Provider, FutureProvider, AsyncNotifierProvider, etc.)
// - improve IDE autocomplete
// - reduce boilerplate

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_provider.g.dart';

// By default, generated providers are auto-dispose
// To keep it alive instead, we need to opt out: "@Riverpod(keepAlive: true)"
@riverpod
class TodoList extends _$TodoList {
  @override
  Future<List<String>> build() async {
    await Future.delayed(const Duration(seconds: 1));

    //
    // For debugging purposes we can use lifecycle methods (inside build):
    //
    ref.onDispose(() {
      // Runs when the provider dies.
      // Example:
      // Close Stream
      // Cancel Timer
      // Dispose Controller
      print("Disposed");
    });

    ref.onCancel(() {
      // onCancel
      // Runs when the last listener disappears.
      // The provider may still survive (for example, if keepAlive: true).
      print("No listeners");
    });

    ref.onResume(() {
      // onResume
      // If somebody watches the provider again after an onCancel, this fires.
      // Mostly useful with long-lived providers.
      print("Listener returned");
    });

    return ['Buy cheese', 'Learn Riverpod'];
  }

  // Updating the state (adding a new todo)
  Future<void> addTodo(String todo) async {
    final current = state.value ?? [];

    state = AsyncData([...current, todo]);
  }

  // Removing an existing todo
  Future<void> removeTodo(String todo) async {
    final current = state.value ?? [];

    state = AsyncData(current.where((e) => e != todo).toList());
  }
}

// Remember to run: "dart run build_runner watch" after you've created or modified any @riverpod provider
// Or we need to run: "dart run build_runner build" when we want a one-time generation (for example, in CI or before committing).
