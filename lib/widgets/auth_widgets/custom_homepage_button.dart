import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomHomePageButton extends StatelessWidget {
  const CustomHomePageButton({
    super.key,
    required this.onTap,
    required this.title,
  });
  final void Function() onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width:width<AppConstants.maxTabletWidth? width * 0.8:width*0.35,
        height:width<AppConstants.maxTabletWidth? height * 0.075:height*0.09,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.darkPrimary),
        child: Center(
            child: Text(title,
                style: AppStyles.stylePoppinsBold24(context).copyWith(
                    color: AppColors.white,
                    fontSize: getResponsiveFontSizeText(context,
                        fontSize: width < AppConstants.maxMobileWidth
                            ? 22
                            : width < AppConstants.maxTabletWidth
                                ? 28
                                : 32)))),
      ),
    );
  }
}
