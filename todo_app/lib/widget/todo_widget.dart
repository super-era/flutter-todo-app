import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/provider/todos.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/page/edit_todo_page.dart';
import 'package:todo_app/utils.dart';

class ToDoWidget extends StatelessWidget {
  final ToDo todo;

  const ToDoWidget({
    required this.todo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Slidable(
      child: buildToDo(context),
      startActionPane: ActionPane(
        key: Key(todo.id),
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: () {}
        ),
        children: [
          SlidableAction(
            onPressed: (_) {}, // editToDo(context, todo),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ), 
        ]
      ),
      endActionPane: ActionPane(
        key: Key(todo.id),
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: () {}
        ),
        children: [
          SlidableAction(
            onPressed: deleteToDo(context, todo),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ), 
        ],
      )
    )
  );

  Widget buildToDo(BuildContext context) => GestureDetector(
    onTap: () => editToDo(context, todo),
    child: Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Checkbox(
            activeColor: Theme.of(context).primaryColor,
            checkColor: Colors.white,
            value: todo.isDone,
            onChanged: (_) {
              final provider = 
                Provider.of<ToDosProvider>(context, listen: false);
              final isDone = provider.toggleToDoStatus(todo);
              Utils.getCurrentSnackBar(
                context,
                isDone ? 'Task marked complete!' : 'Task marked incomplete!',
              );
            },
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
    ),
  );

  deleteToDo(BuildContext context, ToDo todo) {
    final provider = Provider.of<ToDosProvider>(context, listen: false);
    provider.removeToDo(todo);

    Utils.getCurrentSnackBar(context, 'Task deleted!');
  }

  editToDo(BuildContext context, ToDo todo) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => editToDoPage(todo: todo),
      ),
    );
  }
}