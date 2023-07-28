import 'package:flutter/material.dart';

class BackgroundWhite extends StatelessWidget {

  final String titleFirstInfo;
  final String titleSecondtInfo;

  const BackgroundWhite({super.key, required this.titleFirstInfo, required this.titleSecondtInfo});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), 
            topRight: Radius.circular(40)
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titleFirstInfo, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(titleSecondtInfo, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}