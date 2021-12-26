import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/provider/todos.dart';
import 'package:todo_app/widget/todo_widget.dart';

class ToDoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ToDosProvider>(context);
    final todos = provider.todos;
    return todos.isEmpty
      ? const Center(
        child: Text(
            'Wow, such empty',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black38,),
          )
        )
      : ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context, index) => Container(height: 8),
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];

        return ToDoWidget(todo: todo);
      },
    );
  }
}