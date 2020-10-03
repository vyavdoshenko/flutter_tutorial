import 'package:flutter/material.dart';
import 'package:todoey/model/task.dart';
import 'package:todoey/screens/task_tile.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [Task(name: 'Test', isDone: true)];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          text: tasks[index].name,
          isChecked: tasks[index].isDone,
          checkboxCallback: (value) {
            setState(() {
              tasks[index].toggleDone();
            });
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}
