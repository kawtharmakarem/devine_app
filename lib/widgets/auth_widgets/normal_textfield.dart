import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';


class NormalTextField extends StatelessWidget {
  const NormalTextField({super.key, required this.labelText, required this.prefixIcon, required this.hintText, this.controller});
final String labelText;
final Icon prefixIcon;
final String hintText;
final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: TextField(
        style: width < AppConstants.maxMobileWidth
          ? AppStyles.stylePoppinsRegular20(context)
          : AppStyles.stylePoppinsRegular20(context).copyWith(
              fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxTabletWidth? 28:32)),
        decoration: InputDecoration(
          contentPadding:const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
          prefixIcon: prefixIcon,
          prefixIconColor: AppColors.darkPrimary,
          
          labelText: labelText,
          labelStyle: AppStyles.stylePoppinsRegular20(context).copyWith(color: AppColors.darkPrimary,fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 20:width<AppConstants.maxTabletWidth? 28:32)),
        hintText: hintText,
        hintStyle: AppStyles.stylePoppinsRegular20(context).copyWith(color: AppColors.primary,fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxTabletWidth? 20:28)),
        enabledBorder:const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColors.darkPrimary
          )
        ),
        focusedBorder:const UnderlineInputBorder(
          borderSide: BorderSide(width: 2,color: AppColors.darkPrimary)
        )


        ),
      ),
    );
  }
}