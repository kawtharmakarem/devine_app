import 'package:animations/animations.dart';
import 'package:divinecontrol/admin_panel/admin_panel_models/adminpanel_card_model.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class CustomAdminPanelCard extends StatelessWidget {
  CustomAdminPanelCard({
    super.key,
    required this.cardModel,
    this.color
  });

  final AdminCardModel cardModel;
  final Color? color;
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    if (width < AppConstants.maxMobileWidth) {
      return getMobileCard(width, height, context);
    } else if (width < AppConstants.maxTabletWidth) {
      return getTabletCard(width, height, context);
    } else {
      return getDesktopCard(width, height, context);
    }
  }

  Widget getMobileCard(double width, double height, BuildContext context) {
    return OpenContainer(
      closedShape:const RoundedRectangleBorder(
        side: BorderSide.none,
        
      ),
      transitionDuration: const Duration(seconds: 2),
      closedElevation: 0,
      closedBuilder: (context,openContainer){
      
      return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: openContainer,
      splashColor: AppColors.primary,
      child: Container(
        padding:const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
       
        decoration:  BoxDecoration(
        color:color ?? AppColors.white,
              borderRadius: BorderRadius.circular(30),

            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
        cardModel.image!=null?    SizedBox(
                width: width * 0.18,
                height: height * 0.07,
                child: Image.asset(
                  cardModel.image!,
                  fit: BoxFit.fill,
                )):SizedBox(),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primary.withOpacity(0.4)),
              width: width * 0.23, //0.28
              height: height * 0.05,
              child: Center(
                child: Text(
                  cardModel.title,
                  textAlign: TextAlign.center,
                  style: AppStyles.styleBold24(context).copyWith(
                      color: AppColors.darkPrimary,
                      fontWeight: FontWeight.w800,
                      fontSize: getResponsiveFontSizeText(context,
                          fontSize: 14)), //16
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
    }, openBuilder: cardModel.openBuilder
    );
  }

  Widget getTabletCard(double width, double height, BuildContext context) {
    return OpenContainer(
      transitionDuration: const Duration(seconds: 1),
      closedShape:const RoundedRectangleBorder(
        side: BorderSide.none
      ),
      closedElevation: 0,
      closedBuilder: (context,openContianer){
      return InkWell(
      borderRadius: BorderRadius.circular(30),
     onTap: openContianer,
      splashColor: AppColors.primary,
      child: Container(
        padding:
            EdgeInsets.symmetric(vertical: width / 20, horizontal: width / 20),
        decoration: const BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
         cardModel.image!=null?   SizedBox(
                width: width * 0.25,
                height: height * 0.13,
                child: Image.asset(
                  cardModel.image!,
                  fit: BoxFit.fill,
                )):SizedBox(),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primary.withOpacity(0.4)),
              width: width * 0.28,
              height: height * 0.07,
              child: Center(
                child: Text(
                  cardModel.title,
                  textAlign: TextAlign.center,
                  style: AppStyles.styleBold24(context).copyWith(
                      color: AppColors.darkPrimary,
                      fontWeight: FontWeight.w800,
                      fontSize:
                          getResponsiveFontSizeText(context, fontSize: 24)),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
    }, openBuilder:  cardModel.openBuilder);
    
  }

  Widget getDesktopCard(double width, double height, BuildContext context) {
    return OpenContainer(
      transitionDuration: const Duration(seconds: 1),
      closedShape:const RoundedRectangleBorder(
        side: BorderSide.none
        
      ),
      closedElevation: 0,
      closedBuilder: (context,openContainer){
      return  InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: openContainer,
      splashColor: AppColors.primary,
      child: Column(
        children: [
      cardModel.image!=null?    SizedBox(
              width: width * 0.09,
              height: height * 0.16,
              child: Image.asset(
                cardModel.image!,
                fit: BoxFit.fill,
              )):SizedBox(),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primary.withOpacity(0.4)),
            width: width * 0.15,
            height: height * 0.1,
            child: Center(
              child: Text(
                cardModel.title,
                textAlign: TextAlign.center,
                style: AppStyles.styleBold24(context).copyWith(
                    color: AppColors.darkPrimary,
                    fontSize: getResponsiveFontSizeText(context, fontSize: 28)),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
    }, openBuilder: cardModel.openBuilder);
   
  }
}
