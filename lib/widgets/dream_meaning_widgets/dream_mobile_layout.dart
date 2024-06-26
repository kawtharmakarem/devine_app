import 'package:divinecontrol/screens/astrology_screens/astrology_screen.dart';
import 'package:divinecontrol/screens/biorythm_screes/biorhythm_page.dart';
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
import 'package:divinecontrol/screens/tarot_reading_screens/tarot_read_view.dart';
import 'package:divinecontrol/screens/traveltime_screens/traveltime_screen.dart';
import 'package:divinecontrol/widgets/dream_meaning_widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:page_transition/page_transition.dart';

import '../../models/dream_meaning.models/custom_card_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  bool _startAnimation = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: AnimationLimiter(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  childAspectRatio: 2 / 2.7,
                  children:
                      List.generate(getCardPart1(context).length, (index) {
                    return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(seconds: 2),
                        columnCount: 3,
                        child: ScaleAnimation(
                            child: FadeInAnimation(
                                child: CustomCard(
                                    cardModel: getCardPart1(context)[index]))));
                  }),
                ),
                SizedBox(
                  height: width / 20,
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  transform: Matrix4.translationValues(
                      _startAnimation ? 0 : width, 0, 0),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.primary.withOpacity(0.7)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: width * 0.15,
                          child: const Divider(
                            color: AppColors.darkPrimary,
                            thickness: 1,
                          )),
                      Text(
                        'Swiping Qestions',
                        style: AppStyles.styleBold24(context)
                            .copyWith(color: AppColors.darkPrimary),
                      ),
                      SizedBox(
                          width: width * 0.15,
                          child: const Divider(
                            color: AppColors.darkPrimary,
                            thickness: 1,
                          ))
                    ],
                  ),
                ),
                AnimatedContainer(
                    duration: const Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn,
                    transform: Matrix4.translationValues(
                        _startAnimation ? 0 : width, 0, 0),
                    child: Text(
                      'Read your future now!',
                      style: AppStyles.styleBold24(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 22)),
                    )),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  childAspectRatio: 2 / 2.7,
                  children:
                      List.generate(getCardPart2(context).length, (index) {
                    return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(seconds: 2),
                        columnCount: 3,
                        child: ScaleAnimation(
                            child: FadeInAnimation(
                                child: CustomCard(
                                    cardModel: getCardPart2(context)[index]))));
                  }),
                ),
                AnimatedContainer(
                    duration: const Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn,
                    transform: Matrix4.translationValues(
                        _startAnimation ? 0 : width, 0, 0),
                    child: Text(
                      'Embark on your Journey!',
                      style: AppStyles.styleBold24(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 22)),
                    )),
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  childAspectRatio: 2 / 2.7,
                  children:
                      List.generate(getCardPart3(context).length, (index) {
                    return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(seconds: 2),
                        columnCount: 3,
                        child: ScaleAnimation(
                            child: FadeInAnimation(
                                child: CustomCard(
                                    cardModel: getCardPart3(context)[index]))));
                  }),
                ),
                AnimatedContainer(
                    duration: const Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn,
                    transform: Matrix4.translationValues(
                        _startAnimation ? 0 : width, 0, 0),
                    child: Text(
                      "Let's take you to the another Dimension!",
                      textAlign: TextAlign.center,
                      style: AppStyles.styleBold24(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 22)),
                    )),
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  childAspectRatio: 2 / 2.7,
                  children:
                      List.generate(getCardPart4(context).length, (index) {
                    return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(seconds: 2),
                        columnCount: 3,
                        child: ScaleAnimation(
                            child: FadeInAnimation(
                                child: CustomCard(
                                    cardModel: getCardPart4(context)[index]))));
                  }),
                ),
                AnimatedContainer(
                    duration: const Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn,
                    transform: Matrix4.translationValues(
                        _startAnimation ? 0 : width, 0, 0),
                    child: Text(
                      'Nourish Your Soul..',
                      style: AppStyles.styleBold24(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 22)),
                    )),
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  childAspectRatio: 2 / 2.7,
                  children:
                      List.generate(getCardPart5(context).length, (index) {
                    return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(seconds: 2),
                        columnCount: 3,
                        child: ScaleAnimation(
                            child: FadeInAnimation(
                                child: CustomCard(
                                    cardModel: getCardPart5(context)[index]))));
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static List getCardPart1(BuildContext context) {
    return [
      CustomCardModel(() {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const HoroscopeScreen()));
        // Navigator.of(context).push(PageTransition(
        //   duration: const Duration(milliseconds: 1500),
        //   child: const HoroscopeScreen(), type: PageTransitionType.bottomToTop));
      }, title: "Horoscope", image: AppImages.horoscopelogo),
      CustomCardModel(() {
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => const Flower()));
        Navigator.of(context).push(PageTransition(child: const Flower(), type: PageTransitionType.bottomToTop,duration: const Duration(milliseconds: 1500)));
      }, title: "Love Check", image: AppImages.checklovelogo),
      CustomCardModel(() {
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => const MyFortuneWheel()));
        Navigator.of(context).push(PageTransition(child:const MyFortuneWheel(), type: PageTransitionType.fade,duration: const Duration(milliseconds: 1500)));
      }, title: "Fortune Wheel", image: AppImages.fortunewheellogo),
    ];
  }

  static List getCardPart2(BuildContext context) {
    return [
      CustomCardModel(() {
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => const TarotReadView()));
        Navigator.of(context).push(PageTransition(child:const TarotReadView(), type: PageTransitionType.leftToRight,duration: const Duration(milliseconds: 1500)));
      }, title: "Tarot Reading", image: AppImages.tarortReading),
      CustomCardModel(() {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const FaceReadingView()));
      }, title: "Face Reading", image: AppImages.facelogo),
      CustomCardModel(() {
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => const PalemReadingScreen()));
        Navigator.of(context).push(PageTransition(child:const PalemReadingScreen(), type: PageTransitionType.fade,duration: const Duration(milliseconds: 1500)));
      }, title: "Palm Reading", image: AppImages.palemreadingLogo),
    ];
  }

  static List getCardPart3(BuildContext context) {
    return [
      CustomCardModel(() {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const TravelTimeScreen()));
      }, title: "Time Travel", image: AppImages.travellogo),
      CustomCardModel(() {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AstrologyMainPage()));
      }, title: "Astrology", image: AppImages.astrologylogo),
      CustomCardModel(() {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const BiorhythmPage()));
      }, title: "Biorythm", image: AppImages.biorythmlogo),
    ];
  }

  static List getCardPart4(BuildContext context) {
    return [
      CustomCardModel(() {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const DreamMeaningMainView()));
      }, title: "Dream Meaning", image: AppImages.dream),
      CustomCardModel(() {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Numerology()));
      }, title: "Numerology", image: AppImages.numerologyLogo),
      CustomCardModel(() {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const KundliScreen()));
      }, title: "Kundli", image: AppImages.kundlilogo),
    ];
  }

  static List getCardPart5(BuildContext context) {
    return [
      CustomCardModel(() {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const MeditationScreen()));
      }, title: "Meditation", image: AppImages.meditationLogo),
      CustomCardModel(() {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const EmotionScreen()));
      }, title: "Emotional", image: AppImages.emotionLogo),
    ];
  }
}
