import 'package:divinecontrol/widgets/kundli_widgets/custom_kundli_result_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class RemediesDetailsScreen extends StatelessWidget {
  const RemediesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
 double width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
    appBar:   AppBar(
         title: Text(
            "Results",
            style: width < AppConstants.maxMobileWidth
                ? AppStyles.styleBold24(context)
                    .copyWith(color: AppColors.darkPrimary)
                : AppStyles.styleBold24(context).copyWith(
                    color: AppColors.darkPrimary,
                    fontSize: getResponsiveFontSizeText(context, fontSize: 40)),
          ),
          backgroundColor: AppColors.lightPurple1,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(AppImages.leftArrow),
          )),
          body:  const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              children: [
                Expanded(child: CustomKundleResultCard(title: "Sadesati", details: "Remedies details")),
              ],
            ),
          ),
          );  }
}