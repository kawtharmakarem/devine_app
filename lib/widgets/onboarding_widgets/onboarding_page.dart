import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../models/onboarding_models/on_boarding_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.onBoardingModel,
  });

  final OnBoardingModel onBoardingModel;

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    double width=MediaQuery.sizeOf(context).width;
    return width<AppConstants.maxMobileWidth?  getMobileOnBoardingContent(height, context):getTabletOnBoardingContent(height,width ,context);
  }

  Container getMobileOnBoardingContent(double height, BuildContext context) {
    return Container(
    padding: const EdgeInsets.all(20),
    color: onBoardingModel.bgColor,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          onBoardingModel.image,
          height:height * 0.5,
        ),
        Column(
          children: [
            Text(
              onBoardingModel.title,
              style: AppStyles.styleRufinaBold32(context).copyWith(color: AppColors.darkPrimary,fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
            Text(onBoardingModel.subTitle,style: AppStyles.styleRegular20(context).copyWith(fontFamily: 'Rufina',color: AppColors.darkPrimary,fontWeight: FontWeight.w500),),
          ],
        ),
        const SizedBox(
          height: 80,
        )
      ],
    ),
  );
  }

  Container getTabletOnBoardingContent(double height, double width,BuildContext context) {
    return Container(
   // padding: const EdgeInsets.all(20),
    color: onBoardingModel.bgColor,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          onBoardingModel.image,fit: BoxFit.fill,
          height:height*0.4,
        ),
        Column(
          children: [
            SizedBox(
              width: width,
              child: Text(
                onBoardingModel.title,
                style: AppStyles.styleRufinaBold32(context).copyWith(color: AppColors.darkPrimary,fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
            ),
            Text(onBoardingModel.subTitle,style: AppStyles.styleRegular20(context).copyWith(fontFamily: 'Rufina',color: AppColors.darkPrimary,fontWeight: FontWeight.w500),),
          ],
        ),
        const SizedBox(
          height: 80,
        )
      ],
    ),
  );
  }
}
