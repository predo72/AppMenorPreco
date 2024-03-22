import 'package:flutter/material.dart';
import 'package:menorpreco/models/lista.dart';

class ListaTile extends StatelessWidget {
  final Lista lista;
  const ListaTile(this.lista, {super.key});

  @override
  Widget build(BuildContext context) {
    final finalizada =
        lista.finalizada == 1 ? Text('Finalizada') : Text('Aberta');
    return ListTile(
      leading: Icon(Icons.format_list_bulleted_outlined),
      title: Text(lista.nome),
      subtitle: finalizada,
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
