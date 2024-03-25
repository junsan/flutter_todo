import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:flutter_todo/models/task.dart';

class TasksList extends StatefulWidget {

  const TasksList({super.key, required this.tasks});

  final List<Task> tasks;

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(30),
        itemCount: widget.tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(
            taskTitle: widget.tasks[index].name,
            isChecked: widget.tasks[index].isDone,
            toggleCheckbox: (checkBoxStat) {
              setState(() {
                widget.tasks[index].toggleDone();
              });
            },
          );
        }
    );
  }
}