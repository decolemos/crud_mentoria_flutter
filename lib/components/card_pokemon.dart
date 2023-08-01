import 'package:flutter/material.dart';
import 'package:list_crud_pokemon/components/img_pokemon.dart';
import 'package:list_crud_pokemon/pages/poke_perfil/poke_perfil.dart';
import '../models/pokemon.dart';
import '../pages/poke_perfil/components/card_type_pokemon.dart';
import '../providers/lista_tipo.dart';

class GridviewPokemon extends StatelessWidget {

  final Pokemon pokemon;
  final ListaTipo listaTipo = ListaTipo();

  GridviewPokemon({super.key, required this.pokemon});

  Color get capturarCor {
    int index = listaTipo.valores.indexWhere((tipo) => tipo.nome == pokemon.primeiroTipo);
    listaTipo.valores[index].cor;
    return listaTipo.valores[index].cor;
  } 

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(
            builder: (context) => PokePerfil(pokemon: pokemon),
          )
        );
      },
      child: Container(
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
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
            child: Text(pokemon.nome, 
            style: const TextStyle(
              color: Colors.white, 
              fontWeight: FontWeight.bold,
              fontSize: 20
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardTypePokemon(
                primeiroTipo: pokemon.primeiroTipo,
                segundoTipo: pokemon.segundoTipo,
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: 70,
                height: 90,
                child: ImgPokemon(url: pokemon.imagePokemon)
              ),
            ],
          ),
          ],
        ),
      ),
    );
  }
}