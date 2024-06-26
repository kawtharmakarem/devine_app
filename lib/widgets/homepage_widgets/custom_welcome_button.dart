import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class CustomWelcomeButton extends StatelessWidget {
  const CustomWelcomeButton({
    super.key, required this.title, required this.onPressed,
  });
 final String title;
final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    double height=MediaQuery.sizeOf(context).height;
    return Container(
      width: double.maxFinite,
      height:width<AppConstants.maxTabletWidth? height*0.08 :height*0.1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          //
          color: AppColors.darkPrimary),
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: width < AppConstants.maxMobileWidth
                ? AppStyles.styleRufinaBold32(context)
                    .copyWith(color: AppColors.white)
                : AppStyles.styleRufinaBold32(context)
                    .copyWith(
                      color: AppColors.white,
                        fontSize: getResponsiveFontSizeText(
                            context,
                            fontSize: 40)),
          )),
    );
  }
}

