import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:list_crud_pokemon/models/tipo.dart';
import 'package:list_crud_pokemon/providers/lista_tipo.dart';

class DropdownTipo extends StatefulWidget {
  final String labelDropdown;
  final void Function(Tipo tipo) definirTipo;
  

  const DropdownTipo({
    Key? key,
    required this.labelDropdown,
    required this.definirTipo,
  }) : super(key: key);

  @override
  State<DropdownTipo> createState() => _DropdownTipoState();
}

class _DropdownTipoState extends State<DropdownTipo> {

  final ListaTipo listaTipo = ListaTipo();
  final List<DropdownMenuItem<Tipo>> listaDropdown = [];
  late Tipo? tipoSelecionado;
  
  @override
  void initState() {
    super.initState();
    gerarDropdown();
    tipoSelecionado = listaTipo.valores[0];
  }

  void gerarDropdown() {
    for(int index = 0; listaTipo.valores.length > index; index++){
      listaDropdown.add(DropdownMenuItem(
        value: listaTipo.valores[index],
        child: Text(listaTipo.valores[index].nome), 
        ),
      );
    }
  }

  void alternarTipo(Tipo? tipo) {
    print(tipo!.nome);
    setState(() {
      tipoSelecionado = tipo;
    });
    widget.definirTipo(tipo);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        items: listaDropdown,
        value: tipoSelecionado,
        menuItemStyleData: MenuItemStyleData(
          selectedMenuItemBuilder: (context, child) {
            return DropdownMenuItem(
              value: tipoSelecionado,
              child: Text("teste"),
            );
          },
        ),
      ),
    );
    // return SizedBox(
    //   child: DropdownMenu<Tipo>(
    //     menuHeight: 200,
    //     initialSelection: tipoSelecionado,
    //     dropdownMenuEntries: listaDropdown,
    //     onSelected: alternarTipo,
    //     label: Text(widget.labelDropdown),
    //   ),
    // );
  }
}