import 'package:flutter/material.dart';
import 'package:menorpreco/models/lista.dart';
import 'package:menorpreco/provider/listas.dart';
import 'package:menorpreco/routes/app_routes.dart';
import 'package:provider/provider.dart';

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
              icon: Icon(Icons.edit),
              color: Colors.grey,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.LISTA_FORM,
                  arguments: lista,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Excluir a Lista?'),
                    content: Text(
                        'Todos os produtos desta lista serão excluídos juntamente com a lista.'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Não'),
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                      TextButton(
                        child: Text('Sim'),
                        onPressed: () => Navigator.of(context).pop(true),
                      ),
                    ],
                  ),
                ).then((confirmed) {
                  if (confirmed) {
                    Provider.of<ListasNotifier>(
                      context,
                      listen: false,
                    ).remove(
                      lista.id,
                    );
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
