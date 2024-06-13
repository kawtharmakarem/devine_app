import 'package:divinecontrol/models/horoscope_models/horoscope_model.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:divinecontrol/widgets/horoscope_widgets/custom_horoscope_details_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class HoroscopeDetailsScreen extends StatelessWidget {
  const HoroscopeDetailsScreen({super.key, required this.horoscopeModel});
  final HoroscopeModel horoscopeModel;

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
 backgroundColor: AppColors.lightPurple1,
      appBar: AppBar(
        title: Text(
          horoscopeModel.title,
          style: width < AppConstants.maxMobileWidth
              ? AppStyles.styleBold24(context)
                  .copyWith(color: AppColors.darkPrimary)
              : AppStyles.styleBold24(context).copyWith(
                  color: AppColors.darkPrimary,
                  fontSize: getResponsiveFontSizeText(context, fontSize: 40)),
        ),
        backgroundColor: AppColors.lightPurple1,
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: SvgPicture.asset(AppImages.leftArrow)),
       
        ),
        body: CustomHoroscopeDetailsCard(horoscopeModel: horoscopeModel),
      );
  }
}