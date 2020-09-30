import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String text;
  final bool checked;
  final bool striked;
  TaskTile(
      {@required this.text, @required this.checked, @required this.striked});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
      ),
      trailing: Checkbox(
        value: checked,
      ),
    );
  }
}
