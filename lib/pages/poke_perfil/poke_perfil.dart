import 'package:flutter/material.dart';
import 'package:list_crud_pokemon/pages/poke_perfil/components/background_white.dart';
import 'package:list_crud_pokemon/pages/poke_perfil/components/card_type_pokemon.dart';
import 'package:list_crud_pokemon/pages/poke_perfil/components/title_nome_pokemon.dart';

class PokePerfil extends StatelessWidget {
  const PokePerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8D030),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        children: [
            const TitleNomePokemon(titlePokemonName: "Pikachu"),
            const CardTypePokemon(textCardTypePokemon: "Elétrico"),
          SizedBox(
            height: MediaQuery.of(context).size.width / 100 * 60,
            child: Image.network("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png")
          ),
          const BackgroundWhite(titleFirstInfo: "Sobre", titleSecondtInfo: "Reprodução")
        ],
      ),
    );
  }
}