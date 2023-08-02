// ignore_for_file: public_member_api_docs, sort_constructors_first
class Pokemon {
  String id;
  String nome;
  String primeiroTipo;
  String? segundoTipo;
  String? imagePokemon;
  int? heigth;
  int? weight;
  String? abilities;
  String? hiddenAbilities;
  
  Pokemon({
    required this.id,
    required this.nome,
    required this.primeiroTipo,
    this.segundoTipo,
    this.imagePokemon,
    this.heigth,
    this.weight,
    this.abilities,
    this.hiddenAbilities
  });
}
