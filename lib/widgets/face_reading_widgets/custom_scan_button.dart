import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomScanButton extends StatelessWidget {
  const CustomScanButton({
    super.key,
    required this.onPressed,
    required this.title,
  });
  final void Function() onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      height: width < AppConstants.maxMobileWidth ? 35 : 65,
      width: width < AppConstants.maxMobileWidth ? 130 : 300,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.white,
              foregroundColor: AppColors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: Text(
            title,
            style: width < AppConstants.maxMobileWidth
                ? AppStyles.styleMedium16(context).copyWith(
                    fontSize: getResponsiveFontSizeText(context, fontSize: 24),
                    color: AppColors.black)
                : AppStyles.styleBold24(context).copyWith(
                    fontSize: getResponsiveFontSizeText(context, fontSize: 30)),
          )),
    );
  }
}
