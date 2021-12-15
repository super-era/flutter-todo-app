import 'package:flutter/material.dart';

import '/widget/add_todo_widget.dart';
class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  @override
  Widget build(BuildContext content) {
    final tabs = [
      Container(),
      Container(),
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