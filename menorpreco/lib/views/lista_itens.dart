import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../models/lista.dart';

class ListaItens extends StatefulWidget {
  const ListaItens({super.key});

  @override
  State<ListaItens> createState() => _ListaItensState();
}

class _ListaItensState extends State<ListaItens> {
  final _form = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};

  void _loadFormData(Lista lista) {
    _formData['id'] = lista.id;
    _formData['nome'] = lista.nome;
    _formData['finalizada'] = lista.finalizada;
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
      ),
    );
  }
}
