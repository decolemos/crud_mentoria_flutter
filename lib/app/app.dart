import 'package:flutter/material.dart';
import 'package:list_crud_pokemon/providers/controlador_lista.dart';
import 'package:provider/provider.dart';

import '../pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ControladorLista(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/":(context) => const HomePage(),
        },
      ),
    );
  }
}