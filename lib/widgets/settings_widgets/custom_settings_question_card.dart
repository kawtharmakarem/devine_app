

import 'package:flutter/material.dart';

import '../../models/settings_models/settings_card_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class CustomQuestionSettingsCard extends StatelessWidget {
  const CustomQuestionSettingsCard({super.key, required this.cardModel});
  final SettingsCardModel cardModel;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Material(
      borderRadius: BorderRadius.circular(2),
      elevation: 2,
      child: Container(
        margin:const EdgeInsets.symmetric(horizontal: 5),
          
              decoration: BoxDecoration(
                color:cardModel.color ?? AppColors.lightPurple1,
                borderRadius: BorderRadius.circular(2)
              ),
          child: ExpansionTile(
              //initiallyExpanded: true,
              leading:const Icon(Icons.question_mark_sharp,size: 40,color: AppColors.darkPrimary,),
              title: Text(cardModel.title,
                  style:AppStyles.styleRufinaBold32(context).copyWith(color: AppColors.darkPrimary,fontWeight: FontWeight.w900,fontSize: getResponsiveFontSizeText(context, fontSize: 18))),
              children: [
                const Divider(
                  color: AppColors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      cardModel.details,
                      style: AppStyles.styleRegular20(context).copyWith(
                          fontSize: getResponsiveFontSizeText(context,
                              fontSize: width < AppConstants.maxMobileWidth
                                  ? 18
                                  : width < AppConstants.maxTabletWidth
                                      ? 24
                                      : 28)),
                    )
                  ],
                )
              ])),
    );
  }
}



