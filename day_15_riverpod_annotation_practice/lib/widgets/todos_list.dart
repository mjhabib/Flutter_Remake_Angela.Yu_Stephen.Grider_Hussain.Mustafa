import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_annotation_practice/providers/todo_provider.dart';

class TodosList extends ConsumerWidget {
  const TodosList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // our todos will return -> "AsyncValue<List<String>>"
    final todos = ref.watch(todoListProvider);

    return todos.when(
      loading: () => const Center(child: CircularProgressIndicator()),

      error: (error, stack) => Center(child: Text(error.toString())),

      data: (items) {
        return Column(
          children: [
            ElevatedButton(
              onPressed: () {
                ref.read(todoListProvider.notifier).addTodo('Buy milk');
              },
              child: const Text('Add "Buy milk"'),
            ),

            SizedBox(height: 10),

            // Refresh will:
            // A. destroys the current provider
            // B. immediately creates a new one
            ElevatedButton(
              onPressed: () {
                ref.refresh(todoListProvider);
              },
              child: Text('Refresh'),
            ),
            // We also have "ref.invalidate()" which says:
            // This provider is no longer valid.
            // Example:
            // User logs out ->  Invalidate all user-related providers ->  You don't necessarily want to rebuild them immediately.
            //
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (_, index) {
                  final todo = items[index];

                  return ListTile(
                    title: Text(todo),

                    trailing: IconButton(
                      icon: const Icon(Icons.delete),

                      onPressed: () {
                        ref.read(todoListProvider.notifier).removeTodo(todo);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}



// ----------------------------------select()-----------------------------------------
//
// Use select() when this widget only cares about ONE part of a provider's state.
//
//
// Example (Todo app):
// If a Todo has { title, isCompleted }, and this widget only displays the title:
//
//   final title = ref.watch(
//     todoProvider.select((todo) => todo.title),
//   );
//
// Toggling isCompleted won't rebuild this widget because the title didn't change.
//
// Another example:
//
// Without select():
//   final user = ref.watch(userProvider);
//   -> Widget rebuilds whenever ANY property of 'user' changes.
//
// With select():
//   final name = ref.watch(userProvider.select((user) => user.name));
//   -> Widget rebuilds ONLY when 'name' changes.
//      Changes to age, email, online status, etc. won't rebuild this widget.
//
//
// Use select() as a performance optimization for widgets that only depend on
// a small portion of a provider's state. Don't use it everywhere—only when it
// meaningfully reduces unnecessary rebuilds.
// -----------------------------------------------------------------------------