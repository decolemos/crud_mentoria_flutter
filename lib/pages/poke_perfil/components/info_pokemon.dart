import 'package:flutter/material.dart';

class InfoPokemon extends StatelessWidget {

  final String label;
  final String value;


  const InfoPokemon({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label),
        Text(value),
      ],
    );
  }
}