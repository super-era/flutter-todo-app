import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/provider/todos.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widget/todo_form_widget.dart';
import 'package:todo_app/widget/todo_form_widget.dart';


class editToDoPage extends StatefulWidget {
  final ToDo todo;

  const editToDoPage({Key? key, required this.todo}) : super(key: key);

  @override
  _editToDoPageState createState() => _editToDoPageState();
}

class _editToDoPageState extends State<editToDoPage> {
  String title = '';
  String description = '';

  @override
  void initState() {
    super.initState();

    title = widget.todo.title;
    description = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Edit todo'),
    ),
    body: ToDoFormWidget(
      title: title,
      description: description,
      onChangedTitle: (title) => setState(() => this.title = title),
      onChangedDescription: (description) => setState(() => this.description = description),
    ),
  );

}