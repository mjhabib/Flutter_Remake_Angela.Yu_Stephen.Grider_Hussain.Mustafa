import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todoey_app/widgets/task_tile.dart';
import 'package:todoey_app/providers/task_data_provider.dart';

class TasksList extends ConsumerWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // using a provider to pass data around the widgets
    final tasks = ref.watch(taskDataProvider);
    // using a provider getter or its method to get the tasks' length
    final taskCount = ref.read(taskDataProvider.notifier).taskCount;
    // Or
    // final taskCount = ref.read(taskDataProvider.notifier).taskCount();
    return ListView.builder(
      itemCount: taskCount,
      itemBuilder: (context, index) {
        return TaskTile(
          name: tasks[index].name,
          value: tasks[index].isDone,
          onChanged: (newValue) {
            // setState(() {
            tasks[index].toggleDone();
            // });
          },
        );
      },
    );
  }
}
