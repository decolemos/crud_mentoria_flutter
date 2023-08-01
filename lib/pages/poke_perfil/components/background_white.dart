import 'package:flutter/material.dart';
import 'package:list_crud_pokemon/pages/poke_perfil/components/info_pokemon.dart';

import '../../../models/pokemon.dart';

class BackgroundWhite extends StatelessWidget {

  final String titleFirstInfo;
  final String titleSecondtInfo;
  final Pokemon pokemon;

  const BackgroundWhite({super.key, 
    required this.titleFirstInfo, 
    required this.titleSecondtInfo, 
    required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, 
      height: 500,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40), 
          topRight: Radius.circular(40)
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titleFirstInfo, 
              style: const TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.bold)
              ),
            InfoPokemon(
              label: "Altura: ", 
              value: "${(pokemon.heigth! / 10).toStringAsFixed(2)} m"
            ),
            InfoPokemon(
              label: "Peso: ",
              value: "${(pokemon.weight)} kg", 
            ),
            Text(titleSecondtInfo, 
              style: const TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.bold
              )
            ),
          ],
        ),
      ),
    );
  }
}