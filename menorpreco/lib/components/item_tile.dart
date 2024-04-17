import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:menorpreco/models/item.dart';

class ItemTile extends StatefulWidget {
  final Item item;
  const ItemTile(this.item, {super.key});

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  void doNothing(BuildContext context) {
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: () {},
        ),
        children: [
          SlidableAction(
            onPressed: (context) {
              
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (context) {
              
            },
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.share,
            label: 'Share',
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(Icons.check_box_outline_blank_rounded),
        title: Text('te'),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                color: Colors.grey,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () => {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
