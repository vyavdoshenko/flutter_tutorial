import 'package:flutter/material.dart';
import 'package:todoey/screens/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        TaskTile(
          text: 'Buy milk',
          checked: false,
          striked: false,
        ),
        TaskTile(
          text: 'Buy eggs',
          checked: false,
          striked: false,
        ),
        TaskTile(
          text: 'Buy bread',
          checked: false,
          striked: true,
        ),
      ],
    );
  }
}
