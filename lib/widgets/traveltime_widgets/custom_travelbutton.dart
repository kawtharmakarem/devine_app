import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomTravelButton extends StatelessWidget {
  const CustomTravelButton({
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
        decoration: BoxDecoration(
            color: AppColors.black, borderRadius: BorderRadius.circular(8)),
        //width: double.infinity,
         height: width < AppConstants.maxMobileWidth ? 60 : 80,
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: AppStyles.styleRegular20(context).copyWith(
                color: AppColors.white,
                fontSize: getResponsiveFontSizeText(context,
                    fontSize: width < AppConstants.maxMobileWidth ? 20 : 32)),
          ),
        ));
  }
}
