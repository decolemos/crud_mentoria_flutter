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
      padding: const EdgeInsets.only(top: 10.0, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Container(
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
          ),
          const SizedBox(
            width: 5,
            height: 5,
          ),
          if(segundoTipo != null)
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
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
          ),
        ],
      ),
    );
  }
}