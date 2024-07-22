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
    return Center(
      child: Container(
        //height: width < AppConstants.maxMobileWidth ? 35 : 65,
        width: width < AppConstants.maxMobileWidth ? width/2 : 300,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.white,
                foregroundColor: AppColors.darkPrimary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    )),
            child: Text(
              title,
              style: width < AppConstants.maxMobileWidth
                  ? AppStyles.styleRegular20(context).copyWith(fontWeight: FontWeight.w800,
                      fontSize: getResponsiveFontSizeText(context, fontSize: 18),
                      color: AppColors.darkPrimary)
                  : AppStyles.styleRegular20(context).copyWith(
                      fontSize: getResponsiveFontSizeText(context, fontSize: 30)),
            )),
      ),
    );
  }
}
