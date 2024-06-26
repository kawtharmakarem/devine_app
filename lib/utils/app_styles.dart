import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'tarot_constants.dart';

abstract class AppStyles{
  static TextStyle styleBold24(BuildContext context){
    return TextStyle(
      fontFamily: 'Inter',
      color: AppColors.black,
      fontSize: getResponsiveFontSizeText(context, fontSize: 24),
      fontWeight: FontWeight.w700

    );
  }

   static TextStyle styleBold32(BuildContext context){
    return TextStyle(
      fontFamily: 'Inter',
      color: AppColors.darkPrimary,
      fontSize: getResponsiveFontSizeText(context, fontSize: 32),
      fontWeight: FontWeight.w700

    );
  }

  static TextStyle styleRegular20(BuildContext context){
    return TextStyle(
      fontFamily: 'Inter',
      color: AppColors.black,
      fontSize: getResponsiveFontSizeText(context, fontSize: 20),
      fontWeight: FontWeight.w400

    );
  }

  static TextStyle stylePacificoRegular28(BuildContext context){
    return TextStyle(
      fontFamily: 'Pacifico',
      color: AppColors.black,fontSize: getResponsiveFontSizeText(context, fontSize: 28),
      fontWeight: FontWeight.w400
    );
  }
  static TextStyle styleRufinaBold32(BuildContext context){
    return TextStyle(
      fontFamily: 'Rufina',
      color: AppColors.black,fontSize: getResponsiveFontSizeText(context, fontSize: 32),
      fontWeight: FontWeight.w700
    );

  }
  static TextStyle stylePoppinsRegular20(BuildContext context){
    return TextStyle(
      fontFamily: 'Poppins',
      color: AppColors.black,
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFontSizeText(context, fontSize: 20)
    );
  }
  static TextStyle stylePoppinsBold24(BuildContext context){
    return TextStyle(
      fontFamily: 'Poppins',
      color: AppColors.black,
      fontWeight: FontWeight.w700,
      fontSize: getResponsiveFontSizeText(context, fontSize: 24)
    );
  }

  //tarot
  static TextStyle styleRegular16(BuildContext context){
    return TextStyle(
      fontFamily: 'Inter',
      color: AppColors.black,
      fontSize: getResponsiveFontSizeTextTarot(context, fontSize: 16),
      fontWeight: FontWeight.w400

    );
  }
  static TextStyle styleBold20(BuildContext context){
    return TextStyle(
      fontFamily: 'Inter',
      color: AppColors.black,
      fontSize: getResponsiveFontSizeTextTarot(context, fontSize: 20),
      fontWeight: FontWeight.w700

    );
  }
  static TextStyle styleRegular28(BuildContext context){
  return TextStyle(
    fontFamily: 'Inter',
  fontWeight: FontWeight.normal,
  color: AppColors.purple,
  fontSize: getResponsiveFontSizeTextTarot(context, fontSize: 28)  //28
  );
 
}

 static TextStyle stylePoppinsSemiBold32(BuildContext context){
  return TextStyle(
    fontFamily: 'Poppins',
  fontWeight: FontWeight.w600,
  color: AppColors.purple,
  fontSize: getResponsiveFontSizeTextTarot(context, fontSize: 32) //32
  );


 
}
static TextStyle styleSemiBold24(BuildContext context){
  return TextStyle(
    fontFamily: 'Inter',
  fontWeight: FontWeight.w600,
  color: AppColors.purple,
  fontSize: getResponsiveFontSizeTextTarot(context, fontSize: 24)
  );


 
}
static TextStyle styleRegular18(BuildContext context){
   return TextStyle(
    fontFamily: 'Inter',
  fontWeight: FontWeight.w400,
  color: AppColors.purple,
  fontSize: getResponsiveFontSizeTextTarot(context, fontSize: 18)
  );
}

static TextStyle styleRegular26(BuildContext context){
   return TextStyle(
    fontFamily: 'Inter',
  fontWeight: FontWeight.w400,
  color: AppColors.purple,
  fontSize: getResponsiveFontSizeTextTarot(context, fontSize: 26)
  );
}
static TextStyle styleLight12(BuildContext context){
   return TextStyle(
    fontFamily: 'Inter',
  fontWeight: FontWeight.w300,
  color: AppColors.purple,
  fontSize: getResponsiveFontSizeTextTarot(context, fontSize: 12)
  );
}


static TextStyle styleMedium16(BuildContext context){
   return TextStyle(
    fontFamily: 'Inter',
  fontWeight: FontWeight.w500,
  color: AppColors.purple,
  fontSize: getResponsiveFontSizeText(context, fontSize: 16)
  );
}

}


double getResponsiveFontSizeText(BuildContext context,{required double fontSize}){
  double scaleFactor=getScaleFactor(context);
  double responsiveFontSize=fontSize*scaleFactor;
  double lowerLimit=fontSize*0.8;
  double upperLimit=fontSize*1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context){
  double width=MediaQuery.sizeOf(context).width;
  if(width<TarotAppConstants.mobileMaxWidth){
    return width/400;
  }else if(width<TarotAppConstants.tabletMaxWidth){
    return width/700;
  }else{
    return width/1000;
  }


  
}
  //functions tarot

double getResponsiveFontSizeTextTarot(BuildContext context,
      {required double fontSize}) {
    double scaleFactor = getScaleFactorTarot(context);
    double responsiveFontSize=fontSize*scaleFactor;
//     double lowerLimit=fontSize*0.8;
//   double upperLimit=fontSize*1.2;
//  return responsiveFontSize.clamp(lowerLimit, upperLimit);
return responsiveFontSize;
  }

  double getScaleFactorTarot(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    if (width < TarotAppConstants.mobileMaxWidth) {
      return width / 700;  //400
    } else if (width < TarotAppConstants.tabletMaxWidth) {
      return width / 1500;  //700
    } else {
     return width / 1000;  //1000
    }
  }