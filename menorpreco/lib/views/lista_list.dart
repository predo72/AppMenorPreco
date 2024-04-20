import 'package:flutter/material.dart';
import 'package:menorpreco/components/lista_tile.dart';
import 'package:menorpreco/provider/listas.dart';
import 'package:menorpreco/routes/app_routes.dart';
import 'package:provider/provider.dart';

class ListaList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ListasNotifier listaProvider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Listas de Compras'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_alt_outlined),
            onPressed: () => (),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.LISTA_FORM);
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: listaProvider.count,
        itemBuilder: (ctx, i) => ListaTile(listaProvider.byIndex(i)),
      ),
    );
  }
}
