import 'package:flutter/material.dart';
import 'package:todoey/screens/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        TaskTile(
          text: 'Buy milk',
          striked: false,
        ),
        TaskTile(
          text: 'Buy eggs',
          striked: false,
        ),
        TaskTile(
          text: 'Buy bread',
          striked: true,
        ),
      ],
    );
  }
}
