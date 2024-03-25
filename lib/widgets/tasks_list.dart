import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:flutter_todo/models/task.dart';

class TasksList extends StatefulWidget {
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Eggs'),
    Task(name: 'Buy Fruits'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(30),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(
            taskTitle: tasks[index].name,
            isChecked: tasks[index].isDone,
            toggleCheckbox: (checkBoxStat) {
              setState(() {
                tasks[index].toggleDone();
              });
            },
          );
        }
    );
  }
}