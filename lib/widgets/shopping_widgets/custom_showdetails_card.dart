import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/widgets/shopping_widgets/custom_shopping_line.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomShowDetailsCard extends StatelessWidget {
  const CustomShowDetailsCard({
    super.key,
    required this.text0,
    required this.text2,
    required this.text3,
    required this.mainTitle, this.text4,
  });
  final String mainTitle;
  final String text0;
  final String text2;
  final String text3;
  final String? text4;

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(mainTitle,
                style: AppStyles.styleBold24(context).copyWith(
                    fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 22: 32),
                    color: AppColors.black)),
            const SizedBox(
              height: 20,
            ),
            CustomShoppingLine(text: text0),
            const SizedBox(
              height: 10,
            ),
            CustomShoppingLine(text: text2),
            const SizedBox(
              height: 10,
            ),
            CustomShoppingLine(text: text3),
            const SizedBox(height: 10,),
          text4!=null ?  CustomShoppingLine(text:text4!) :const SizedBox() 
          ],
        ));
  }
}
