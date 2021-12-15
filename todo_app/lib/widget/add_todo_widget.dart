import 'package:flutter/material.dart';

import 'todo_form_widget.dart';

class AddToDoWidget extends StatefulWidget {
  @override
  _AddToDoWidgetState createState() => _AddToDoWidgetState()
}

class _AddToDoWidgetState extends State<AddToDoWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
    content: Column(
      children: const [
        Text(
          'Add To-do',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          )
        ),
        SizedBox(height: 8),
        ToDoFormWidget(
          onChangedTitle: (title) => setState() => this.title = title,
          onChangedDescription: (description) => setState() => this.description = description,
          onSavedToDo: () {},
        ),
      ],

    )
  )
}
