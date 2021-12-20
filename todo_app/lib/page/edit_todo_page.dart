import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/provider/todos.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widget/todo_form_widget.dart';


class editToDoPage extends StatefulWidget {
  final ToDo todo;

  const editToDoPage({Key? key, required this.todo}) : super(key: key);

  @override
  _editToDoPageState createState() => _editToDoPageState();
}

class _editToDoPageState extends State<editToDoPage> {
  final _formKey = GlobalKey<FormState>(); 

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
      actions: [
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            final provider = Provider.of<ToDosProvider>(context, listen: false);
            provider.removeToDo(widget.todo);
            Navigator.of(context).pop();
          },
        )
      ],
    ),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: ToDoFormWidget(
          title: title,
          description: description,
          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedDescription: (description) => setState(() => this.description = description),
          onSavedToDo: saveToDo,
        ),
      ),
    )
  );

  void saveToDo() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<ToDosProvider>(context, listen: false);
      provider.updateToDo(widget.todo, title, description);
      Navigator.of(context).pop();
    }
  }

}