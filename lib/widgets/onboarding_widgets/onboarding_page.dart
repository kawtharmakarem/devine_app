import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return width < AppConstants.maxMobileWidth
        ? getMobileOnBoardingContent(height, context)
        : width < AppConstants.maxTabletWidth
            ? getTabletOnBoardingContent(height, width, context)
            : getDesktopOnBoardingContent(height, width, context);
  }

  Container getMobileOnBoardingContent(double height, BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 30),
      color: onBoardingModel.bgColor,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
        children: [
           SizedBox(height: height*0.01,),
          Image.asset(
            onBoardingModel.image,
            height: height * 0.4,
          ),
          // SizedBox(height: height*0.02,),
          Text(
            onBoardingModel.title,
            style: AppStyles.styleRufinaBold32(context).copyWith(
                color: AppColors.darkPrimary, fontWeight: FontWeight.w900,fontSize: getResponsiveFontSizeText(context, fontSize: 30)),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Text(
                  onBoardingModel.subTitle,textAlign: TextAlign.center,
                  style: AppStyles.styleRegular20(context).copyWith(
                      fontFamily: 'Rufina',
                      color: AppColors.darkPrimary,
                      
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 130,
          )
        ],
      ),
    );
  }

  Container getTabletOnBoardingContent(
      double height, double width, BuildContext context) {
    return Container(
       padding: const EdgeInsets.all(40),
      color: onBoardingModel.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            onBoardingModel.image,
            fit: BoxFit.fill,
            height: height * 0.4,
          ),
          SizedBox(
            width: width,
            child: Text(
              onBoardingModel.title,
              style: AppStyles.styleRufinaBold32(context).copyWith(
                  color: AppColors.darkPrimary,
                  fontWeight: FontWeight.w900,
                  fontSize:
                      getResponsiveFontSizeText(context, fontSize: 40)),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Text(
                  onBoardingModel.subTitle,textAlign: TextAlign.center,
                  style: AppStyles.styleRegular20(context).copyWith(
                      fontFamily: 'Rufina',
                      color: AppColors.darkPrimary,
                      fontWeight: FontWeight.w500,
                      fontSize: getResponsiveFontSizeText(context, fontSize: 30)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 140,
          )
        ],
      ),
    );
  }

  Container getDesktopOnBoardingContent(
      double height, double width, BuildContext context) {
    return Container(
       padding: const EdgeInsets.all(20),
      color: onBoardingModel.bgColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: height*0.6,
            width: width*0.35,
            child: Image.asset(
              onBoardingModel.image,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: width*0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width,
                  child: Text(
                    onBoardingModel.title,
                    style: AppStyles.styleRufinaBold32(context).copyWith(
                        color: AppColors.darkPrimary,
                        fontWeight: FontWeight.w900,
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize: 50)),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Text(
                        onBoardingModel.subTitle,textAlign: TextAlign.center,
                        style: AppStyles.styleRegular20(context).copyWith(
                            fontFamily: 'Rufina',
                            color: AppColors.darkPrimary,
                            fontWeight: FontWeight.w500,
                            fontSize: getResponsiveFontSizeText(context, fontSize: 36)),
                      ),
                    ],
                  ),
                ),
                              const SizedBox(height: 130,)

              ],
            ),
          ),
          // const SizedBox(
          //   height: 140,
          // )
        ],
      ),
    );
  }
}
