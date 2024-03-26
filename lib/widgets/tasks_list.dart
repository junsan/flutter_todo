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
              var task = taskData.tasks[index];
              return TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                toggleCheckbox: (checkBoxStat) {
                  taskData.updateTask(task);
                },
                longPressCallback: () {
                  taskData.deleteTask(task);
                },
              );
            }
        );
      },
    );
  }
}