import 'package:flutter/material.dart';
import 'package:menorpreco/data/dummy_listas.dart';
import 'package:menorpreco/models/lista.dart';

class ListasNotifier with ChangeNotifier {
  final Map<String, Lista> _listas = {...DUMMY_LISTAS};

  List<Lista> get all {
    return [..._listas.values];
  }

  int get count {
    return _listas.length;
  }

  Lista byIndex(int i) {
    return _listas.values.elementAt(i);
  }

  void put(Lista lista) {
    if (_listas.containsKey(lista.id)) {
      _listas.update(lista.id, (_) => lista);
    } else {
      _listas.putIfAbsent(lista.id, () => lista);
    }
    notifyListeners();
  }

  void remove(String id) {
    _listas.remove(id);
    notifyListeners();
  }
}
