import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class CustomNumerlogyCard extends StatelessWidget {
  const CustomNumerlogyCard({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    double height=MediaQuery.sizeOf(context).height;
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.maxFinite,
              height:width<AppConstants.maxMobileWidth? height*0.2:height*0.3,
              child: Image.asset(AppImages.numerlogy,fit: BoxFit.fill,)),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Text(
                'Life Path Number (ClickHere)',
                style:width<AppConstants.maxMobileWidth? AppStyles.styleMedium16(context).copyWith(
                    color: AppColors.black,
                    fontSize: getResponsiveFontSizeText(context, fontSize: 24)):AppStyles.styleMedium16(context).copyWith(
                    color: AppColors.black,
                    fontSize: getResponsiveFontSizeText(context, fontSize: 32)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
