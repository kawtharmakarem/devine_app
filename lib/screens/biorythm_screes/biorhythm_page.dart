import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/biorhythm_models/biorhythm_description_model.dart';
import '../../utils/app_styles.dart';
import '../../widgets/biorythm_widgets/biorhythm_chart.dart';
import '../../widgets/biorythm_widgets/biorhythm_description.dart';
import '../../widgets/biorythm_widgets/biorhythm_indicators.dart';

class BiorhythmPage extends StatelessWidget {
  const BiorhythmPage({super.key});
  static List<BiorhythmDescriptionModel> descriptions = [
    BiorhythmDescriptionModel(
      title: 'Physical',
      description:
          'You are in a negative cycle for your physical attributes. Negative physical days find us needing more rest, and our immunity might not be at its best. Our desire usually takes a back seat, and we may be prone to overexertion and overexposure. Your strength, endurance, and energy may not be at their highest, so it is a good opportunity to work on them!',
      image: AppImages.physical,
    ),
    BiorhythmDescriptionModel(
      title: 'Emotional',
      description:
          'You are in a positive cycle for your emotional attributes. On positive emotional days, we are quick to adapt and easily get along with others. We may be supportive and forgiving, or our thoughts may be focused more on love and affection. Your balance of power, mood, receptivity, mood, creativity, awareness and perception while they are at their peak.',
      image: AppImages.emotional,
    ),
    BiorhythmDescriptionModel(
      title: 'Intellectual',
      description:
          'You are in a negative cycle for your intellectual attributes. On negative intellectual days, we might have trouble trying to stay motivated, concentrating, or getting tasks done. Our critical thinking may be at its lowest. Our logical analysis, analytical thinking, alertness, memory and concentration might not be at their highest, so it is a good opportunity to work on them!',
      image: AppImages.intellectual,
    ),
    BiorhythmDescriptionModel(
      title: 'Spiritual',
      description:
          'You are in a negative cycle for your intellectual attributes. On negative intellectual days, we might have trouble trying to stay motivated, concentrating, or getting tasks done. Our critical thinking may be at its lowest. Our logical analysis, analytical thinking, alertness, memory and concentration might not be at their highest, so it is a good opportunity to work on them!',
      image: AppImages.spiritual,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width < AppConstants.maxMobileWidth ? 10 : 30),
          child: width < AppConstants.maxTabletWidth
              ? getMobileBiorhythmContent(context, width)
              : getDesktopBiorhythmContent(context, width),
        ),
      ),
    );
  }

  Column getMobileBiorhythmContent(BuildContext context, double width) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(AppImages.leftArrow)),
            Text(
              'February 16 - Biorhythm',
              style: width < AppConstants.maxMobileWidth
                  ? AppStyles.styleBold24(context)
                      .copyWith(color: AppColors.moveColor)
                  : AppStyles.styleBold24(context)
                      .copyWith(color: AppColors.moveColor, fontSize: 40),
              textAlign: TextAlign.center,
            ),
            const SizedBox()
          ],
        ),
        const SizedBox(height: 16),
        const BiorhythmChart(),
        const SizedBox(height: 16),
        const BiorhythmIndicators(),
        const SizedBox(height: 16),
        Expanded(
            child: ListView(
          shrinkWrap: true,
          children: [
            for (final descriptionModel in descriptions)
              Padding(
                padding: EdgeInsets.only(
                    bottom: width < AppConstants.maxMobileWidth ? 10 : 30),
                child: BiorhythmDescription(descriptionModel: descriptionModel),
              )
          ],
        ))
      ],
    );
  }

  Widget getDesktopBiorhythmContent(BuildContext context, double width) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(AppImages.leftArrow)),
              Text(
                'February 16 - Biorhythm',
                style: width < AppConstants.maxMobileWidth
                    ? AppStyles.styleBold24(context)
                        .copyWith(color: AppColors.moveColor)
                    : AppStyles.styleBold24(context)
                        .copyWith(color: AppColors.moveColor, fontSize: 40),
                textAlign: TextAlign.center,
              ),
              const SizedBox()
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Column(
                  children: [
                   BiorhythmChart(),
                    SizedBox(height: 16),
                    BiorhythmIndicators(),
                  ],
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (final descriptionModel in descriptions)
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: width < AppConstants.maxMobileWidth
                                ? 10
                                : 30),
                        child: BiorhythmDescription(
                            descriptionModel: descriptionModel),
                      )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
