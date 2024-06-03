import 'package:divinecontrol/models/meditation_models/meditation_models.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class CustomMeditationCard extends StatelessWidget {
  const CustomMeditationCard({
    super.key,
    required this.onTap,
    required this.meditationModel,
  });
  final void Function() onTap;
  final MeditationModel meditationModel;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return InkWell(
      splashColor: AppColors.lightPurple1,
      onTap: onTap,
      child: width<AppConstants.maxTabletWidth?  getMobileCard(width, height, context):getDesktopCard(width, height, context),
    );
  }

  Container getMobileCard(double width, double height, BuildContext context) {
    return Container(
      width: width * 0.45,
      height:
          width < AppConstants.maxMobileWidth ? height * 0.28 : height * 0.32,
      decoration: ShapeDecoration(
          color: AppColors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            height: 5,
          ),
          SizedBox(
              width: width * 0.3,
              child: Image.asset(
                meditationModel.image,
                fit: BoxFit.fill,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              meditationModel.title,
              textAlign: TextAlign.center,
              style: width < AppConstants.maxMobileWidth
                  ? AppStyles.styleBold24(context).copyWith(
                      fontSize:
                          getResponsiveFontSizeText(context, fontSize: 18))
                  : AppStyles.styleBold24(context).copyWith(
                      fontSize:
                          getResponsiveFontSizeText(context, fontSize: 30)),
            ),
          )
        ],
      ),
    );
  }

  Container getDesktopCard(double width, double height, BuildContext context) {
    return Container(
      width: width*0.3,
      height: height*0.5,
      decoration: ShapeDecoration(
          color: AppColors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          
          SizedBox(
            width: width*0.2,
            child: Image.asset(
              meditationModel.image,fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              meditationModel.title,
              textAlign: TextAlign.center,
              style: AppStyles.styleBold24(context).copyWith(
                      fontSize:
                          getResponsiveFontSizeText(context, fontSize: 32)),
            ),
          )
        ],
      ),
    );
  }
}
