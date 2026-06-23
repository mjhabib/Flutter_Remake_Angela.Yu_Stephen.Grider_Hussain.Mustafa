import 'package:flutter/material.dart';

import 'package:todoey_app/models/task.dart';
import 'package:todoey_app/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  bool isChecked = false;
  List<Task> tasks = [Task(name: 'Buy milk'), Task(name: 'Buy Bread')];

  @override
  Widget build(BuildContext context) {
    // instead of using a regular ListView to build a list of tasks, the builder only builds as many items as we can see (or fit the screen). That way, if we have hundreds of tasks, we're gonna save a lot of memory/recourses.
    // the itemCount builds as many as tasks we have in our list
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(
          name: tasks[index].name,
          value: tasks[index].isDone,
          onChanged: (newValue) {
            setState(() {
              tasks[index].toggleDone();
            });
          },
        );
      },
    );
  }
}
