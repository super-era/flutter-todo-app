import 'dart:html';

import 'package:flutter/material.dart';

class ToDoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedToDo;

  const ToDoFormWidget({
    Key key,
    this.title = '',
    this.description = '',
    @required this.onChangedTitle,
    @required this.onChangedDescription,
    @required this.onSavedToDo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      children: [
        buildTitle(),
      ]
    )
  );

  Widget buildTitle() => TextFormField(
    initialValue: title,
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Title',
    )
  );
}