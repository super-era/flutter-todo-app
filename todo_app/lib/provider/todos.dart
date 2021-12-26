import 'package:flutter/cupertino.dart';
import 'package:todo_app/model/todo.dart';

class ToDosProvider extends ChangeNotifier {
  List<ToDo> _todos = [
    ToDo(
      createdTime: DateTime.now(),
      title: 'Every task must always have a title, even if they don''t have a description.',
    ),
    ToDo(
      createdTime: DateTime.now(),
      title: 'You may edit or delete tasks...',
      description: '''...by swiping left or right on the task respectively, and pressing the button that appears.''',
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