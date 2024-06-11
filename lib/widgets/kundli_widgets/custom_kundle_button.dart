import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomKundleButton extends StatelessWidget {
  const CustomKundleButton(
      {super.key, required this.onPressed, required this.title});
  final void Function() onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding:width<AppConstants.maxMobileWidth? const EdgeInsets.symmetric(horizontal: 30, vertical: 10):const EdgeInsets.symmetric(horizontal: 80,vertical: 20),
        backgroundColor: AppColors.darkPrimary,
      ),
      child: Text(
        title,
        style: AppStyles.styleBold24(context).copyWith(
            color: AppColors.white,
            fontSize: getResponsiveFontSizeText(context,
                fontSize: width < AppConstants.maxMobileWidth ? 20 : 32)),
      ),
    );
  }
}
