import 'package:flutter/material.dart';
import 'package:list_crud_pokemon/components/list_form.dart';

import '../models/pokemon.dart';

class PopupMenu extends StatelessWidget {
  final Pokemon pokemon;
  final void Function() editarPokemon;
  final void Function(String id) removerPokemon;
  // final Color? corSelecionada;

  const PopupMenu({super.key, 
    required this.pokemon, 
    required this.editarPokemon, 
    required this.removerPokemon, 
    // this.corSelecionada,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context, 
                    builder: (context) => ListForm(
                      title: "Editar Pokemon", 
                      labelNome: "Novo Pokemon", 
                      hintNome: "Informe o nome de outro pokemon", 
                      executar: (nome, primeiroTipo, segundoTipo) {
                        editarPokemon();
                      },
                    ),
                  );
                }, 
                child: const Text("Editar Pokemon")
              ),
              ElevatedButton(
                onPressed: () {
                  removerPokemon(pokemon.id);
                  Navigator.pop(context);
                }, 
                child: const Text("Remover Pokemon")
              ),
            ],
          ),
        )
      ],
    );
  }
}

// return PopupMenuButton(itemBuilder: (context) {
    //     return [
    //       const PopupMenuItem<int>(
    //         value: 0,
    //         child: Row(
    //           children: [
    //             Text("Editar"),
    //             Icon(Icons.edit)
    //           ],
    //         )
    //       ),
    //       const PopupMenuItem<int>(
    //         value: 1,
    //         child: Row(
    //           children: [
    //             Text("Remover"),
    //             Icon(Icons.delete)
    //           ],
    //         )
    //       ),
    //     ];
    //   },
      // onSelected: (value) {
      //   if(value == 0){
      //     widget.editarPokemon();
      //   } else if (value == 1) {
      //     widget.removerPokemon(widget.pokemon.id);
      //   }
      // },
    // );