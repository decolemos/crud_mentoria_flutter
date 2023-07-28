import 'package:flutter/material.dart';

class InfoPokemon extends StatelessWidget {

  final String titleInfoPokemon;
  final String infoPokemon;


  const InfoPokemon({super.key, required this.titleInfoPokemon, required this.infoPokemon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(titleInfoPokemon),
        Text(infoPokemon),
      ],
    );
  }
}