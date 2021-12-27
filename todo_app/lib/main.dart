

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos.dart';

import 'package:todo_app/page/home_page.dart';
import 'package:todo_app/page/list_page.dart';
import 'package:todo_app/page/tracker_page.dart';
import 'package:todo_app/page/profile_page.dart';

void main() {
  runApp(ToDo());
}

class ToDo extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => ToDosProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do List',
      home: MainPage()
    ),
  );
}

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
