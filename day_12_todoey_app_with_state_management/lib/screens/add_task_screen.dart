import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key, required this.addTaskCallback});

  final Function addTaskCallback;

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
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
            onSubmitted: (_) {
              addTaskCallback(newTaskTitle);
            },
          ),
          SizedBox(height: 20),
          TextButton(
            style: ButtonStyle(
              shape: WidgetStateProperty.all(BeveledRectangleBorder()),
              backgroundColor: WidgetStatePropertyAll<Color>(
                Colors.lightBlueAccent,
              ),
            ),
            onPressed: () {
              addTaskCallback(newTaskTitle);
            },
            child: Text('Add', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
