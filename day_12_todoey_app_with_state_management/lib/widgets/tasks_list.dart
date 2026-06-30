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
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(
          name: tasks[index].name,
          value: tasks[index].isDone,
          onChanged: (_) {
            ref.read(taskDataProvider.notifier).updateTask(tasks[index]);
          },
          onLongPress: () {
            ref.read(taskDataProvider.notifier).removeTask(tasks[index]);
          },
        );
      },
    );
  }
}
