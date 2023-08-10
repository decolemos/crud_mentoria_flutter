import 'package:flutter/material.dart';
import 'package:list_crud_pokemon/models/pokemon.dart';
import 'package:provider/provider.dart';
import '../components/card_pokemon.dart';
import '../components/list_form.dart';
import '../providers/controlador_lista.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    buscarPokemon();
  }

  Future<void> buscarPokemon() async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    await Provider.of<ControladorLista>(context, listen: false).buscarPokemonViaApi();

    setState(() {
      isLoading = false;
    });
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
                  executar: (nome, primeiroTipo, segundoTipo) {
                    provider.adicionarPokemonFirebase(nome, primeiroTipo, segundoTipo);
                  }, 
                ),
              );
            }, 
            icon: const Icon(Icons.add)
          )
        ],
      ),
      body: isLoading == true
      ? const Center(
        child: CircularProgressIndicator(),
      )
      : provider.pokemons.isEmpty
      ? const Center(
        child: Text("Nenhum pokemon adicionado"),
      )
      : GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 15,
          childAspectRatio: 1.3
        ),
        itemCount: provider.pokemons.length, 
        itemBuilder: (context, index) {
          return GridviewPokemon(
            pokemon: provider.pokemons[index],
          );
        },
      ),
    );
  }
}
