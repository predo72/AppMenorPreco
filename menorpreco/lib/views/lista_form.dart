import 'dart:math';

import 'package:flutter/material.dart';
import 'package:menorpreco/models/lista.dart';
import 'package:menorpreco/provider/listas.dart';
import 'package:provider/provider.dart';

class ListaForm extends StatefulWidget {
  const ListaForm({super.key});

  @override
  State<ListaForm> createState() => _ListaFormState();
}

class _ListaFormState extends State<ListaForm> {
  final _form = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};

  @override
  Widget build(BuildContext context) {
    bool? isChecked = _formData[' '] == 1 ? true : false;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Lista'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => salvar(),
          ),
        ],
      ),
      body: Form(
        key: _form,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                initialValue: _formData['nome'],
                decoration: InputDecoration(
                  labelText: 'Nome',
                ),
                validator: (value) {
                  if (value.toString().trim().isEmpty) {
                    return 'Informe um nome para a lista.';
                  }
                },
                onSaved: (value) => _formData['nome'] = value,
              ),
            ),
            CheckboxListTile(
              title: Text('Finalizada'),
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value;
                  _formData['finalizada'] = isChecked == true ? 1 : 0;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

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

  void salvar() {
    if (_form.currentState!.validate()) {
      _form.currentState?.save();
      _formData['id'] = _formData['id'] == null
          ? Random().nextDouble().toString()
          : _formData['id'];
      _formData['finalizada'] = _formData['finalizada'] == null ? 0 : 1;
      Provider.of<ListasNotifier>(
        context,
        listen: false,
      ).put(
        Lista(
          id: _formData['id'],
          nome: _formData['nome'],
          finalizada: _formData['finalizada'],
        ),
      );
      Navigator.of(context).pop();
    }
  }
}
