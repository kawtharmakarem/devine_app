import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.title});
  final void Function() onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: Text(
            title,
            style: width < AppConstants.maxMobileWidth
                ? AppStyles.styleRegular20(context)
                    .copyWith(color: AppColors.white)
                : AppStyles.styleRegular20(context).copyWith(
                    color: AppColors.white,
                    fontSize: getResponsiveFontSizeText(context, fontSize: 32)),
          ),
        ),
      ],
    );
  }
}
