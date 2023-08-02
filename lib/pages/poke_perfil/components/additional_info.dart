import 'package:flutter/material.dart';
import 'package:list_crud_pokemon/models/abilitie_pokemon.dart';
import 'package:list_crud_pokemon/pages/poke_perfil/components/info_pokemon.dart';

import '../../../models/pokemon.dart';

class AdditionalInfo extends StatelessWidget {

  final String titleFirstInfo;
  final String titleSecondtInfo;
  final Pokemon pokemon;

  const AdditionalInfo({super.key, 
    required this.titleFirstInfo, 
    required this.titleSecondtInfo, 
    required this.pokemon, 
  });

  @override
  Widget build(BuildContext context) {
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
                                  label: "Altura: ", 
                                  value: "${(pokemon.heigth! / 10).toStringAsFixed(2)} m"
                                ),
                                InfoPokemon(
                                  label: "Peso: ",
                                  value: "${(pokemon.weight)} kg", 
                                ),
                                const Text(
                                  "Habilidades:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                for (AbilitiePokemon name in pokemon.abilities)
                                  InfoPokemon(
                                    label: "-",
                                    value: name.ability,
                                  ),
                                // pokemon.abilities.length < 2 
                                // ? InfoPokemon(
                                //   label: "Habilidades: ",
                                //   value: pokemon.abilities[0].ability
                                // )
                                // : InfoPokemon(
                                //   label: "Habilidades: ",
                                //   value: "${pokemon.abilities[0].ability} / ${pokemon.abilities[1].ability}", 
                                // ),
                              ],
                            ),
                          const Center(
                            child: Text("Sobre"),
                          ),
                          Center(
                            child: Text("Sobre"),
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