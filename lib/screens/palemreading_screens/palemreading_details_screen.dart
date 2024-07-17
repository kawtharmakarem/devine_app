import 'package:divinecontrol/models/palemreading_models/palemreading_model.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:divinecontrol/widgets/palemreading_widgets/custom_palemreading_details_card.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';

class PalemReadingDetailsScreen extends StatelessWidget {
  const PalemReadingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
      appBar: CustomAppBar(title: 'Results !', leading: true),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width < AppConstants.maxTabletWidth ? 1 : 2,
              ),
              children: [
                for (final item in items)
                  CustomPalemReadingDetailsCard(palemReadingModel: item)
              ],
            ),
          )
        ],
      ),
    );
  }

  static final List<PalemReadingModel> items = [
    PalemReadingModel(
        title: "Life Line",
        description:
            "You are in a negative cycle for your physical attributes. Negative physical days find us needing more rest, and our immunity might not be at its best. Our sex drives are usually lower, and we may be prone to overexertion and overindulgence. Your strength, coordination, and well-being may not be at their highest, so it is a good opportunity to work on them!",
        image: AppImages.lifeline,
        addtionImage: AppImages.lifelineline),
    PalemReadingModel(
        title: "Head Line",
        description:
            "You are in a positive cycle for your emotional attributes. On positive emotional days, we are in a good mood and get along easily with others. On very high positive days, we might be overly emotional, impulsive, and prone to outbursts. Take advantage of your enhanced sensitivity, mood, creativity, awareness and perception while they are at their peak.",
        image: AppImages.lifeline,
        addtionImage: AppImages.headline),
    PalemReadingModel(
        title: "Heart Line",
        description:
            "You are in a negative cycle for your intellectual attributes. On negative intellectual days, we might have a tough time trying to make decisions, be unable to concentrate, and have trouble communicating effectively with others. Your logical analysis, analytical thinking, alertness, memory and communication may not be at their highest, so it is a good opportunity to work on them.",
        image: AppImages.lifeline,
        addtionImage: AppImages.heartline),
    PalemReadingModel(
        title: "Relationship",
        description:
            "You are in a negative cycle for your intellectual attributes. On negative intellectual days, we might have a tough time trying to make decisions, be unable to concentrate, and have trouble communicating effectively with others. Your logical analysis, analytical thinking, alertness, memory and communication may not be at their highest, so it is a good opportunity to work on them.",
        image: AppImages.palemrelation),
    PalemReadingModel(
        title: "Health",
        description:
            "You are in a negative cycle for your physical attributes. Negative physical days find us needing more rest, and our immunity might not be at its best. Our sex drives are usually lower, and we may be prone to overexertion and overindulgence. Your strength, coordination, and well-being may not be at their highest, so it is a good opportunity to work on them!",
        image: AppImages.palemhealth),
    PalemReadingModel(
        title: "Wealth",
        description:
            "You are in a positive cycle for your emotional attributes. On positive emotional days, we are in a good mood and get along easily with others. On very high positive days, we might be overly emotional, impulsive, and prone to outbursts. Take advantage of your enhanced sensitivity, mood, creativity, awareness and perception while they are at their peak.",
        image: AppImages.wealthpalem),
    PalemReadingModel(
        title: "Career",
        description:
            "You are in a negative cycle for your intellectual attributes. On negative intellectual days, we might have a tough time trying to make decisions, be unable to concentrate, and have trouble communicating effectively with others. Your logical analysis, analytical thinking, alertness, memory and communication may not be at their highest, so it is a good opportunity to work on them.",
        image: AppImages.careerimage),
  ];
}
