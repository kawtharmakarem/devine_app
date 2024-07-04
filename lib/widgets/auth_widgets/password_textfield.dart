import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';


class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, required this.labelText, required this.hintText, this.controller});
final  String labelText;
 final String hintText;
 final TextEditingController? controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool veiwPass=false;
 
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: TextField(
        cursorColor:AppColors.darkPrimary,
        obscureText: veiwPass? false:true,
        style:  width < AppConstants.maxMobileWidth
          ? AppStyles.stylePoppinsRegular20(context)
          : AppStyles.stylePoppinsRegular20(context).copyWith(
              fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxTabletWidth? 28:32)),
        decoration: InputDecoration(
          contentPadding:const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
          prefixIcon: Icon(Icons.security,color: AppColors.darkPrimary,size: width<AppConstants.maxMobileWidth?30:width<AppConstants.maxTabletWidth?50: 40,),
          labelText:widget. labelText,
          labelStyle: AppStyles.stylePoppinsRegular20(context).copyWith(color: AppColors.darkPrimary,fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 20:width<AppConstants.maxTabletWidth? 28:32)),
        
        suffixIcon: IconButton(onPressed: (){
          setState(() {
            veiwPass=!veiwPass;
          });
        },
         icon: veiwPass? Icon(Icons.visibility_off,color: AppColors.darkPrimary,size: width<AppConstants.maxMobileWidth?30:width<AppConstants.maxTabletWidth? 50:40,):Icon(Icons.visibility,color: AppColors.darkPrimary,size: width<AppConstants.maxMobileWidth?30:width<AppConstants.maxTabletWidth? 50:40,)),
        hintText:widget. hintText,
        hintStyle: AppStyles.stylePoppinsRegular20(context).copyWith(color: AppColors.primary,fontSize: getResponsiveFontSizeText(context, fontSize: width<AppConstants.maxTabletWidth?20:28)),
        enabledBorder:const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color:AppColors.darkPrimary
          )
        ),
        focusedBorder:const UnderlineInputBorder(
          borderSide: BorderSide(width: 2,color:AppColors.darkPrimary)
        )


        ),
      ),
    );
  }
}