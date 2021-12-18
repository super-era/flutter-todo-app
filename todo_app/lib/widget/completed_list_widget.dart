import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos.dart';

class CompletedListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ToDosProvider>(context);
    final todos = provider.todosCompleted;
    return todos.isEmpty
      ? const Center(
        child: Text(
            'No completed tasks',
            style: TextStyle(fontSize: 20),
          )
        )
      : ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(16),
        separatorBuilder: (context, index) => Container(height: 8),
        itemCount: todos.length,
        itemBuilder: (context, index), {
          final todo = todos[index];

          return ToDoWidget(todo: todo);
        },
      );
    );
  }
}