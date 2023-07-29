import 'package:flutter/material.dart';

class CardTypePokemon extends StatelessWidget {

  final String primeiroTipo;
  final String? segundoTipo;

  const CardTypePokemon({
    super.key, required this.primeiroTipo, this.segundoTipo, 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            child: Center(
              child: Text(
                primeiroTipo, 
                style: const TextStyle(
                  color: Colors.white, 
                  fontWeight: FontWeight.bold
                ),
              )
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          if(segundoTipo != null)
          Container(
            padding: const EdgeInsets.only(left: 5, right: 5),
            width: 70,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.black.withOpacity(0.2),
            ),
            child: Center(
              child: Text(
                segundoTipo ?? "", 
                style: const TextStyle(
                  color: Colors.white, 
                  fontWeight: FontWeight.bold
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}