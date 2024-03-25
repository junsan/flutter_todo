import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool? isChecked;
  final String? taskTitle;
  final ValueChanged<bool?> toggleCheckbox;

  TaskTile({super.key, required this.taskTitle, required this.isChecked, required this.toggleCheckbox});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskTitle!,
      style: TextStyle(
        decoration: isChecked! ? TextDecoration.lineThrough : TextDecoration.none,
      ),),
      trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: toggleCheckbox
      )
    );
  }
}