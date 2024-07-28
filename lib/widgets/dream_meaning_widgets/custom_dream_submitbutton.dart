import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomDreamSubmitButton extends StatelessWidget {
  const CustomDreamSubmitButton({super.key, required this.title, this.textColor, this.color, required this.onPressed, this.iconData});
  final String title;
  final Color? textColor;
  final Color? color;
  final VoidCallback onPressed;
  final IconData? iconData;


  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    return Container(
      width: width*0.3,
      height:width<AppConstants.maxMobileWidth? 40:60,
      decoration: BoxDecoration(
        color:color ?? AppColors.darkPrimary,
        borderRadius: BorderRadius.circular(8),
      border: Border.all(width: 2,color: AppColors.darkPrimary)

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(iconData,size: 15,color: textColor ?? AppColors.white,),
          TextButton(onPressed: onPressed,child: Text(title,style: AppStyles.styleRegular20(context) .copyWith(color: textColor ?? AppColors.white,fontWeight: FontWeight.w600,fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 18:28)),),),
        ],
      ),
    );
  }
}