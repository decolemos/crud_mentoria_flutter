import 'package:flutter/material.dart';
import 'package:list_crud_pokemon/components/list_form.dart';

import '../models/pokemon.dart';

class PopupMenu extends StatelessWidget {
  final Pokemon pokemon;
  final void Function(
    String id,
    String novoNome, 
    String novoPrimeiroTipo, 
    String? novoSegundoTipo
  ) editarPokemon;
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
                      pokemon: pokemon.nome,
                      executar: (nome, primeiroTipo, segundoTipo) {
                        editarPokemon(pokemon.id, nome, primeiroTipo, segundoTipo);
                      },
                    ),
                  );
                }, 
                child: const Row(
                  children: [
                    Text("Editar Pokemon"),
                    Icon(Icons.edit)
                  ],
                )
              ),
              ElevatedButton(
                onPressed: () {
                  removerPokemon(pokemon.id);
                  Navigator.pop(context);
                }, 
                child: const Row(
                  children: [
                    Text("Remover Pokemon"),
                    Icon(Icons.delete_forever_outlined)
                  ],
                )
              ),
            ],
          ),
        )
      ],
    );
  }
}
