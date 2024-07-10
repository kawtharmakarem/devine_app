import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class CustomSettingsTitle extends StatelessWidget {
  const CustomSettingsTitle({
    super.key, required this.title,
  });
final String title;


  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(onPressed: (){
          Get.back();
        }, icon: SvgPicture.asset(
          AppImages.leftArrow,
          width: width < AppConstants.maxMobileWidth ? 30 : 50,
          height: width < AppConstants.maxMobileWidth ? 30 : 50,
        ),),
        
    Text(
            title,
            softWrap: true,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: AppStyles.styleBold24(context).copyWith(
      color: AppColors.darkPrimary,
      fontSize: getResponsiveFontSizeText(context,
          fontSize: width < AppConstants.maxMobileWidth
              ? 30
              : width < AppConstants.maxTabletWidth
                  ? 42
                  : 46)),
          ), 
           
        const SizedBox()           
      ],
    );
  }
}