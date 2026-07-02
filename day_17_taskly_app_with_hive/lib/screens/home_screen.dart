import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:taskly_app/models/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double deviceHeight, deviceWidth;
  String? taskName;
  Box? box;
  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        toolbarHeight: deviceHeight * 0.15,
        title: Text('Taskly!', style: TextStyle(fontSize: 24)),
      ),
      body: tasksView(),
      floatingActionButton: addButton(),
    );
  }

  Widget tasksView() {
    // Task newTask = Task(
    //   title: 'Add some dummy data to Hive DB',
    //   time: DateTime.now(),
    //   isDone: false,
    // );
    // box?.add(newTask.toMap());

    return FutureBuilder(
      future: Hive.openBox('tasks'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          box = snapshot.data;
          return tasksList();
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  ListView tasksList() {
    List tasks = box!.values.toList();

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        var task = Task.fromMap(tasks[index]);
        return ListTile(
          title: Text(
            task.title,
            style: TextStyle(
              decoration: task.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(task.time.toString()),
          trailing: Icon(
            task.isDone
                ? Icons.check_box_outlined
                : Icons.check_box_outline_blank,
            color: Colors.lightGreen,
          ),
        );
      },
    );
  }

  Widget addButton() {
    return FloatingActionButton(
      onPressed: taskPopup,
      backgroundColor: Colors.lightGreen,
      child: Icon(Icons.add, color: Colors.white),
    );
  }

  void taskPopup() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add new task'),
          content: Column(
            children: [
              TextField(
                autofocus: true,
                onChanged: (value) {
                  setState(() {
                    taskName = value;
                  });
                },
                onSubmitted: (_) {
                  if (taskName != null) {
                    var task = Task(
                      title: taskName!,
                      time: DateTime.now(),
                      isDone: false,
                    );
                    box!.add(task.toMap());
                    setState(() {
                      taskName = null;
                    });
                    Navigator.pop(context);
                  }
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (taskName != null) {
                    var task = Task(
                      title: taskName!,
                      time: DateTime.now(),
                      isDone: false,
                    );
                    box!.add(task.toMap());
                    setState(() {
                      taskName = null;
                    });
                    Navigator.pop(context);
                  }
                },
                child: Text('Add'),
              ),
            ],
          ),
        );
      },
    );
  }
}
