import 'package:flutter/material.dart';
import 'package:todo_app/widget/add_todo_widget.dart';
import 'package:todo_app/provider/todos.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widget/todo_list_widget.dart';
import 'package:todo_app/widget/completed_list_widget.dart';

class _ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => ToDosProvider(),
    child: MaterialApp(
      title: 'To-Do List',
      home: ListPage()
    ),
  );
}
class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  @override
  Widget build(BuildContext content) {
    final tabs = [
      ToDoListWidget(),
      CompletedListWidget(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lists'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) => AddToDoWidget(),
        ),
        tooltip: 'Add new to-do',
      ),
    );
  }
}