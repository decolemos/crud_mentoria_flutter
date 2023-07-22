import 'package:flutter/material.dart';
import '../models/pokemon.dart';


class PokemonListTile extends StatefulWidget {
  final Pokemon pokemon;
  final void Function() editarPokemon;
  final void Function(String id) removerPokemon;
  final Color? corSelecionada;

  const PokemonListTile({super.key, 
    required this.pokemon, 
    required this.editarPokemon, 
    required this.removerPokemon, 
    this.corSelecionada,
  });

  @override
  State<PokemonListTile> createState() => _PokemonListTileState();
}



class _PokemonListTileState extends State<PokemonListTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
        // color: Colors.red,
      child: Container(
        child: ListTile(
          title: Text(widget.pokemon.nome),
          subtitle: Text (widget.pokemon.segundoTipo == null ? widget.pokemon.primeiroTipo : "${widget.pokemon.primeiroTipo} / ${widget.pokemon.segundoTipo}"),
          trailing: SizedBox(
            width: MediaQuery.of(context).size.width / 100 * 20,
            child: Row(
              children: [
                IconButton(
                  onPressed: widget.editarPokemon,
                  icon: const Icon(Icons.edit, color: Colors.orange,)
                ),
                IconButton(
                  onPressed: () => widget.removerPokemon(widget.pokemon.id),
                  icon: const Icon(Icons.delete, color: Colors.red,)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}