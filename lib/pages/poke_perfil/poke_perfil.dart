import 'package:flutter/material.dart';
import 'package:list_crud_pokemon/pages/poke_perfil/components/background_white.dart';
import 'package:list_crud_pokemon/pages/poke_perfil/components/card_type_pokemon.dart';
import 'package:list_crud_pokemon/pages/poke_perfil/components/title_nome_pokemon.dart';

import '../../models/pokemon.dart';

class PokePerfil extends StatefulWidget {

  final Pokemon pokemon;

  const PokePerfil({super.key, required this.pokemon});

  @override
  State<PokePerfil> createState() => _PokePerfilState();
}

class _PokePerfilState extends State<PokePerfil> {
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
            TitleNomePokemon(titlePokemonName: widget.pokemon.nome),
            CardTypePokemon(textCardTypePokemon: widget.pokemon.primeiroTipo),
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