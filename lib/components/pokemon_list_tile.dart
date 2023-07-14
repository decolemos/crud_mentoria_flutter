import 'package:flutter/material.dart';

import '../models/pokemon.dart';

class PokemonListTile extends StatelessWidget {

  final Pokemon pokemon;
  final void Function() editarPokemon;
  final void Function(String id) removerPokemon;

  const PokemonListTile({super.key, 
    required this.pokemon, 
    required this.editarPokemon, 
    required this.removerPokemon
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(pokemon.nome),
        subtitle: Text(pokemon.tipo),
        trailing: SizedBox(
          width: MediaQuery.of(context).size.width / 100 * 20,
          child: Row(
            children: [
              IconButton(
                onPressed: editarPokemon,
                icon: const Icon(Icons.edit, color: Colors.orange,)
              ),
              IconButton(
                onPressed: () => removerPokemon(pokemon.id),
                icon: const Icon(Icons.delete, color: Colors.red,)
              ),
            ],
          ),
        ),
      ),
    );
  }
}