import 'package:flutter/foundation.dart';
import 'package:todoey/model/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  void toggleTask(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void addTask(String name) {
    _tasks.add(Task(name: name));
    notifyListeners();
  }

  int get taskCount => _tasks.length;
  String getName(int index) {
    return _tasks[index].name;
  }

  bool getIsDone(int index) {
    return _tasks[index].isDone;
  }
}
