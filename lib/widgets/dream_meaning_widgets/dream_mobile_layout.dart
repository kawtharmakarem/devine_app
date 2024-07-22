import 'package:carousel_slider/carousel_slider.dart';
import 'package:divinecontrol/widgets/dream_meaning_widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../models/dream_meaning.models/custom_card_model.dart';
import '../../models/homepage_models/carousel_model.dart';
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
                // SizedBox(
                //   height: width / 20,
                // ),
                // AnimatedContainer(
                //   duration: const Duration(seconds: 2),
                //   curve: Curves.fastOutSlowIn,
                //   transform: Matrix4.translationValues(
                //       _startAnimation ? 0 : width, 0, 0),
                //   padding: const EdgeInsets.symmetric(vertical: 20),
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(8),
                //       color: AppColors.primary.withOpacity(0.7)),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       SizedBox(
                //           width: width * 0.15,
                //           child: const Divider(
                //             color: AppColors.darkPrimary,
                //             thickness: 1,
                //           )),
                //       Text(
                //         'Swiping Qestions',
                //         style: AppStyles.styleBold24(context)
                //             .copyWith(color: AppColors.darkPrimary),
                //       ),
                //       SizedBox(
                //           width: width * 0.15,
                //           child: const Divider(
                //             color: AppColors.darkPrimary,
                //             thickness: 1,
                //           ))
                //     ],
                //   ),
                // ),
                getCarouselSection(
                  sliders,
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
                              cardModel: getCardPart4(context)[index]),
                        ),
                      ),
                    );
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
                  crossAxisCount: 2, //3
                  childAspectRatio: 1, //2 / 2.7,
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

  Widget getCarouselSection(List<CarouselModel>? sliders) {
    if (sliders != null) {
      return CarouselSlider(

          items: sliders
              .map((carouselModel) => SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side:
                            BorderSide(color: AppColors.darkPrimary, width: 1),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                carouselModel.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                              top: 2,
                              left: 5,
                              right: 5,
                              child: Container(
                                //padding: const EdgeInsets.all(5),
                                //color: Colors.black54,
                                child: Text(
                                  carouselModel.title,
                                  style: AppStyles.styleRufinaBold32(context).copyWith(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w900,backgroundColor: Colors.black54,
                                      fontSize: getResponsiveFontSizeText(context,
                                          fontSize: 18)),
                                  textAlign: TextAlign.center,
                                ),
                              ))
                        ],
                      ),
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
            autoPlayAnimationDuration: Duration(seconds: 5),
             reverse: true,
              height: 170, //190
              autoPlay: true,
              enableInfiniteScroll: true,
              enlargeCenterPage: true));
    } else {
      return Container();
    }
  }

  static final sliders = [
    CarouselModel(
        title: "When Will I Expect A Baby?", image: AppImages.carouselBaby),
    CarouselModel(
        title: "Does My Crush Loves me?", image: AppImages.carouselRealtion),
    CarouselModel(
        title: "What Secrets Does Your Palm Holds?",
        image: AppImages.carouselPalmread),
    CarouselModel(
        title: "Glimpse Into The Future", image: AppImages.carouselFuture),
    CarouselModel(
        title: "Ever Wondered What Your Dreams are telling You?",
        image: AppImages.carouselDream),
    CarouselModel(
        title: "Uncover the Number that shape your Destiny?",
        image: AppImages.carouselNumero),
    CarouselModel(
        title: "How Can I Control My Anger?", image: AppImages.carouselAnger),
  ];

  static List getCardPart1(BuildContext context) {
    return [
      CustomCardModel(
          //   () {
          //   // Navigator.of(context).push(
          //   //     MaterialPageRoute(builder: (context) => const HoroscopeScreen()));
          //   Get.to(() => const HoroscopeScreen(),
          //       transition: Transition.zoom, duration: const Duration(seconds: 1));
          // },
          title: "Horoscope",
          image: AppImages.horoscopelogo,
          index: 0),

      //this is place of kundle
      CustomCardModel(
          //   () {
          //   // Navigator.of(context).push(
          //   //     MaterialPageRoute(builder: (context) => const KundliScreen()));
          //   Get.to(() => const KundliScreen(),
          //       transition: Transition.zoom, duration: const Duration(seconds: 1));
          // },
          title: "Kundli",
          image: AppImages.kundlilogo,
          index: 1),
      CustomCardModel(
          //   () {
          //   // Navigator.of(context).push(
          //   //     MaterialPageRoute(builder: (context) => const MyFortuneWheel()));
          //   Get.to(() => const MyFortuneWheel(),
          //       transition: Transition.zoom, duration: const Duration(seconds: 1));
          // },
          title: "Fortune Wheel",
          image: AppImages.fortunewheellogo,
          index: 2),
    ];
  }

  static List getCardPart2(BuildContext context) {
    return [
      CustomCardModel(
          //   () {

          //   Get.to(() => const MainTarotReadView(),
          //       transition: Transition.zoom, duration: const Duration(seconds: 1));
          // },
          title: "Tarot Reading",
          image: AppImages.tarotLogo,
          index: 3),
      CustomCardModel(
          //   () {
          //   // Navigator.of(context).push(
          //   //     MaterialPageRoute(builder: (context) => const FaceReadingView()));
          //   Get.to(() => const FaceReadingView(),
          //       transition: Transition.zoom,
          //       duration: const Duration(seconds: 1));
          // },
          title: "Face Reading",
          image: AppImages.facelogo,
          index: 4),
      CustomCardModel(
          //   () {
          //   // Navigator.of(context).push(MaterialPageRoute(
          //   //     builder: (context) => const PalemReadingScreen()));
          //   Get.to(() => const PalemReadingScreen(),
          //       transition: Transition.zoom, duration: const Duration(seconds: 1));
          // },
          title: "Palm Reading",
          image: AppImages.palemreadingLogo,
          index: 5),
    ];
  }

  static List getCardPart3(BuildContext context) {
    return [
      CustomCardModel(
          //   () {
          //   // Navigator.of(context).push(
          //   //     MaterialPageRoute(builder: (context) => const TravelTimeScreen()));
          //   Get.to(()=>const TravelTimeScreen(),transition: Transition.zoom,duration: const Duration(seconds: 1));
          // },
          title: "Time Travel",
          image: AppImages.travellogo,
          index: 6),
      CustomCardModel(
          //   () {
          //   // Navigator.of(context).push(
          //   //     MaterialPageRoute(builder: (context) => const AstrologyMainPage()));
          //   Get.to(()=>const AstrologyMainPage(),transition: Transition.zoom,duration: const Duration(seconds: 1));
          // },
          title: "Astrology",
          image: AppImages.astrologylogo,
          index: 7),
      CustomCardModel(
          //   () {
          //   // Navigator.of(context).push(
          //   //     MaterialPageRoute(builder: (context) => const BiorhythmPage()));
          //   Get.to(()=>const BiorhythmPage(),transition: Transition.zoom,duration: const Duration(seconds: 1));
          // },
          title: "Biorythm",
          image: AppImages.biorythmlogo,
          index: 8),
    ];
  }

  static List getCardPart4(BuildContext context) {
    return [
      CustomCardModel(
          //   () {
          //   // Navigator.of(context).push(MaterialPageRoute(
          //   //     builder: (context) => const DreamMeaningMainView()));
          //   Get.to(()=>const DreamMeaningMainView(),transition: Transition.zoom,duration: const Duration(seconds: 1));
          // },
          title: "Dream Meaning",
          image: AppImages.dream,
          index: 9),
      CustomCardModel(
          //   () {
          //   // Navigator.of(context)
          //   //     .push(MaterialPageRoute(builder: (context) => const Numerology()));
          //   Get.to(()=>const Numerology(),transition: Transition.zoom,duration: const Duration(seconds: 1));
          // },
          title: "Numerology",
          image: AppImages.numerologyLogo,
          index: 10),

      //this is the place of check love
      CustomCardModel(
          //   () {
          //   // Navigator.of(context)
          //   //     .push(MaterialPageRoute(builder: (context) => const Flower()));
          //   Get.to(() => const Flower(),
          //       transition: Transition.zoom, duration: const Duration(seconds: 1));
          // },
          title: "Love Check",
          image: AppImages.checklovelogo,
          index: 11),
    ];
  }

  static List getCardPart5(BuildContext context) {
    return [
      CustomCardModel(
          //   () {
          //   // Navigator.of(context).push(
          //   //     MaterialPageRoute(builder: (context) => const MeditationScreen()));
          //   Get.to(()=>const MeditationScreen(),transition: Transition.zoom,duration: const Duration(seconds: 1));
          // },
          title: "Meditation",
          image: AppImages.meditationLogo,
          index: 12),
      CustomCardModel(
          //   () {
          //   // Navigator.of(context).push(
          //   //     MaterialPageRoute(builder: (context) => const EmotionScreen()));
          //   Get.to(()=>const EmotionScreen(),transition: Transition.zoom,duration:const Duration(seconds: 1));
          // },
          title: "Emotional Support",
          image: AppImages.emotionLogo,
          index: 13),
    ];
  }
}
