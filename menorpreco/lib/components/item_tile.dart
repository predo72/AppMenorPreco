import 'package:flutter/material.dart';
import 'package:menorpreco/models/item.dart';

class ItemTile extends StatelessWidget {
  final Item item;
  const ItemTile(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.check_box_outline_blank_rounded),
      title: Text(item.nome),
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
    );
  }
}
