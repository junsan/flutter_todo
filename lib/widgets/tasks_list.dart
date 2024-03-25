import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:flutter_todo/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
            padding: EdgeInsets.all(30),
            itemCount: taskData.taskCount,
            itemBuilder: (context, index) {
              return TaskTile(
                taskTitle: taskData.tasks[index].name,
                isChecked: taskData.tasks[index].isDone,
                toggleCheckbox: (checkBoxStat) {
                  taskData.tasks[index].toggleDone();
                },
              );
            }
        );
      },
    );
  }
}