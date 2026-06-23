import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.name,
    required this.value,
    required this.onChanged,
  });

  final String name;
  final bool value;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: TextStyle(decoration: value ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        checkColor: Colors.white,
        activeColor: Colors.lightBlueAccent,
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
