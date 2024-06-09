import 'package:flutter/material.dart';

import 'biorhythm_circle.dart';

class BiorhythmIndicators extends StatelessWidget {
  const BiorhythmIndicators({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IndicatorCircle(
          label: 'Physical',
          value: 29,
          color: Colors.green,
        ),
        IndicatorCircle(
          label: 'Emotional',
          value: 78,
          color: Colors.red,
        ),
        IndicatorCircle(
          label: 'Spiritual',
          value: 43,
          color: Colors.orange,
        ),
        IndicatorCircle(
          label: 'Intellectual',
          value: 51,
          color: Colors.blue,
        ),
      ],
    );
  }
}
