import 'package:flutter/material.dart';
import 'package:list_crud_pokemon/components/img_pokemon.dart';
import '../models/pokemon.dart';

class GridviewPokemon extends StatelessWidget {

  final Pokemon pokemon;

  const GridviewPokemon({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Column(
        children: [
          Text(pokemon.nome),
          ImgPokemon(url: pokemon.imagePokemon)
        ],
      ),
    );
  }
}