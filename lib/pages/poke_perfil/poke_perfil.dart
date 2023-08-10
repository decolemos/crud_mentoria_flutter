import 'package:flutter/material.dart';
import 'package:list_crud_pokemon/pages/poke_perfil/components/additional_info.dart';
import 'package:list_crud_pokemon/pages/poke_perfil/components/card_type_pokemon.dart';
import 'package:list_crud_pokemon/pages/poke_perfil/components/percent_indicator.dart';
import 'package:list_crud_pokemon/pages/poke_perfil/components/title_nome_pokemon.dart';
import 'package:list_crud_pokemon/providers/lista_tipo.dart';
import '../../models/pokemon.dart';

class PokePerfil extends StatefulWidget {

  final Pokemon pokemon;

  const PokePerfil({super.key, required this.pokemon});

  @override
  State<PokePerfil> createState() => _PokePerfilState();
}

final ListaTipo listaTipo = ListaTipo();

Color retornarCorTipo(String nome) {
  final int index = listaTipo.valores.indexWhere((tipo) => tipo.nome == nome);
  final Color corSelecionada = listaTipo.valores[index].cor;

  return corSelecionada;
}

class _PokePerfilState extends State<PokePerfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.pokemon.imagePokemonCard != null ? retornarCorTipo(
        widget.pokemon.primeiroTipo) : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: widget.pokemon.imagePokemonCard != null
      ? ListView(
        children: [
            TitleNomePokemon(titlePokemonName: widget.pokemon.nome),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: CardTypePokemon(
                primeiroTipo: widget.pokemon.primeiroTipo, 
                segundoTipo: widget.pokemon.segundoTipo,
              ),
            ),
          Center(
            child: SizedBox(
              height: 200,
              child: Image.network(widget.pokemon.imagePokemonDetail ?? "")
            ),
          ),
          AdditionalInfo(
            titleFirstInfo: "Sobre", 
            titleSecondtInfo: "Reprodução", 
            pokemon: widget.pokemon,
          )
        ],
      )
      : const Text("Esse pokemon não existe")
    );
  }
}