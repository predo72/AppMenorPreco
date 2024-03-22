import 'package:flutter/material.dart';
import 'package:menorpreco/components/lista_tile.dart';
import 'package:menorpreco/data/dummy_listas.dart';

class ListaList extends StatelessWidget {
  const ListaList({super.key});

  @override
  Widget build(BuildContext context) {

    final teste = {...DUMMY_LISTAS};

    return Scaffold(
      appBar: AppBar(
        title: const Text('Listas de Compras'),
      ),
      body: ListView.builder(
        itemCount: teste.length,
        itemBuilder: (ctx, i) => ListaTile(teste.values.elementAt(i)), 
      ),
    );
  }
}