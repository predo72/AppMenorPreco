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
    final subtitleLista =
        lista.finalizada == 1 ? Text('Finalizada') : Text('Aberta');
    final lblButtonStatus =
        lista.finalizada == 1 ? 'Abrir' : 'Finalizar';
    final iconButtonStatus = 
        lista.finalizada == 1 ? Icons.check_box_outline_blank : Icons.check_box_outlined; 
    
    return Slidable(
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.7,
        children: [
          SlidableAction(
            label: lblButtonStatus,
            backgroundColor: Colors.lightGreen,
            icon: iconButtonStatus,
            onPressed: (ctx) => alterarStatus(context),
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
        subtitle: subtitleLista,
        onTap: () => visualizar(context),
      ),
    );
  }

  void alterarStatus(context) {    
    final newStatus =
        lista.finalizada == 1 ? 0: 1;

    Provider.of<ListasNotifier>(
      context,
      listen: false,
    ).put(
      Lista(
        id: lista.id,
        nome: lista.nome,
        finalizada: newStatus,
      ),
    );
  }

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
