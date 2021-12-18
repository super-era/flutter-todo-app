import 'package:flutter/cupertino.dart';
import 'package:todo_app/model/todo.dart';

class ToDosProvider extends ChangeNotifier {
  List<ToDo> _todos = [
    ToDo(
      createdTime: DateTime.now(),
      title: 'Test Title',
    ),
    ToDo(
      createdTime: DateTime.now(),
      title: 'clean room',
      description: '''- throw stuff out
- vacuum''',
    ),
    ToDo(
      createdTime: DateTime.now(),
      title: 'Call landlord',
      description: '''- pick up belongings
- decide whether to drive or fly''',
    ),
  ];

  List<ToDo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  void addToDo(ToDo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeToDo(ToDo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool toggleToDoStatus(ToDo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    
    return todo.isDone;
  }
}