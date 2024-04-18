import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
    return Slidable(
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.6,
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
        title: Text(lista.nome),
        subtitle: finalizada,
        onTap: () => visualizar(context),
      ),
    );
  }

  void finalizar(context) {}

  void editar(context) {
    Navigator.of(context).pushNamed(
      AppRoutes.LISTA_FORM,
      arguments: lista,
    );
  }

  void remover(context) {
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
  }

  void visualizar(context) {
    Navigator.of(context).pushNamed(
      AppRoutes.LISTA_ITENS,
      arguments: lista,
    );
  }
}
