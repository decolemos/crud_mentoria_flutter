import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import 'package:http/http.dart' as http;

class ControladorLista extends ChangeNotifier {

  List<Pokemon> _pokemons = [];

  List<Pokemon> get pokemons => _pokemons;

  final String url = "https://crudpokemonfirebase-default-rtdb.firebaseio.com";

  Future<void> buscarPokemonViaApi() async {
    final response = await http.get(Uri.parse("$url/pokemons.json"));
    final jsonResponse = jsonDecode(response.body);

    List<Pokemon> lista = [];

    if(jsonResponse == null) return;

    for(final key in jsonResponse.keys) {
      // print(key);
      // print(jsonResponse[key]["nome"]);
      // print(jsonResponse[key]["tipo"]);
      lista.add(Pokemon(id: key, nome: jsonResponse[key]["nome"], tipo: jsonResponse[key]["tipo"]));
    }

    _pokemons = lista;
    notifyListeners();
  }

  bool verificarSeNomeExiste(String nome) {
    int index = _pokemons.indexWhere((pokemon) => pokemon.nome.toLowerCase() == nome.toLowerCase());
    return index != -1;
  }

  Future<void> adicionarPokemon(String nome, String tipo) async {

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
          "tipo": tipo
        })
      );

      log(response.body.toString());

      final jsonResponse = jsonDecode(response.body);
      _pokemons.add(Pokemon(id: jsonResponse["name"], nome: nome, tipo: tipo));
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> editarPokemon(String id, String novoNome, String novoTipo) async {
    final response = await http.put(
      Uri.parse("$url/pokemons/$id.json"), 
      body: jsonEncode(
        {
          "nome": novoNome,
          "tipo": novoTipo
        }
      ) 
    );

    jsonDecode(response.body);
    int index = _pokemons.indexWhere((pokemon) => pokemon.id == id);
    _pokemons[index].nome = novoNome;
    _pokemons[index].tipo = novoTipo;
    notifyListeners();

  }

  
  Future<void> removerPokemon(String id) async {
    await http.delete(Uri.parse("$url/pokemons/$id.json"));
    int index = _pokemons.indexWhere((pokemon) => pokemon.id == id);
    _pokemons.removeAt(index);
    notifyListeners();
  }

}