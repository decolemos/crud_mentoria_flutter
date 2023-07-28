// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:list_crud_pokemon/providers/lista_tipo.dart';

class SubtitleTipo extends StatelessWidget {

  final ListaTipo listaTipo = ListaTipo();

  final String tipoPokemon;

  SubtitleTipo({
    Key? key,
    required this.tipoPokemon,
  }) : super(key: key);

  late Color corSelecionada;

  Color capturarCor() {
    int index = listaTipo.valores.indexWhere((tipo) => tipo.nome == tipoPokemon);
    corSelecionada = listaTipo.valores[index].cor;
    return corSelecionada;
  } 

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: capturarCor(),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 2, bottom: 2, left: 4, right: 4),
          child: Text(tipoPokemon),
        ),
      ),
    );
  }
}
