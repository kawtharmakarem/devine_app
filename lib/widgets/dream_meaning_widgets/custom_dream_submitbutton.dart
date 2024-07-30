import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomDreamSubmitButton extends StatelessWidget {
  const CustomDreamSubmitButton({super.key, required this.title, required this.onPressed, this.iconData});
  final String title;
  final VoidCallback onPressed;
  final IconData? iconData;


  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    return Container(
      width:width<AppConstants.maxTabletWidth? width*0.3:width*0.2,
      height:width<AppConstants.maxMobileWidth? 40:60,
      decoration: BoxDecoration(
        color: AppColors.darkPrimary,
        borderRadius: BorderRadius.circular(8),
      border: Border.all(width: 2,color: AppColors.darkPrimary)

      ),
      child: TextButton(onPressed: onPressed,child: Text(title,style: AppStyles.styleRegular20(context) .copyWith(color:  AppColors.white,fontWeight: FontWeight.w600,fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 18:28)),),),
    );
  }
}