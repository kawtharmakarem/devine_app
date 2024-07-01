import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, required this.labelText, required this.prefixIcon, required this.hintText,  this.controller, required this.onChanged});
final String labelText;
final Icon prefixIcon;
final String hintText;
final void Function(String) onChanged;
final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    return TextField(
      
      controller: controller,
      style: width < AppConstants.maxMobileWidth
        ? AppStyles.stylePoppinsRegular20(context)
        : AppStyles.stylePoppinsRegular20(context).copyWith(
            fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxTabletWidth? 28:32)),
      decoration: InputDecoration(
        contentPadding:width<AppConstants.maxMobileWidth? const EdgeInsets.symmetric(horizontal: 5,vertical: 5):const EdgeInsets.symmetric(horizontal: 5,vertical: 15),
        prefixIcon: prefixIcon,
         floatingLabelBehavior: FloatingLabelBehavior.always,
            
            label: Container(
                margin:const EdgeInsets.all(0),child: Text(labelText),),
        labelStyle: AppStyles.stylePoppinsRegular20(context).copyWith(color: AppColors.darkPrimary,fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 20:32)),
      hintText: hintText,
      hintStyle: AppStyles.stylePoppinsRegular20(context).copyWith(color: AppColors.primary,fontSize: getResponsiveFontSizeText(context, fontSize: width<AppConstants.maxMobileWidth?20:24)),
      enabledBorder: OutlineInputBorder(
        gapPadding: 0,
        borderRadius: BorderRadius.circular(20),
        borderSide:const BorderSide(
          width: 2,
          color: AppColors.darkPrimary
        )
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide:const BorderSide(width: 2,color: AppColors.darkPrimary)
      )
    
    
      ),
      onChanged:  onChanged,
    );
  }

  
}