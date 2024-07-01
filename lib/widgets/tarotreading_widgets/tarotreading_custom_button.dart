import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTarotButton extends StatelessWidget {
  const CustomTarotButton({super.key, required this.title, required this.onPressed});
  final String title;
  final void Function() onPressed;


  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    double height=MediaQuery.sizeOf(context).height;
    return   SizedBox(
              width:width<AppConstants.maxTabletWidth? width*0.5:width*0.2,
              height:width<AppConstants.maxTabletWidth? height*0.05:height*0.1,
              child: ElevatedButton(
                  onPressed: onPressed,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(AppColors.darkPrimary),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: const BorderSide(color: AppColors.darkPrimary)
                    )),
                  ),
                  child:  Text(
                    'Next',
                    style: AppStyles.styleBold20(context).copyWith(color: AppColors.white,fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 24:32)),
                  ),
                  ),
            );
  }
}