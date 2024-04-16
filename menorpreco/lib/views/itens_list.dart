import 'package:flutter/material.dart';
import 'package:menorpreco/components/item_tile.dart';
import 'package:menorpreco/models/lista.dart';
import 'package:menorpreco/provider/itens.dart';
import 'package:provider/provider.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  final Map<String, dynamic> _formDataLista = {};

  void _loadFormData(Lista lista) {
    _formDataLista['id'] = lista.id;
    _formDataLista['nome'] = lista.nome;
    _formDataLista['finalizada'] = lista.finalizada;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context)?.settings.arguments != null) {
      _loadFormData(ModalRoute.of(context)?.settings.arguments as Lista);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ItensNotifier itemProvider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_formDataLista['nome']),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: itemProvider.count,
        itemBuilder: (ctx, i) => ItemTile(itemProvider.byIndex(i)),
      ),
    );
  }
}
