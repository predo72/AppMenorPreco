import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:menorpreco/models/item.dart';

class ItemTile extends StatelessWidget {
  final Item item;
  const ItemTile(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.7,
        children: [
          SlidableAction(
            label: 'Finalizar',
            backgroundColor: Colors.lightGreen,
            icon: Icons.check_box_outlined,
            onPressed: (ctx) => finalizar(context),
          ),
          SlidableAction(
            label: 'Editar',
            backgroundColor: Colors.blueAccent,
            icon: Icons.edit,
            onPressed: (ctx) => editar(context),
          ),
          SlidableAction(
            label: 'Remover',
            backgroundColor: Colors.redAccent,
            icon: Icons.delete,
            onPressed: (ctx) => remover(context),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(Icons.check_box_outline_blank_rounded),
        title: Text(item.nome),
      ),
    );
  }

  finalizar(context) {}

  editar(context) {}

  remover(context) {}
}
