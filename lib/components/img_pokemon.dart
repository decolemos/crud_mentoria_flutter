import 'package:flutter/material.dart';

class ImgPokemon extends StatelessWidget {
  const ImgPokemon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.network("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
      width: 70,
      height: 300,
      fit: BoxFit.cover
      ),      
    );
  }
}