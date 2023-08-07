// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:list_crud_pokemon/pages/poke_perfil/components/info_pokemon.dart';
import 'package:list_crud_pokemon/pages/poke_perfil/components/percent_indicator.dart';

import '../../../models/pokemon.dart';
import 'base_stats.dart';

class AdditionalInfo extends StatelessWidget {

  final String titleFirstInfo;
  final String titleSecondtInfo;
  final Pokemon pokemon;

  const AdditionalInfo({
    Key? key,
    required this.titleFirstInfo,
    required this.titleSecondtInfo,
    required this.pokemon,
  }) : super(key: key);

  String get abilities {
    String value = "";
    for(int index = 0; index < pokemon.abilities.length; index++){
      if(index + 1 == pokemon.abilities.length) {
        value ="$value${pokemon.abilities[index].ability.capitalize()}";
      } else {
        value ="$value${pokemon.abilities[index].ability.capitalize()}, ";
      }
    }
    return value;
  }


  @override
  Widget build(BuildContext context) {

  int index = 0;
  
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40)
      ),
      child: SizedBox(
        width: double.infinity,
        height: 500,
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            body: Container(
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: TabBar(
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        unselectedLabelColor: Colors.black.withOpacity(0.3),
                        labelColor: Colors.black,
                        indicatorColor: Colors.black,
                        tabs: const[
                          Tab(
                            child: Text("Sobre"),
                          ),
                          Tab(
                            child: Text("Status Base"),
                          ),
                          Tab(
                            child: Text("Evoluções"),
                          ),
                          Tab(
                            child: Text("Ataques"),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 350,
                      child: TabBarView(
                        children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InfoPokemon(
                                  label: "Altura", 
                                  value: "${(pokemon.heigth! / 10).toStringAsFixed(2)} m"
                                ),
                                InfoPokemon(
                                  label: "Peso",
                                  value: "${(pokemon.weight)} kg", 
                                ),
                                InfoPokemon(
                                  label: "Habilidades",
                                  value: abilities
                                )
                              ],
                            ),
                          Center(
                            child: Column(
                              children: [
                                for(int index = 0; index < pokemon.baseStatsList!.length; index++)
                                Row(
                                  children: [
                                    BaseStats(
                                      label: pokemon.baseStatsList![index].name,
                                      value: pokemon.baseStatsList![index].baseStats,
                                    ),
                                    PercentIndicator(
                                      color: Colors.blue,
                                      value: pokemon.baseStatsList![index].baseStats,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                  for (int index = 0; index < pokemon.evolutionChain!.length - 1; index++)
                                    Text(pokemon.evolutionChain![index].name),      
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  for (int index = 1; index < pokemon.evolutionChain!.length; index++)
                                    Text(pokemon.evolutionChain![index].name),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Text("Sobre"),
                          ),
                        ]
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


extension MyExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}