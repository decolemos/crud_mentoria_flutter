// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:list_crud_pokemon/models/tipo.dart';

import '../providers/lista_tipo.dart';
import 'dropdown_tipo.dart';

class ListForm extends StatefulWidget {

  final int? id;
  final String title;
  final String labelNome;
  final String hintNome;
  final void Function(String nome, String primeiroTipo, String? segundoTipo) executar;
  final void Function(Tipo tipoSelecionado) alterarTipo;
  // final void Function(Color corSelecionada) alterarCor;


  const ListForm({
    Key? key,
    this.id,
    required this.title,
    required this.labelNome,
    required this.hintNome,
    required this.executar,
    required this.alterarTipo, 
    // required this.alterarCor, 
  }) : super(key: key);

  @override
  State<ListForm> createState() => _ListFormState();
}

final listaTipo = ListaTipo();

List<Tipo> listaValores = listaTipo.valores;

class _ListFormState extends State<ListForm> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, String?> _formData = {};
  late Tipo primeiroTipo;
  Tipo? segundoTipo;
  late Color corSelecionada;

  void capturarCor(String nome) {
    int index = listaValores.indexWhere((tipo) => tipo.nome == nome);
    widget.alterarTipo(listaValores[index]);
    print(nome);
    corSelecionada = listaValores[index].cor;
    print(corSelecionada);
  } 


  void _submit() {
    if(!_formKey.currentState!.validate()) return; 
    _formKey.currentState!.save();

    widget.executar(
      _formData["nome"].toString(),
      primeiroTipo.nome.toString(),
      segundoTipo?.nome
    );

    capturarCor(primeiroTipo.nome);
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
            DropdownOk(alterarTipo: (tipoSelecionado) => primeiroTipo = tipoSelecionado),
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