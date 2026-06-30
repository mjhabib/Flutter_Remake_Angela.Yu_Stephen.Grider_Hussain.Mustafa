import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todoey_app/providers/task_data_provider.dart';

class AddTaskScreen extends ConsumerWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String newTaskTitle = '';
    // for the TextButton
    void onPressed() {
      ref.read(taskDataProvider.notifier).addTask(newTaskTitle);
      Navigator.pop(context);
    }

    // for the TextField
    void onSubmitted(String value) {
      // Use the value from the TextField
      if (value.isNotEmpty) {
        ref.read(taskDataProvider.notifier).addTask(value);
        Navigator.pop(context);
      }
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, color: Colors.lightBlueAccent),
          ),
          SizedBox(height: 10),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              // border: OutlineInputBorder(borderSide: BorderSide.none),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlueAccent),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlueAccent),
              ),
            ),
            onChanged: (newText) {
              newTaskTitle = newText;
            },
            onSubmitted: onSubmitted,
          ),
          SizedBox(height: 20),
          TextButton(
            style: ButtonStyle(
              shape: WidgetStateProperty.all(BeveledRectangleBorder()),
              backgroundColor: WidgetStatePropertyAll<Color>(
                Colors.lightBlueAccent,
              ),
            ),
            onPressed: onPressed,
            child: Text('Add', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
