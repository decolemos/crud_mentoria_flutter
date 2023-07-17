import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/list_form.dart';
import '../components/pokemon_list_tile.dart';
import '../providers/controlador_lista.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    buscarPokemon();
  }

  Future<void> buscarPokemon() async {
    await Future.delayed(const Duration(seconds: 3));
    await Provider.of<ControladorLista>(context, listen: false).buscarPokemonViaApi();
  }


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ControladorLista>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista pokemon"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context, 
                builder: (context) => ListForm(
                  title: "Adicionar pokemon",
                  labelNome: "Nome do pokemon",
                  hintNome: "Informe o nome do pokemon",
                  labelPrimeiroTipo: "1º Tipo do pokemon",
                  hintPrimeiroTipo: "Informe o primeiro tipo do pokemon",
                  labelSegundoTipo: "2º Tipo do pokemon",
                  hintSegundoTipo: "Informe o segundo tipo do pokemon",
                  executar: (nome, primeiroTipo, segundoTipo) {
                    provider.adicionarPokemon(nome, primeiroTipo, segundoTipo);
                  },
                ),
              );
            }, 
            icon: const Icon(Icons.add)
          )
        ],
      ),
      body: provider.pokemons.isEmpty
      ? const Center(
        child: Text("Nenhum pokemon adicionado"),
      )
      : ListView.builder(
        itemCount: provider.pokemons.length,
        itemBuilder: (context, index) {
          return PokemonListTile(
            pokemon: provider.pokemons[index],
            removerPokemon: (id) {
              provider.removerPokemon(id);
            },
            editarPokemon: () => showDialog(
              context: context, 
              builder: (context) {
                return ListForm(
                  title: "Editar pokemon", 
                  labelNome: "Novo nome", 
                  hintNome: "Inform um novo nome", 
                  labelPrimeiroTipo: "Novo primeiro tipo", 
                  hintPrimeiroTipo: "Informe o novo primeiro tipo",
                  labelSegundoTipo: "Novo segundo tipo",
                  hintSegundoTipo: "Informe o novo segundo tipo",
                  executar: (nome, primeiroTipo, segundoTipo) {
                    provider.editarPokemon(provider.pokemons[index].id, nome, primeiroTipo, segundoTipo);
                  }
                );
              }
            ),

          );
        },
      ),
    );
  }
}