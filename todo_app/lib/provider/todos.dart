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

  List<ToDo> get todosCompleted => _todos.where((todo) => todo.isDone == true).toList();  

  void addToDo(ToDo todo) async {
    _todos.add(todo);
    notifyListeners();
  }

  Future<void> removeToDo(ToDo todo) async {
    _todos.remove(todo);
    notifyListeners();
  }

  bool toggleToDoStatus(ToDo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    
    return todo.isDone;
  }

  void updateToDo(ToDo todo, String title, String description) async {
    todo.title = title;
    todo.description = description;

    notifyListeners();
  }
}