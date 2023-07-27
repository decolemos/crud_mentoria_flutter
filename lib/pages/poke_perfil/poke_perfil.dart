import 'package:flutter/material.dart';

class PokePerfil extends StatelessWidget {
  const PokePerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8D030),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Pikachu", 
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 40, 
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.black.withOpacity(0.2),
                    ),
                    child: const Center(
                      child: Text("Eletrico", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    width: 70,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                ],
              ),
            ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 100 * 60,
            child: Image.network("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png")),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), 
                  topRight: Radius.circular(40)
                ),
                color: Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sobre", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text("Especie:"),
                        Text("Roedor"),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Altura:"),
                        Text("(1,20 cm)"),
                      ],
                    ),
                    Text("Peso:"),
                    Text("Abilidades:"),
                     SizedBox(
                      height: 30,
                    ),
                    Text("Reprodução", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Abilidades:"),
                    Text("Abilidades:"),
                    Text("Abilidades:"),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}