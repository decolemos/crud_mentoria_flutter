import 'package:flutter/material.dart';
import 'package:list_crud_pokemon/components/dropdown_tipo.dart';
import 'package:list_crud_pokemon/models/tipo.dart';

import 'dropdown_tipo copy.dart';

class ListForm extends StatefulWidget {

  final int? id;
  final String title;
  final String labelNome;
  final String hintNome;
  final String labelPrimeiroTipo;
  final String hintPrimeiroTipo;
  final String labelSegundoTipo;
  final String hintSegundoTipo;
  final void Function(String nome, String primeiroTipo, String? segundoTipo) executar;

  const ListForm({
    Key? key,
    this.id,
    required this.title,
    required this.labelNome,
    required this.hintNome,
    required this.labelPrimeiroTipo,
    required this.hintPrimeiroTipo,
    required this.labelSegundoTipo, 
    required this.hintSegundoTipo, 
    required this.executar,  
  }) : super(key: key);

  @override
  State<ListForm> createState() => _ListFormState();
}

class _ListFormState extends State<ListForm> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, String?> _formData = {};
  late Tipo primeiroTipo;
  Tipo? segundoTipo;

  void _submit() {
    if(!_formKey.currentState!.validate()) return; 
    _formKey.currentState!.save();

    widget.executar(
      _formData["nome"].toString(),
      primeiroTipo.nome.toString(),
      segundoTipo?.nome
    );
    Navigator.of(context).pop();
  }


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: widget.labelNome,
                hintText: widget.hintNome
              ),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return "Nome não pode ser vazio";
                }
                return null;
              },
              onSaved: (newValue) => _formData["nome"] = newValue!
            ),
            // TextFormField(
            //   decoration: InputDecoration(
            //     labelText: widget.labelPrimeiroTipo,
            //     hintText: widget.labelPrimeiroTipo
            //   ),
            //   validator:(value) {
            //     if(value == null || value.isEmpty) {
            //       return "Tipo não pode ser vazio";
            //     }
            //     return null;
            //   },
            //   onSaved: (newValue) => _formData["primeiroTipo"] = newValue!
            // ),
            // TextFormField(
            //   decoration: InputDecoration(
            //     labelText: widget.labelSegundoTipo,
            //     hintText: widget.labelSegundoTipo
            //   ),
            //   onSaved: (newValue) =>  newValue!.isEmpty ? _formData["segundoTipo"] = null : _formData["segundoTipo"] = newValue
            // ),
            const DropdownOk(
              // labelDropdown: "tipo 1", 
              // definirTipo: (tipo) =>  primeiroTipo = tipo,
            ),
            // DropdownOk(
            //   // labelDropdown: "Tipo 2",
            //   // definirTipo: (tipo) => segundoTipo = tipo,
            // )
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, 
          child: const Text("Cancelar")
        ),
        TextButton(
          onPressed: _submit,
          child: const Text("Confirmar")
        )
      ],
    );
  }
}