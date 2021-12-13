import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Lists'),
    ),
    body: Center(child: Text('List', style: TextStyle(fontSize: 60))),
  ); 

}