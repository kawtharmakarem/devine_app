import 'package:divinecontrol/screens/astrology_screens/astrology_screen.dart';
import 'package:divinecontrol/screens/biorythm_screes/biorhythm_page.dart';
import 'package:divinecontrol/screens/check_lovers_screens/flowe_screen.dart';
import 'package:divinecontrol/screens/emotion_screens/emotion_screen.dart';
import 'package:divinecontrol/screens/face_reading_screens/face_reading_view.dart';
import 'package:divinecontrol/screens/fortunewheel_screens/fortunewheel_screen.dart';
import 'package:divinecontrol/screens/meditation_screens/meditation_screen.dart';
import 'package:divinecontrol/screens/numerology_screens/numerology_screen.dart';
import 'package:divinecontrol/screens/palemreading_screens/palemreading_screen.dart';
import 'package:divinecontrol/screens/traveltime_screens/traveltime_screen.dart';
import 'package:divinecontrol/widgets/dream_meaning_widgets/custom_card.dart';
import 'package:divinecontrol/widgets/dream_meaning_widgets/second_child.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../screens/tarot_reading_screens/tarot_read_view.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedCrossFade(
                firstChild: Text(
                  'Dream Interpretation',
                  style: AppStyles.styleBold32(context).copyWith(
                      fontSize: getResponsiveFontSizeText(context, fontSize: 50)),
                  textAlign: TextAlign.center,
                ),
                secondChild: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  icon: SvgPicture.asset(AppImages.leftArrow),
                  label: Text(
                    'Dream Interpretation',
                    style: AppStyles.styleBold32(context).copyWith(
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize: 40)),
                    textAlign: TextAlign.center,
                  ),
                ),
                crossFadeState: !isVisible
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 300)),
            
            
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
              firstChild: Wrap(
                
                children: [
                  CustomCard(onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Flower()));
                  }, title: "Love Check", image: AppImages.checklovelogo),
                  CustomCard(onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MyFortuneWheel()));
                  }, title: "Fortune Wheel", image: AppImages.fortunewheellogo),
                  CustomCard(
                      image: AppImages.dream,
                      title: 'Dream Meaning',
                      onTap: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      }),
                  
                  CustomCard(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>const TarotReadView()));
                      },
                      title: 'Tarot Reading',
                      image: AppImages.tarortReading),
                  
                      CustomCard(onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const FaceReadingView()));
                      }, title: "Face Reading", image: AppImages.facelogo),
                      CustomCard(onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const  BiorhythmPage()));
                      }, title: 'Biorhythm', image: AppImages.biorythmlogo),
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
                      }, title: "Time Travel", image: AppImages.travellogo)
                ],
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
