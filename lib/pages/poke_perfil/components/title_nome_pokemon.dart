import 'package:flutter/material.dart';

class TitleNomePokemon extends StatelessWidget {

  final String titlePokemonName;

  const TitleNomePokemon({super.key, required this.titlePokemonName});

  @override
  Widget build(BuildContext context) {
    return Align(
    alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(titlePokemonName,
          style: const TextStyle(
            color: Colors.white, 
            fontSize: 40, 
            fontWeight: FontWeight.bold
          )
        ),
      ),
    );
  }
}