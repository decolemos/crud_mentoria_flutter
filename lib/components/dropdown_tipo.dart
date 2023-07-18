import 'package:flutter/material.dart';
import 'package:list_crud_pokemon/models/tipo.dart';
import 'package:list_crud_pokemon/providers/lista_tipo.dart';

class DropdownTipo extends StatefulWidget {
  DropdownTipo({super.key});

  @override
  State<DropdownTipo> createState() => _DropdownTipoState();
}

class _DropdownTipoState extends State<DropdownTipo> {

  final ListaTipo listaTipo = ListaTipo();
  final List<DropdownMenuEntry<Tipo>> listaDropdown = [];
  late Tipo? tipoSelecionado;
  
  @override
  void initState() {
    super.initState();
    gerarDropdown();
    tipoSelecionado = listaTipo.valores[0];
  }

  gerarDropdown() {
    for(int index = 0; listaTipo.valores.length > index; index++){
      listaDropdown.add(DropdownMenuEntry(value: listaTipo.valores[index], label: listaTipo.valores[index].nome));
    }
  }

  alternarTipo(Tipo? tipo) {
    print(tipo!.nome);
    setState(() {
      tipoSelecionado = tipo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<Tipo>(
      menuHeight: 200,
      initialSelection: tipoSelecionado,
      dropdownMenuEntries: listaDropdown,
      onSelected: alternarTipo,
      label: const Text("Tipos"),
    );
  }
}