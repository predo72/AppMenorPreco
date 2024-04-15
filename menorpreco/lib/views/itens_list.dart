import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:menorpreco/constants/status_finalizada.dart';
import 'package:menorpreco/models/lista.dart';
import 'package:menorpreco/provider/listas.dart';
import 'package:provider/provider.dart';

class ListaItens extends StatefulWidget {
  const ListaItens({super.key});

  @override
  State<ListaItens> createState() => _ListaItensState();
}

class _ListaItensState extends State<ListaItens> {
  final _form = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  void _loadFormData(Lista lista) {
    _formData['id'] = lista.id;
    _formData['nome'] = lista.nome;
    _formData['finalizada'] = lista.finalizada;
  }

  void finalizarLista() {
      _form.currentState?.save();
    Provider.of<ListasNotifier>(
        context,
        listen: false,
      ).put(
        Lista(
          id: _formData['id'],
          nome: _formData['nome'],
          finalizada: ConstantsLista.FINALIZADA,
        ),
      );
      Navigator.of(context).pop();
  }

  void adicionarItem() {

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
    return Scaffold(
      appBar: AppBar(
        title: Text(_formData['nome']),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.format_list_bulleted_add,
        openCloseDial: isDialOpen,
        onPress: () => isDialOpen.value = !isDialOpen.value,
        children: [
          SpeedDialChild(
              child: Icon(Icons.add),
              backgroundColor: Colors.lightGreen,
              foregroundColor: Colors.white,
              label: 'Adicionar Item',
              onTap: () => adicionarItem,
            ),
            SpeedDialChild(
              child: Icon(Icons.check),
              backgroundColor: Colors.deepOrangeAccent,
              foregroundColor: Colors.white,
              label: 'Finalizar Lista',
              onTap: () => finalizarLista,
            ),
        ],
      ),
    );
  }
}
