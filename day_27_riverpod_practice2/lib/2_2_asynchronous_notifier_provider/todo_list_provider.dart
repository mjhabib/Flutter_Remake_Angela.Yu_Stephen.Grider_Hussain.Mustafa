import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_list_provider.g.dart';

/* This pattern is used when you need to manage a mutable state that depends on asynchronous operations. A classic example is a todo list where the initial data comes from a remote API database, and adding or removing items requires making async network calls while keeping the UI in sync.
By returning a Future inside the class build() method, Riverpod wraps the entire state in an AsyncValue. When modifying the state, you wrap the updates in AsyncValue.guard to automatically catch errors and manage loading states. */

// Generates "todoListProvider"
@riverpod
class TodoList extends _$TodoList {
  // The build method initializes the state asynchronously
  @override
  Future<List<String>> build() async {
    // Simulate initial database fetch delay
    await Future.delayed(const Duration(seconds: 5));
    return ['Buy groceries', 'Walk the dog'];
  }

  // Mutate the state using AsyncValue.guard to handle async lifecycle events safely
  Future<void> addTodo(String newTodo) async {
    // Set the state to loading while the action runs
    state = const AsyncValue.loading();

    // AsyncValue.guard handles try/catch blocks for you under the hood
    state = await AsyncValue.guard(() async {
      // Simulate remote API post delay
      await Future.delayed(const Duration(seconds: 1));

      // Get the previous list values from the current state data
      final previousTodos = state.value ?? [];
      /* Null-Coalescing Operator:
      It means: "Look at the item on the left (state.value). If it has data, use it. If it is null, fallback to the item on the right ([]).
      Or -> final previousTodos = state.value != null ? state.value! : []; */

      // Return the newly updated list to be the new state
      return [...previousTodos, newTodo];
    });
  }
}
