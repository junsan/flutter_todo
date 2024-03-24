import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {

  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('This is a task',
      style: TextStyle(
        decoration: isChecked! ? TextDecoration.lineThrough : TextDecoration.none,
      ),),
      trailing: TaskCheckBox(
        isChecked: isChecked,
        toggleCheckbox: (value) {
          setState(() {
            isChecked = value;
          });
        }
      ),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  TaskCheckBox({super.key, required this.isChecked, required this.toggleCheckbox});

  final bool? isChecked;
  final ValueChanged<bool?> toggleCheckbox;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: toggleCheckbox
    );
  }
}
