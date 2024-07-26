import 'package:animations/animations.dart';
import 'package:divinecontrol/screens/astrology_screens/astrology_screen.dart';
import 'package:divinecontrol/screens/biorythm_screes/biorythm_dob_page.dart';
import 'package:divinecontrol/screens/check_lovers_screens/flowe_screen.dart';
import 'package:divinecontrol/screens/dream_meaning_screens/dream_main_view.dart';
import 'package:divinecontrol/screens/emotion_screens/emotion_screen.dart';
import 'package:divinecontrol/screens/face_reading_screens/face_reading_view.dart';
import 'package:divinecontrol/screens/fortunewheel_screens/fortunewheel_screen.dart';
import 'package:divinecontrol/screens/horoscope_screens/horoscope_screen.dart';
import 'package:divinecontrol/screens/kundli_screens/kundli_screen.dart';
import 'package:divinecontrol/screens/meditation_screens/meditation_screen.dart';
import 'package:divinecontrol/screens/numerology_screens/numerology_screen.dart';
import 'package:divinecontrol/screens/palemreading_screens/palemreading_screen.dart';
import 'package:divinecontrol/screens/tarot_reading_screens/main_tarot_read_view.dart';
import 'package:divinecontrol/screens/traveltime_screens/traveltime_screen.dart';
import 'package:flutter/material.dart';

import '../../models/dream_meaning.models/custom_card_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    super.key,
    required this.cardModel,
  });

  final CustomCardModel cardModel;
  final List<Widget> screens = [
    const HoroscopeScreen(),
    const KundliScreen(),
    const MyFortuneWheel(),
    const MainTarotReadView(),
    const FaceReadingView(),
    const PalemReadingScreen(),
    const TravelTimeScreen(),
    const AstrologyMainPage(),
    const BiorythmDobPage(),
    const DreamMeaningMainView(),
    const Numerology(),
    const Flower(),
    const MeditationScreen(),
    const EmotionScreen()
  ];
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
        // width:width*0.45,
        //height:  height * 0.26,
        decoration: const BoxDecoration(
            // color: AppColors.lightPurple1,
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: width * 0.18,
                height: height * 0.09,
                child: Image.asset(
                  cardModel.image,
                  fit: BoxFit.fill,
                )),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primary.withOpacity(0.4)),
              width: width * 0.29, //0.28
              height: height * 0.07,
              child: Center(
                child: Text(
                  cardModel.title,
                  textAlign: TextAlign.center,
                  style: AppStyles.styleBold24(context).copyWith(
                      color: AppColors.darkPrimary,
                      fontWeight: FontWeight.w800,
                      fontSize: getResponsiveFontSizeText(context,
                          fontSize: 18)), //16
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
    }, openBuilder: (context,_)=>screens[cardModel.index]);
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
            SizedBox(
                width: width * 0.25,
                height: height * 0.13,
                child: Image.asset(
                  cardModel.image,
                  fit: BoxFit.fill,
                )),
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
    }, openBuilder: (context,_)=>screens[cardModel.index]);
    
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
          SizedBox(
              width: width * 0.09,
              height: height * 0.16,
              child: Image.asset(
                cardModel.image,
                fit: BoxFit.fill,
              )),
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
    }, openBuilder: (context,_)=>screens[cardModel.index]);
   
  }
}
