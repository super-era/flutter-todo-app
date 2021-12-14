import 'package:flutter/material.dart';
class TrackerPage extends StatefulWidget {
  @override
  _TrackerPageState createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  int _counter = 0;

    void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext content) => Scaffold(
    appBar: AppBar(
      title: const Text('Tracker'),
    ),
    body: Center(
      child: Text('Tracker $_counter', style: const TextStyle(fontSize: 60))),
    floatingActionButton: FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    ),
  );
}