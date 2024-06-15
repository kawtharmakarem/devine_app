import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class CustomShoppingButton extends StatelessWidget {
  const CustomShoppingButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.color = Colors.purple,
      this.textColor = Colors.white});
  final String title;
  final void Function() onTap;
  final Color? color;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    return width<AppConstants.maxMobileWidth?getMobileButtonContent(width, context): getTabletButtonContent(width, context);
  }

  InkWell getMobileButtonContent(double width, BuildContext context) {
    return InkWell(
    splashColor: AppColors.white,
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      child: Text(
        title,
        style:AppStyles.styleBold24(context).copyWith(
            fontSize: getResponsiveFontSizeText(context, fontSize: 20),
            color: textColor)
      ),
    ),
  );
  }

  InkWell getTabletButtonContent(double width, BuildContext context) {
    return InkWell(
      
    splashColor: AppColors.primary,
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 1, color: AppColors.black),
        color: color,
      ),
      child: Text(
        title,
        style:width<AppConstants.maxTabletWidth? AppStyles.styleBold24(context).copyWith(
            fontSize: getResponsiveFontSizeText(context, fontSize: 26),
            color: textColor):AppStyles.styleBold32(context).copyWith(color: textColor),
      ),
    ),
  );
  }
}
