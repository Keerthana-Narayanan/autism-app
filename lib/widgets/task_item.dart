import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String taskTitle;
  final bool isCompleted;
  final VoidCallback onToggle;

  const TaskItem({
    Key? key,
    required this.taskTitle,
    required this.isCompleted,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: Icon(
          isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
          color: isCompleted ? Colors.green : Colors.grey,
        ),
        onPressed: onToggle,
      ),
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
    );
  }
}
