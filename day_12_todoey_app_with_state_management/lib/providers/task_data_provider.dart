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
  int get taskCount => state.length;

  // Or as a method for the length
  // int taskCount() {
  //   return state.length;
  // }
}
