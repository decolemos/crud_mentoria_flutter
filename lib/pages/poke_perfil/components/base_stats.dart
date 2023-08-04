import 'package:flutter/material.dart';

class BaseStats extends StatelessWidget {

  final String label;
  final int value;


  const BaseStats({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 120,
          child: Text("$label: "),
        ),
        SizedBox(
          width: 50,
          child: Text(value.toString())
        ),
      ]
    );
  }
}

