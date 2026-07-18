import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice2/2_2_asynchronous_notifier_provider/todo_list_provider.dart';

void main() {
  runApp(const ProviderScope(child: MaterialApp(home: TodoScreen())));
}

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Exposes an AsyncValue<List<String>> containing state and layout states
    final asyncTodos = ref.watch(todoListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lesson 2.2: Asynchronous Custom State (AsyncNotifierProvider)',
        ),
      ),
      body: asyncTodos.when(
        data: (todos) => ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) => ListTile(title: Text(todos[index])),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Access the notifier class instance to invoke custom methods
          ref.read(todoListProvider.notifier).addTodo('New Task');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
