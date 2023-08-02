// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:list_crud_pokemon/models/abilitie_pokemon.dart';

class Pokemon {
  String id;
  String nome;
  String primeiroTipo;
  String? segundoTipo;
  String? imagePokemon;
  int? heigth;
  int? weight;
  List<AbilitiePokemon> abilities;
  
  Pokemon({
    required this.id,
    required this.nome,
    required this.primeiroTipo,
    this.segundoTipo,
    this.imagePokemon,
    this.heigth,
    this.weight,
    required this.abilities,
  });
}
