import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/widgets/tasks_list.dart';
import 'add_task_screen.dart';
import 'package:flutter_todo/models/task.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {

  List<Task> tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Eggs'),
    Task(name: 'Buy Fruits'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 40, left: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.list, color: Colors.lightBlueAccent,)
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Todoey',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                  )
                ),
                Text('${tasks.length} Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
              ),
              child: TasksList(tasks: tasks),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(context: context, builder: (context) => AddTaskScreen(
            addTask: (addTaskTitle) {
              setState(() {
                tasks.add(Task(name: addTaskTitle));
              });
              Navigator.pop(context);
            },
          ));
        },
        backgroundColor: Colors.lightBlueAccent,
        shape: CircleBorder(),
        child: Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}


