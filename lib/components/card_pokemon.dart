// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:list_crud_pokemon/components/img_pokemon.dart';
import 'package:list_crud_pokemon/components/popup_menu.dart';
import 'package:list_crud_pokemon/pages/poke_perfil/poke_perfil.dart';
import 'package:provider/provider.dart';

import '../models/pokemon.dart';
import '../pages/poke_perfil/components/card_type_pokemon.dart';
import '../providers/controlador_lista.dart';
import '../providers/lista_tipo.dart';

class GridviewPokemon extends StatefulWidget {

  final Pokemon pokemon;

  const GridviewPokemon({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  State<GridviewPokemon> createState() => _GridviewPokemonState();
}

class _GridviewPokemonState extends State<GridviewPokemon> {
  final ListaTipo listaTipo = ListaTipo();

  Color get capturarCor {
    int index = listaTipo.valores.indexWhere((tipo) => tipo.nome == widget.pokemon.primeiroTipo);
    listaTipo.valores[index].cor;
    return listaTipo.valores[index].cor;
  } 

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ControladorLista>(context);
    return  InkWell(
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(
            builder: (context) => PokePerfil(pokemon: widget.pokemon),
          )
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              offset: Offset(2, 2)
            )
          ],
          borderRadius: BorderRadius.circular(20),
          color: capturarCor
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.pokemon.nome, 
                style: const TextStyle(
                  color: Colors.white, 
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                  ),
                ),
                IconButton(onPressed: () {
                  showDialog(
                    context: context, 
                    builder: (context) => PopupMenu(
                      pokemon: widget.pokemon,
                      removerPokemon: (id) => provider.removerPokemon(id),
                      editarPokemon: provider.editarPokemon,
                    ),
                  );
                }, 
                  icon: const Icon(Icons.more_vert),
                  color: Colors.white,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardTypePokemon(
                primeiroTipo: widget.pokemon.primeiroTipo,
                segundoTipo: widget.pokemon.segundoTipo,
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: 70,
                height: 90,
                child: ImgPokemon(url: widget.pokemon.imagePokemonCard)
              ),
            ],
          ),
          ],
        ),
      ),
    );
  }
}
