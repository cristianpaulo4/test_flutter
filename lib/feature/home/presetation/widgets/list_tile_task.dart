import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListTileTask extends StatelessWidget {
  const ListTileTask({
    super.key,
    required this.text,
    this.onDelete,
    this.onEdit,
  });
  final String text;
  final Function()? onDelete;
  final Function()? onEdit;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      trailing: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: onEdit,
            icon: const Icon(CupertinoIcons.pen),
          ),
          IconButton(
            onPressed: onDelete,
            icon: const Icon(
              CupertinoIcons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
