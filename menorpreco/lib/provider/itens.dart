import 'package:flutter/material.dart';
import 'package:menorpreco/data/dummy_itens.dart';
import 'package:menorpreco/models/item.dart';

class ItensNotifier with ChangeNotifier {
  final Map<String, Item> _itens = {...DUMMY_ITENS};

  List<Item> get all {
    return [..._itens.values];
  }

  int get count {
    return _itens.length;
  }

  Item byIndex(int i) {
    return _itens.values.elementAt(i);
  }

  void put(Item item) {
    if (_itens.containsKey(item.id)) {
      _itens.update(item.id, (_) => item);
    } else {
      _itens.putIfAbsent(item.id, () => item);
    }
    notifyListeners();
  }

  void remove(String id) {
    _itens.remove(id);
    notifyListeners();
  }
}
