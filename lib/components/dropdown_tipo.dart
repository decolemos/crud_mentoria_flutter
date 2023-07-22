import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:list_crud_pokemon/providers/lista_tipo.dart';

import '../models/tipo.dart';

class DropdownOk extends StatefulWidget {

  final void Function(Tipo tipoSelecionado) alterarTipo;

  const DropdownOk({
    Key? key,
    required this.alterarTipo,
  }) : super(key: key);

  @override
  State<DropdownOk> createState() => _DropdownOkState();
}

class _DropdownOkState extends State<DropdownOk> {
  final listaTipo = ListaTipo();
  
  late String selectedValue;

  late List<Tipo> listaValores = listaTipo.valores;

  Color corAtual = Colors.white;

  List<DropdownMenuItem<String>> listaDeTipos = [];


  @override
  initState() {
    super.initState();
    gerarDropdown();
  }
   
  void gerarDropdown() {
    for(int index = 0; index < listaValores.length; index++){
      listaDeTipos.add(DropdownMenuItem(
        value: listaValores[index].nome,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: listaValores[index].cor,
          child: Text(listaValores[index].nome),
          )
        ),
      );
    }
    selectedValue = listaValores[0].nome;
  }

  void capturarCor(String nome) {
    int index = listaValores.indexWhere((tipo) => tipo.nome == nome);
    widget.alterarTipo(listaValores[index]);
    setState(() {
      corAtual = listaValores[index].cor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: const Row(
              children: [
                // Icon(
                //   Icons.list,
                //   size: 16,
                //   color: Colors.yellow,
                // ),
                // SizedBox(
                //   width: 4,
                // ),
                // Expanded(
                //   child: Text(
                //     'Select Item',
                //     style: TextStyle(
                //       fontSize: 14,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.yellow,
                //     ),
                //     overflow: TextOverflow.ellipsis,
                //   ),
                // ),
              ],
            ),
            items: listaDeTipos,
            value: selectedValue,
            onChanged: (String? value) {
              setState(() {
                capturarCor(value!);
                selectedValue = value;
              });
            },
            buttonStyleData: ButtonStyleData(
              height: 50,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(
                  color: Colors.black26,
                ),
                color: corAtual,
              ),
              // elevation: 2,
            ),
            // iconStyleData: const IconStyleData(
            //   icon: Icon(
            //     Icons.arrow_forward_ios_outlined,
            //   ),
            //   iconSize: 14,
            //   iconEnabledColor: Colors.yellow,
            //   iconDisabledColor: Colors.grey,
            // ),
            dropdownStyleData: DropdownStyleData(
              padding: const EdgeInsets.all(0),
              maxHeight: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.black,
              ),
              offset: const Offset(-20, 0),
              scrollbarTheme: ScrollbarThemeData(
                // radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all<double>(6),
                thumbVisibility: MaterialStateProperty.all<bool>(true),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.only(left: 0, right: 0),
            ),
          ),
        ),
      );
  }
}