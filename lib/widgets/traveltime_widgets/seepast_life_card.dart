import 'package:divinecontrol/models/traveltime_models/pastlife_model.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class SeePastLifeDetailsCard extends StatelessWidget {
   SeePastLifeDetailsCard({
    super.key, required this.pastLifeModel,
  });
  final PastLifeModel pastLifeModel;
  final formatter = DateFormat.yMd();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height=MediaQuery.sizeOf(context).height;
    return  Scaffold(
      backgroundColor: AppColors.lightPurple1,
      appBar: CustomAppBar(title: "See Your Past", leading: true),

  body:  width < AppConstants.maxMobileWidth
        ? getMobileSeePastLifeDetailsCard(context, width,height)
        : width < AppConstants.maxTabletWidth
            ? getTabletSeePastLifeDetailsCard(context, width,height)
            : getDesktopSeePastLifeDetailsCard(context, width,height)
    );
  }

  Padding getMobileSeePastLifeDetailsCard(BuildContext context, double width,double height) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Column(
            children: [
         
              Align(
                alignment: Alignment.center,
                child: Text("Results",
                    style: AppStyles.styleBold24(context).copyWith(
                        fontSize: getResponsiveFontSizeText(context,
                            fontSize: 24))),
              ),
             
              const Divider(
                color: AppColors.black,
                indent: 20,
                endIndent: 20,
              ),
              Expanded(
                child: ListView(
                  children: [
                       Text(pastLifeModel.prediction,
                        style: AppStyles.styleRegular18(context).copyWith(
                            fontSize: getResponsiveFontSizeText(context,
                                fontSize: 20),
                            color: AppColors.black)),
                  ],
                ),
              )
            ],
          ),
        )
       
        );
  }

  Padding getTabletSeePastLifeDetailsCard(BuildContext context, double width,double height) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        child: Container(
          //height:height*0.3 ,
          padding:const EdgeInsets.symmetric(horizontal: 20),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Text("Results",
                    textAlign: TextAlign.center,
                    style: AppStyles.styleBold20(context).copyWith(
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize: 40))),

              ),
            
              const Divider(
                color: AppColors.black,
                indent: 20,
                endIndent: 20,
              ),
              Expanded(
                child: ListView(
                  children: [
                        Text(pastLifeModel.prediction,
                        style: AppStyles.styleRegular18(context).copyWith(
                            fontSize: getResponsiveFontSizeText(context,
                                fontSize: 30),
                            color: AppColors.black)),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        )
       
        );
  }

  Padding getDesktopSeePastLifeDetailsCard(
      BuildContext context, double width,double height) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Text("Results",
                    textAlign: TextAlign.center,
                    style: AppStyles.styleBold20(context).copyWith(
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize: 32))),
              ),
             
              const Divider(
                color: AppColors.black,
                indent: 20,
                endIndent: 20,
              ),
              Expanded(
                child: ListView(
                  children: [
                        Text(pastLifeModel.prediction,
                        style: AppStyles.styleRegular18(context).copyWith(
                            fontSize: getResponsiveFontSizeTextTarot(context,
                                fontSize: 20),
                            color: AppColors.black)),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ));
  }
}
