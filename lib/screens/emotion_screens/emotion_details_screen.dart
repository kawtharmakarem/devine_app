import 'package:divinecontrol/models/astrology_models/astrology_cardmodel.dart';
import 'package:divinecontrol/models/emotion_models/emotion_model.dart';
import 'package:divinecontrol/screens/astrology_screens/astrology_description_screen.dart';
import 'package:divinecontrol/screens/emotion_screens/emotion_description_screen.dart';
import 'package:divinecontrol/widgets/astrology_widgets/custom_astrology_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class EmotionDetailsPage extends StatelessWidget {
  const EmotionDetailsPage({super.key, required this.emotionModel});
  final EmotionModel emotionModel;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
      appBar: AppBar(
        title: Text(
          emotionModel.title,
          style: width < AppConstants.maxMobileWidth
              ? AppStyles.styleBold24(context)
                  .copyWith(color: AppColors.darkPrimary)
              : AppStyles.styleBold24(context).copyWith(
                  color: AppColors.darkPrimary,
                  fontSize: getResponsiveFontSizeText(context, fontSize: 40)),
        ),
        backgroundColor: AppColors.primary,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppImages.leftArrow),
        ),
      ),
      body: width < AppConstants.maxTabletWidth
          ? getMobileDetailsContent(width, context)
          : getDesktopDetailsContent(width, context),
    );
  }

  Padding getMobileDetailsContent(double width, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
              width: width * 0.7,
              child: Image.asset(
                emotionModel.detailsImage,
                fit: BoxFit.fill,
              )),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(
              children: [
                Text(
                  emotionModel.description,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 16,
                  style: width < AppConstants.maxMobileWidth
                      ? AppStyles.styleRegular20(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 18))
                      : AppStyles.styleRegular20(context).copyWith(
                          color: AppColors.black,
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 28)),
                ),
              ],
            ),
          ), //todo make scrollable
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: CustomAstrologyButton(
              title: 'Book Now',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EmotionDescriptionScreen(
                          emotionModel: emotionModel,
                        )));
              },
              color: AppColors.black,
              textColor: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Padding getDesktopDetailsContent(double width, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Container(
                  width: width * 0.4,
                  child: Image.asset(
                    emotionModel.detailsImage,
                    fit: BoxFit.fill,
                  )),
              const SizedBox(
                height: 30,
              ),
              Container(
                  width: width * 0.4,
                  child: CustomAstrologyButton(
                    title: 'Book Now',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EmotionDescriptionScreen(
                              emotionModel: emotionModel)));
                    },
                    color: AppColors.black,
                    textColor: AppColors.white,
                  ))
            ],
          ),

          Container(
            width: width * 0.5,
            child: Expanded(
              child: ListView(
                children: [
                  Text(
                    emotionModel.description,
                    style: AppStyles.styleRegular20(context).copyWith(
                        color: AppColors.black,
                        fontSize: getResponsiveFontSizeText(context, fontSize: 32)),
                  ),
                ],
              ),
            ),
          ), //todo make scrollable
        ],
      ),
    );
  }
}
