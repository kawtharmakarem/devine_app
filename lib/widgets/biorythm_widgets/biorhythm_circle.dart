import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class IndicatorCircle extends StatelessWidget {
  final String label;
  final int value;
  final Color color;

  IndicatorCircle({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        CircleAvatar(
          radius: width < AppConstants.maxMobileWidth ? 24 : 40,
          backgroundColor: color,
          child: Text(
            '$value',
            style: width < AppConstants.maxTabletWidth
                ? AppStyles.styleRegular20(context)
                    .copyWith(color: AppColors.white)
                : AppStyles.styleRegular28(context)
                    .copyWith(color: AppColors.white),
          ),
        ),
        const SizedBox(height: 8),
        Text(label,
            style: width < AppConstants.maxMobileWidth
                ? AppStyles.styleRegular20(context).copyWith(fontSize: 16)
                : AppStyles.styleRegular28(context).copyWith(
                    color: AppColors.black,
                    fontSize:
                        getResponsiveFontSizeText(context, fontSize: 30))),
      ],
    );
  }
}
