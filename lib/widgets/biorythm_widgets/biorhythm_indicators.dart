import 'package:divinecontrol/utils/app_colors.dart';
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
          color: AppColors.red,
        ),
        IndicatorCircle(
          label: 'Emotional',
          value: 78,
          color: AppColors.blue,
        ),
        IndicatorCircle(
          label: 'Intellectual',
          value: 43,
          color: AppColors.green,
        ),
        IndicatorCircle(
          label: 'Spiritual',
          value: 51,
          color: AppColors.yello,
        ),
      ],
    );
  }
}
