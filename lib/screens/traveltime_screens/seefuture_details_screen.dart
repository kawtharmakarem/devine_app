import 'package:divinecontrol/models/traveltime_models/traveltime_details_model.dart';
import 'package:divinecontrol/widgets/traveltime_widgets/seefuture_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class SeeFutureDetailsScreen extends StatelessWidget {
  const SeeFutureDetailsScreen({super.key, this.dateTime});
  final DateTime? dateTime;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
      appBar: AppBar(
        title: Text(
          'See Your Future',
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
      body: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: SizedBox(
            height: height * 0.7,
            child: SeeFutureDetailsCard(
              travelTimeDetailsModel: TravelTimeDetailsModel(
                  title: "Results",
                  details:
                      "You are usually a very practical and down-to-Earth person, but today you may be more inclined than usual toward mysticism. Spiritual matters seem extremely appealing, and you could find yourself gravitating toward metaphysical bookstores or seeking discussions with people who are well versed in such matters. You also find your imagination working overtime. Indulge in a few flights of fancy, Gemini. We all need to escape from time to time!"),
            )),
      ),
    );
  }
}
