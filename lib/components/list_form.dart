// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ListForm extends StatefulWidget {

  final int? id;
  final String title;
  final String labelNome;
  final String hintNome;
  final String labelTipo;
  final String hintTipo;
  final void Function(String nome, String tipo) executar;

  const ListForm({
    Key? key,
    this.id,
    required this.title,
    required this.labelNome,
    required this.hintNome,
    required this.labelTipo,
    required this.hintTipo,
    required this.executar, 
  }) : super(key: key);

  @override
  State<ListForm> createState() => _ListFormState();
}

class _ListFormState extends State<ListForm> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _submit() {
    if(!_formKey.currentState!.validate()) return; 
      _formKey.currentState!.save();

      widget.executar(
        _formData["nome"].toString(),
        _formData["tipo"].toString(),
      );
      Navigator.of(context).pop;
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
            TextFormField(
              decoration: InputDecoration(
                labelText: widget.labelTipo,
                hintText: widget.labelTipo
              ),
              validator:(value) {
                if(value == null || value.isEmpty) {
                  return "Tipo não pode ser vazio";
                }
                return null;
              },
              onSaved: (newValue) => _formData["tipo"] = newValue!
            ),
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