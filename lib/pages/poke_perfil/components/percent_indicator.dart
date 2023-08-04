import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PercentIndicator extends StatelessWidget {

  final Color color;
  final int value;

  const PercentIndicator({super.key, required this.color, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               LinearPercentIndicator(
                 barRadius: const Radius.circular(10),
                 padding: EdgeInsets.zero,
                 width: MediaQuery.of(context).size.width - 230,
                 lineHeight: 8.0,
                 percent: (value * 100 / 255) / 100,
                 progressColor: color,
               ),
            ],
          )
        ),
      ],
    );
  }
}