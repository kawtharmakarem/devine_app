import 'package:divinecontrol/models/traveltime_models/traveltime_details_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class SeeFutureDetailsCard extends StatelessWidget {
   SeeFutureDetailsCard({
    super.key, required this.travelTimeDetailsModel,
  });
 final TravelTimeDetailsModel travelTimeDetailsModel;
  final formatter = DateFormat.yMd();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height=MediaQuery.sizeOf(context).height;
    return width < AppConstants.maxMobileWidth
        ? getMobileSeeFutureDetailsCard(context, width,height)
        : width < AppConstants.maxTabletWidth
            ? getTabletSeeFutureDetailsCard(context, width,height)
            : getDesktopSeeFutureDetailsCard(context, width,height);
  }

  Padding getMobileSeeFutureDetailsCard(BuildContext context, double width,double height) {
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
                child: Text("${travelTimeDetailsModel.title} ",
                    style: AppStyles.styleBold24(context).copyWith(
                        fontSize: getResponsiveFontSizeText(context,
                            fontSize: 24))),
              ),
               travelTimeDetailsModel.image==null? Container():  SizedBox(
            width: 75,
            height: 65,
            child: Image.asset(travelTimeDetailsModel.image!)),
              const Divider(
                color: AppColors.black,
                indent: 20,
                endIndent: 20,
              ),
              Expanded(
                child: ListView(
                  children: [
                       Text(travelTimeDetailsModel.details,
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

  Padding getTabletSeeFutureDetailsCard(BuildContext context, double width,double height) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        child: Container(
          height:height*0.3 ,
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
                child: Text(travelTimeDetailsModel.title,
                    textAlign: TextAlign.center,
                    style: AppStyles.styleBold20(context).copyWith(
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize: 40))),

              ),
              travelTimeDetailsModel.image==null? Container():  SizedBox(
            width: 95,
            height: 75,
            child: Image.asset(travelTimeDetailsModel.image!)),
              const Divider(
                color: AppColors.black,
                indent: 20,
                endIndent: 20,
              ),
              Expanded(
                child: ListView(
                  children: [
                        Text(travelTimeDetailsModel.details,
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

  Padding getDesktopSeeFutureDetailsCard(
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
                child: Text(travelTimeDetailsModel.title,
                    textAlign: TextAlign.center,
                    style: AppStyles.styleBold20(context).copyWith(
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize: 32))),
              ),
              travelTimeDetailsModel.image==null? Container():  SizedBox(
            width: 105,
            height: 85,
            child: Image.asset(travelTimeDetailsModel.image!)),
              const Divider(
                color: AppColors.black,
                indent: 20,
                endIndent: 20,
              ),
              Expanded(
                child: ListView(
                  children: [
                        Text(travelTimeDetailsModel.details,
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
