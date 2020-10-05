import 'package:flutter/material.dart';
import 'package:todoey/model/task.dart';
import 'package:todoey/screens/task_tile.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;

  TasksList({@required this.tasks});

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          text: widget.tasks[index].name,
          isChecked: widget.tasks[index].isDone,
          checkboxCallback: (value) {
            setState(() {
              widget.tasks[index].toggleDone();
            });
          },
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
