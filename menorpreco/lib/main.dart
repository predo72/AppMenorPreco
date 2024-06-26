import 'package:flutter/material.dart';
import 'package:menorpreco/provider/itens.dart';
import 'package:menorpreco/provider/listas.dart';
import 'package:menorpreco/routes/app_routes.dart';
import 'package:menorpreco/views/itens_list.dart';
import 'package:menorpreco/views/lista_form.dart';
import 'package:menorpreco/views/lista_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ListasNotifier(),
        ),
        ChangeNotifierProvider(create: (ctx) => ItensNotifier(),)
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: false,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 63, 102, 75),
          ),
        ),
        routes: {
          AppRoutes.HOME: (_) => ListaList(),
          AppRoutes.LISTA_FORM: (_) => ListaForm(),
          AppRoutes.LISTA_ITENS: (_) => ItemList(),
        },
      ),
    );
  }
}
