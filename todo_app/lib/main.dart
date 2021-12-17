// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos.dart';

import 'page/home_page.dart';
import 'page/list_page.dart';
import 'page/tracker_page.dart';
import 'page/profile_page.dart';

void main() {
  runApp(ToDo());
}

class ToDo extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => ToDosProvider(),
    child: MaterialApp(
      title: 'To-Do List',
      home: MainPage()
    ),
  );
}

// class ToDo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'To-Do List',
//       home: ToDoList()
//     );
//   }
// }

// class ToDoList extends StatefulWidget {
//   @override
//   _ToDoListState createState() => _ToDoListState();
// }

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final screens = [
    HomePage(),
    ListPage(),
    TrackerPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    body: IndexedStack(
      index: currentIndex,
      children: screens,
    ),
    bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap:(index) => setState(() => currentIndex = index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.checklist_rounded),
          label: 'Lists',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event_available_outlined),
          label: 'Tracker',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline_rounded),
          label: 'Profile',
          backgroundColor: Colors.blue,
        ),

      ],
    ),
  );
}

// class _ToDoListState extends State<ToDoList> {
//   final List<String> _toDoList = <String>[];
//   final TextEditingController _textFieldController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('To-do List'),
//       ),
//       body: ListView(children: _getItems()),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _displayDialog(context),
//         tooltip: 'Add item',
//         child: Icon(Icons.add),
//       ),
//     );
//   }

//   void _addToDoItem(String title) {
//     setState(() {
//       _toDoList.add(title);
//     });
//     _textFieldController.clear();
//   }

//   Widget _buildToDoItem(String title) {
//     return ListTile(
//       title: Text(title)
//     );
//   }

//   // display dialog for user entry of items
//   Future<dynamic> _displayDialog(BuildContext context) async {
//     // alter the app state to show a dialog
//     return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Add a task to your list'),
//           content: TextField(
//             controller: _textFieldController,
//             decoration: const InputDecoration(hintText: 'Enter task here'),
//           ),
//           actions: <Widget>[
//             // add button
//             TextButton(
//               child: const Text('ADD'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 _addToDoItem(_textFieldController.text);
//               },
//             ),
//             // cancel button
//             TextButton(
//               child: const Text('CANCEL'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             )
//           ],
//         );
//       }
//     );
//   }

//   List<Widget> _getItems() {
//     final List<Widget> _toDoWidgets = <Widget>[];
//     for (String title in _toDoList) {
//       _toDoWidgets.add(_buildToDoItem(title));
//     }
//     return _toDoWidgets;
//   }
// }