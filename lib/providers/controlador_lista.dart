import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import 'package:http/http.dart' as http;

class ControladorLista extends ChangeNotifier {

  List<Pokemon> _pokemons = [];

  List<Pokemon> get pokemons => _pokemons;

  final String url = "https://crudpokemonfirebase-default-rtdb.firebaseio.com/";

  Future<void> buscarPokemonViaApi() async {
    final response = await http.get(Uri.parse("$url/pokemons.json"));
    final jsonResponse = jsonDecode(response.body);

    List<Pokemon> lista = [];

    if(jsonResponse == null) return;

    for(final key in jsonResponse.keys) {
      print(key);
      print(jsonResponse[key]["nome"]);
      print(jsonResponse[key]["tipo"]);
      lista.add(Pokemon(id: key, nome: jsonResponse[key]["nome"], tipo: jsonResponse[key]["tipo"]));
    }

    _pokemons = lista;
    notifyListeners();
  }

  void adicionarPokemon(String nome, String tipo) {
    _pokemons.add(Pokemon(id: "", nome: nome, tipo: tipo));
    notifyListeners();
  }

  void editarPokemon(String id, String novoNome, String novoTipo) {
    int index = _pokemons.indexWhere((pokemon) => pokemon.id == id);
    _pokemons[index].nome = novoNome;
    _pokemons[index].tipo = novoTipo;
    notifyListeners();

  }

  
  void removerPokemon(String id) {
    print("xereca");
    print(id);
    int index = _pokemons.indexWhere((pokemon) => pokemon.id == id);
    _pokemons.removeAt(index);
    notifyListeners();
  }

}