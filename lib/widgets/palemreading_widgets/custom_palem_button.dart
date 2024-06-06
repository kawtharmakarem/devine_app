import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class CustomPalemButton extends StatelessWidget {
  const CustomPalemButton({super.key, required this.onPressed, required this.title});
  final void Function() onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width:width<AppConstants.maxMobileWidth? width*0.5:width<AppConstants.maxTabletWidth? width*0.4:width*0.3,
      height:width<AppConstants.maxMobileWidth? 40:80,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8))),
        child: Text(
          title,
          style: width < AppConstants.maxMobileWidth
              ? AppStyles.styleBold24(context)
                  .copyWith(color: AppColors.black)
              : AppStyles.styleBold24(context).copyWith(
                  color: AppColors.black,
                  fontSize: getResponsiveFontSizeText(context, fontSize: 32)),
        ),
      ),
    );
  }
}
