import 'package:flutter/material.dart';

import '../../models/Administrative.dart';

class AdministrativeListItem extends StatelessWidget {
  final Administrative administrative;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onViewChildren;

  AdministrativeListItem({
    required this.administrative,
    required this.onEdit,
    required this.onDelete,
    required this.onViewChildren,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(administrative.name),
      subtitle: Text('Mã: ${administrative.code}, Cấp độ: ${administrative.level}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: onEdit,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: onDelete,
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: onViewChildren,
          ),
        ],
      ),
    );
  }
}
