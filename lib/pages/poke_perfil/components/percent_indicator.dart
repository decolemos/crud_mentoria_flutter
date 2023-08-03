import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PercentIndicator extends StatelessWidget {
  const PercentIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Row(
                 children: [
                  const SizedBox(
                    width: 80,
                    child: Text("HP")
                  ),
                  const SizedBox(
                    width: 50,
                    child: Text("45")
                  ),
                  LinearPercentIndicator(
                    barRadius: const Radius.circular(10),
                    padding: EdgeInsets.zero,
                    width: MediaQuery.of(context).size.width - 190,
                    lineHeight: 8.0,
                    percent: 0.45,
                    progressColor: Colors.red,
                  )
                 ],
               ),
            ],
          )
        ),
      ],
    );
  }
}