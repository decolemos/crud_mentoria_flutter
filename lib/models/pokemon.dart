// ignore_for_file: public_member_api_docs, sort_constructors_first
class Pokemon {
  String id;
  String nome;
  String primeiroTipo;
  String? segundoTipo;
  String? imagePokemon;
  Pokemon({
    required this.id,
    required this.nome,
    required this.primeiroTipo,
    this.segundoTipo,
    this.imagePokemon,
  });
}
