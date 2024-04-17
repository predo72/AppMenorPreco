import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:menorpreco/models/item.dart';

class ItemTile extends StatelessWidget {
  final Item item;
  const ItemTile(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.5,
        children: [
          SlidableAction(
            label: 'Editar',
            backgroundColor: Colors.blue,
            icon: Icons.edit,
            onPressed: (context) {},
          ),
          SlidableAction(
            label: 'Remover',
            backgroundColor: Colors.red,
            icon: Icons.delete,
            onPressed: (context) {},
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.25,
        children: [
          SlidableAction(
            label: 'Comprado',
            backgroundColor: Colors.blueAccent,
            icon: Icons.check_box_outlined,
            onPressed: (context) {},
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(Icons.check_box_outline_blank_rounded),
        title: Text(item.nome),
      ),
    );
  }
}
