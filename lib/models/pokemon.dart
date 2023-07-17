class Pokemon {
  String id;
  String nome;
  String primeiroTipo;
  String? segundoTipo;
  Pokemon({
    required this.id,
    required this.nome,
    required this.primeiroTipo,
    this.segundoTipo
  });
}
