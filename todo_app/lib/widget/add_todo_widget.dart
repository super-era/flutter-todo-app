import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/provider/todos.dart';
import 'todo_form_widget.dart';
import 'package:provider/provider.dart';

class AddToDoWidget extends StatefulWidget {
  @override
  _AddToDoWidgetState createState() => _AddToDoWidgetState();
}

class _AddToDoWidgetState extends State<AddToDoWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
    content: Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Add To-do',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            )
          ),
          const SizedBox(height: 8),
          ToDoFormWidget(
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (description) => setState(() => this.description = description),
            onSavedToDo: addToDo,
          ),
        ],
      ),
    ),
  );

  void addToDo() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      final todo = ToDo(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: DateTime.now(),
      );

      final provider = Provider.of<ToDosProvider>(context, listen: false);
      )
    }
  }
  
}
