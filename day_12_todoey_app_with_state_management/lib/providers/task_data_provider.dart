import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:todoey_app/models/task.dart';

part 'task_data_provider.g.dart';

@riverpod
class TaskData extends _$TaskData {
  @override
  List<Task> build() {
    return [];
  }

  // An example of a getter for the length
  // int get taskCount => state.length;

  // Or as a method for the length
  // int taskCount() {
  //   return state.length;
  // }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);

    // Update the state by creating a new list with the added task
    state = [...state, task];
    // OR: state = state + [task];
    // OR: state = List.from(state)..add(task);
  }

  void updateTask(Task task) {
    task.toggleDone();

    // CRITICAL: Reassign state to trigger rebuild
    state = [...state]; // Creates a new list with the same elements
    // Or: state = List.from(state);
  }

  void removeTask(Task task) {
    state.remove(task); // Removes the task from the list
    state = [...state]; // Reassign to trigger rebuild
  }
}

// dart run build_runner watch
// dart run build_runner build
