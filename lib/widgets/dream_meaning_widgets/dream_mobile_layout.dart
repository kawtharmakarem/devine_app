import 'package:divinecontrol/screens/astrology_screens/astrology_screen.dart';
import 'package:divinecontrol/screens/biorythm_screes/biorhythm_page.dart';
import 'package:divinecontrol/screens/check_lovers_screens/flowe_screen.dart';
import 'package:divinecontrol/screens/emotion_screens/emotion_screen.dart';
import 'package:divinecontrol/screens/face_reading_screens/face_reading_view.dart';
import 'package:divinecontrol/screens/fortunewheel_screens/fortunewheel_screen.dart';
import 'package:divinecontrol/screens/kundli_screens/kundli_screen.dart';
import 'package:divinecontrol/screens/meditation_screens/meditation_screen.dart';
import 'package:divinecontrol/screens/numerology_screens/numerology_screen.dart';
import 'package:divinecontrol/screens/palemreading_screens/palemreading_screen.dart';
import 'package:divinecontrol/screens/tarot_reading_screens/tarot_read_view.dart';
import 'package:divinecontrol/screens/traveltime_screens/traveltime_screen.dart';
import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_styles.dart';
import 'custom_card.dart';
import 'second_child.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  @override
  bool isVisible = false;
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedCrossFade(
              firstChild: SizedBox(
                width: double.maxFinite,
                child: Text(
                  'Dream Interpretation',
                  style: AppStyles.styleBold32(context),
                  textAlign: TextAlign.center,
                ),
              ),
              secondChild: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                icon: SvgPicture.asset(AppImages.leftArrow),
                label: SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    'Dream Interpretation',
                    style: AppStyles.styleBold24(context)
                        .copyWith(color: AppColors.darkPrimary),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              crossFadeState: !isVisible
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
            ),
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 500),
              layoutBuilder:
                  (topChild, topChildKey, bottomChild, bottomChildKey) => Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    key: bottomChildKey,
                    top: 0,
                    child: bottomChild,
                  ),
                  Positioned(key: topChildKey, child: topChild)
                ],
              ),
      
              firstChild: SingleChildScrollView(
                child: Wrap(
                  
                  children: [
                     CustomCard(onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Flower()));
                        }, title: "Love Check", image: AppImages.checklovelogo),
                        CustomCard(onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MyFortuneWheel()));
                        }, title: "Fortune Wheel", image: AppImages.fortunewheellogo),
                        CustomCard(onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const KundliScreen()));
                        }, title: "Kundli", image: AppImages.kundlilogo),
                    CustomCard(
                        image: AppImages.dream,
                        title: 'Dream Meaning',
                        onTap: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomCard(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const TarotReadView()));
                        },
                        title: 'Tarot Reading',
                        image: AppImages.tarortReading),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomCard(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const FaceReadingView()));
                        },
                        title: 'Face Reading',
                        image: AppImages.facelogo),
                    const SizedBox(
                      height: 10,
                    ),
                    
                    CustomCard(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const BiorhythmPage()));
                        },
                        title: 'Biorythm',
                        image: AppImages.biorythmlogo),
                        CustomCard(onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AstrologyMainPage()));
                        }, title: 'Astrology', image: AppImages.astrologylogo),
                        CustomCard(onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Numerology()));
                        }, title: "Numerology", image: AppImages.numerologyLogo),
                        CustomCard(onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MeditationScreen()));
                        }, title: "Meditation", image: AppImages.meditationLogo),
                        CustomCard(onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const EmotionScreen()));
                        }, title: "Emotional Support", image: AppImages.emotionLogo),
                        CustomCard(onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const PalemReadingScreen()));
                        }, title: "Palm Reading", image: AppImages.palemreadingLogo),
                        CustomCard(onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const TravelTimeScreen()));
                        }, title: "Time Travel", image: AppImages.travellogo),
                       
                  ],
                ),
              ),
              secondChild: const SecondChild(),
              crossFadeState: isVisible
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
            ),
          ],
        ),
      ),
    );
  }
}
