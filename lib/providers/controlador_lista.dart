import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:list_crud_pokemon/models/abilitie_pokemon.dart';
import '../models/pokemon.dart';
import 'package:http/http.dart' as http;

class ControladorLista extends ChangeNotifier {

  final List<Pokemon> _pokemons = [];

  List<Pokemon> get pokemons => _pokemons;

  final String url = "https://crudpokemonfirebase-default-rtdb.firebaseio.com";
  final String urlPokeApi = "https://pokeapi.co/api/v2/pokemon";

  Future<void> buscarPokemonViaApi() async {
    try {
      final response = await http.get(Uri.parse("$url/pokemons.json"));
      final jsonResponse = jsonDecode(response.body);

      if(jsonResponse == null) return;

      for(final key in jsonResponse.keys) {
        await adicionarPokemonLista(Pokemon(
          id: key, 
          nome: jsonResponse[key]["nome"],
          primeiroTipo: jsonResponse[key]["primeiroTipo"], 
          segundoTipo: jsonResponse[key]["segundoTipo"],
          abilities: []
          )
        );
      }

      notifyListeners();

    } catch (e) {
      log(e.toString());
    }
  }

  bool verificarSeNomeExiste(String nome) {
    int index = _pokemons.indexWhere((pokemon) => pokemon.nome.toLowerCase() == nome.toLowerCase());
    return index != -1;
  }

  Future<void> adicionarPokemonFirebase(String nome, String primeiroTipo, String? segundoTipo) async {
    print(segundoTipo == null);

    bool pokemonExiste = verificarSeNomeExiste(nome);

    if(pokemonExiste){
      log("Pokemon já existe na lista");
      return;
    } 

    try {
      final response = await http.post(
        Uri.parse("$url/pokemons.json"), 
        body: jsonEncode({
          "nome": nome,
          "primeiroTipo": primeiroTipo,
          "segundoTipo": segundoTipo
        })
      );

      log(response.body.toString());

      final jsonResponse = jsonDecode(response.body);
      await adicionarPokemonLista(Pokemon(
        id: jsonResponse["name"], 
        nome: nome, 
        primeiroTipo: primeiroTipo, 
        segundoTipo: segundoTipo,
        abilities: []
        )
      );
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> adicionarPokemonLista(Pokemon pokemon) async {

    try {
      final response = await http.get(
        Uri.parse("$urlPokeApi/${pokemon.nome.toLowerCase()}"));
      final jsonResponse = jsonDecode(response.body);

      for(int index = 0; index < jsonResponse["abilities"].length; index++){
      pokemon.abilities.add(
        AbilitiePokemon(
          ability: (jsonResponse["abilities"][index]["ability"]["name"]), 
          isHidden: (jsonResponse["abilities"][index]["is_hidden"]),
          )
        );
      }
      pokemon.heigth = jsonResponse["height"];
      pokemon.weight = jsonResponse["weight"];
      pokemon.imagePokemon = 
        jsonResponse["sprites"]["other"]["official-artwork"]["front_default"];

    } catch (e) {
      log(e.toString());
    }
    _pokemons.add(pokemon);
  }
  

  Future<void> editarPokemon(
    String id, 
    String novoNome, 
    String novoPrimeiroTipo, 
    String? novoSegundoTipo
    ) async {




    final response = await http.put(
      Uri.parse("$url/pokemons/$id.json"), 
      body: jsonEncode(
        {
          "nome": novoNome,
          "primeiroTipo": novoPrimeiroTipo,
          "segundoTipo": novoSegundoTipo
        }
      ) 
    );
    
    final responseImagem = await http.get(Uri.parse("$urlPokeApi/${novoNome.toLowerCase()}"));
    final jsonResponse = jsonDecode(responseImagem.body);
    final String novoImagemPokemon = jsonResponse["sprites"]["front_default"];

    jsonDecode(response.body);
    int index = _pokemons.indexWhere((pokemon) => pokemon.id == id);
    _pokemons[index].nome = novoNome;
    _pokemons[index].primeiroTipo = novoPrimeiroTipo;
    _pokemons[index].segundoTipo = novoSegundoTipo;  
    _pokemons[index].imagePokemon = novoImagemPokemon;
    notifyListeners();

  }

  
  Future<void> removerPokemon(String id) async {
    await http.delete(Uri.parse("$url/pokemons/$id.json"));
    int index = _pokemons.indexWhere((pokemon) => pokemon.id == id);
    _pokemons.removeAt(index);
    notifyListeners();
  }

}