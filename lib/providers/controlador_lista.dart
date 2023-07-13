import 'dart:math';

import 'package:flutter/material.dart';

import '../models/pokemon.dart';

class ControladorLista extends ChangeNotifier {

  final List<Pokemon> _pokemons = [];

  List<Pokemon> get pokemons => _pokemons;

  void adicionarPokemon(String nome, String tipo) {
    _pokemons.add(Pokemon(id: Random().nextInt(999), nome: nome, tipo: tipo));
    notifyListeners();
  }

  void editarPokemon(int id, String novoNome, String novoTipo) {
    int index = _pokemons.indexWhere((pokemon) => pokemon.id == id);
    _pokemons[index].nome = novoNome;
    _pokemons[index].tipo = novoTipo;
    notifyListeners();
  }

  void removerPokemon(int id) {
    int index = _pokemons.indexWhere((pokemon) => pokemon.id == id);
    _pokemons.removeAt(index);
    notifyListeners();
  }

}