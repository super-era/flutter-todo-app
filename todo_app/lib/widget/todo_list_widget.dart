import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/provider/todos.dart';

class ToDoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ToDoWidget(
      todo: ToDo(
        createdTime: DateTime.now(),
        title: 'Example title',
      )
    );
  }
}