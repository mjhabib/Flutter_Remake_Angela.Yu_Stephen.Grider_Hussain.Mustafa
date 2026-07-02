import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double deviceHeight, deviceWidth;
  String? taskName;
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
      body: tasksList(),
      floatingActionButton: addButton(),
    );
  }

  Widget tasksList() {
    return ListView(
      children: [
        ListTile(
          title: Text(
            'Do something',
            style: TextStyle(decoration: TextDecoration.lineThrough),
          ),
          subtitle: Text(DateTime.now().toString()),
          trailing: Icon(Icons.check_box_outlined, color: Colors.lightGreen),
        ),
      ],
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
                onChanged: (value) {
                  setState(() {
                    taskName = value;
                  });
                },
                onSubmitted: (value) {},
              ),
              ElevatedButton(onPressed: () {}, child: Text('Add')),
            ],
          ),
        );
      },
    );
  }
}
