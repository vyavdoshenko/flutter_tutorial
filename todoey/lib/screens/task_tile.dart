import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String text;
  final bool isChecked;
  final Function checkboxCallback;
  TaskTile(
      {@required this.text,
      @required this.isChecked,
      @required this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: TaskCheckbox(
        checkBoxState: isChecked,
        checkboxCallback: checkboxCallback,
      ),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  final bool checkBoxState;
  final Function checkboxCallback;
  TaskCheckbox({@required this.checkBoxState, @required this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkBoxState,
      onChanged: checkboxCallback,
    );
  }
}
