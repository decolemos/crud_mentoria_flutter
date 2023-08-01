// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ImgPokemon extends StatelessWidget {

  final String? url;

  const ImgPokemon({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Image.network(url ?? "",
        width: 70,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const Center(child: Text("Not Found")),
      ),      
    );
  }
}
