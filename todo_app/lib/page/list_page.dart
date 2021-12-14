import 'package:flutter/material.dart';
class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int _counter = 0;

    void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext content) => Scaffold(
    appBar: AppBar(
      title: const Text('List'),
    ),
    body: Center(
      child: Text('List $_counter', style: const TextStyle(fontSize: 60))),
    floatingActionButton: FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    ),
  );
}