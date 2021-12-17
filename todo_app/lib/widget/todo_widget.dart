import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/model/todo.dart';

class ToDoWidget extends StatelessWidget {
  final ToDo todo;

  const ToDoWidget({
    required this.todo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(
    key: Key(todo.id),
    startActionPane: ActionPane(
      motion: const ScrollMotion(),
      dismissible: DismissiblePane(
        onDismissed: () {}
      ),
      children: const [
        SlidableAction(
          onPressed: () {},
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: 'Edit',
        ), 
      ]
    ),
    endActionPane: ActionPane(
      motion: const ScrollMotion(),
      dismissible: DismissiblePane(
        onDismissed: () {}
      ),
      children: const [
        SlidableAction(
          onPressed: () {},
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ), 
      ]
    )
  );

  Widget buildToDo(BuildContext context) => Container(
    color: Colors.white,
    padding: EdgeInsets.all(20),
    child: Row(
      children: [
        Checkbox(
          activeColor: Theme.of(context).primaryColor,
          checkColor: Colors.white,
          value: todo.isDone,
          onChanged: (_) {},
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                todo.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  fontSize: 22,
                ),
              ),
              if (todo.description.isNotEmpty)
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(
                    todo.description,
                    style: TextStyle(fontSize:20, height: 1.5)
                  ),
                )
            ],
          )
        )
      ],
    )
  );
}