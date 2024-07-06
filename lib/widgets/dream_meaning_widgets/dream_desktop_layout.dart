import 'package:divinecontrol/widgets/dream_meaning_widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../models/dream_meaning.models/custom_card_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
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
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
        body: AnimationLimiter(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width / 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                    flex: 4,
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      // childAspectRatio: 1.7,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children:
                          List.generate(getCardPart1(context).length, (index) {
                        return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(seconds: 2),
                            columnCount: 3,
                            child: ScaleAnimation(
                                child: FadeInAnimation(
                                    child: CustomCard(
                                        cardModel:
                                            getCardPart1(context)[index]))));
                      }),
                    ),
                  ),
                ],
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                transform: Matrix4.translationValues(
                    _startAnimation ? 0 : width, 0, 0),
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    //  gradient: LinearGradient(colors: [AppColors.primary,AppColors.primary.withOpacity(0.7)]),
                    color: AppColors.primary.withOpacity(0.7)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: width * 0.15,
                        child: const Divider(
                          color: AppColors.black,
                          thickness: 1,
                        )),
                    Text(
                      'Swiping Qestions',
                      style: AppStyles.styleBold24(context).copyWith(
                          color: AppColors.darkPrimary,
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 40)),
                    ),
                    SizedBox(
                        width: width * 0.15,
                        child: const Divider(
                          color: AppColors.black,
                          thickness: 1,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: height / 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        curve: Curves.fastOutSlowIn,
                        transform: Matrix4.translationValues(
                            _startAnimation ? 0 : width, 0, 0),
                        child: Text(
                          'Read your future now!',
                          style: AppStyles.styleBold24(context).copyWith(
                              fontSize: getResponsiveFontSizeText(context,
                                  fontSize: 32)),
                        )),
                  ),
                  Expanded(
                    flex: 3,
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      //childAspectRatio: 1.7,
                      children:
                          List.generate(getCardPart2(context).length, (index) {
                        return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(seconds: 2),
                            columnCount: 3,
                            child: ScaleAnimation(
                                child: FadeInAnimation(
                                    child: CustomCard(
                                        cardModel:
                                            getCardPart2(context)[index]))));
                      }),
                    ),
                  ),
                ],
              ),
              SizedBox(
                  width: width,
                  child: const Divider(
                    color: AppColors.black,
                    thickness: 1,
                    endIndent: 30,
                    indent: 30,
                  )),
              SizedBox(
                height: height / 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        curve: Curves.fastOutSlowIn,
                        transform: Matrix4.translationValues(
                            _startAnimation ? 0 : width, 0, 0),
                        child: Text(
                          'Embark on your Journey!',
                          style: AppStyles.styleBold24(context).copyWith(
                              fontSize: getResponsiveFontSizeText(context,
                                  fontSize: 32)),
                        )),
                  ),
                  Expanded(
                    flex: 3,
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      //childAspectRatio: 1.7,
                      children:
                          List.generate(getCardPart3(context).length, (index) {
                        return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(seconds: 2),
                            columnCount: 3,
                            child: ScaleAnimation(
                                child: FadeInAnimation(
                                    child: CustomCard(
                                        cardModel:
                                            getCardPart3(context)[index]))));
                      }),
                    ),
                  ),
                ],
              ),
              SizedBox(
                  width: width,
                  child: const Divider(
                    color: AppColors.black,
                    thickness: 1,
                    endIndent: 30,
                    indent: 30,
                  )),
              SizedBox(
                height: height / 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        curve: Curves.fastOutSlowIn,
                        transform: Matrix4.translationValues(
                            _startAnimation ? 0 : width, 0, 0),
                        child: Text(
                          "Let's take you to the another Dimension!",
                          textAlign: TextAlign.center,
                          style: AppStyles.styleBold24(context).copyWith(
                              fontSize: getResponsiveFontSizeText(context,
                                  fontSize: 32)),
                        )),
                  ),
                  Expanded(
                    flex: 3,
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      // childAspectRatio: 1.7,
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
                  ),
                ],
              ),
              SizedBox(
                  width: width,
                  child: const Divider(
                    color: AppColors.black,
                    thickness: 1,
                    endIndent: 30,
                    indent: 30,
                  )),
              SizedBox(
                height: height / 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        curve: Curves.fastOutSlowIn,
                        transform: Matrix4.translationValues(
                            _startAnimation ? 0 : width, 0, 0),
                        child: Text(
                          'Nourish Your Soul..',
                          style: AppStyles.styleBold24(context).copyWith(
                              fontSize: getResponsiveFontSizeText(context,
                                  fontSize: 32)),
                        )),
                  ),
                  Expanded(
                    flex: 3,
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2, //3
                      //childAspectRatio: 1.7,
                      children:
                          List.generate(getCardPart5(context).length, (index) {
                        return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(seconds: 2),
                            columnCount: 3,
                            child: ScaleAnimation(
                                child: FadeInAnimation(
                                    child: CustomCard(
                                        cardModel:
                                            getCardPart5(context)[index]))));
                      }),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }

  static List getCardPart1(BuildContext context) {
    return [
      CustomCardModel(
          title: "Horoscope", image: AppImages.horoscopelogo, index: 0),
      CustomCardModel(title: "Kundli", image: AppImages.kundlilogo, index: 1),
      CustomCardModel(
          title: "Fortune Wheel", image: AppImages.fortunewheellogo, index: 2),
    ];
  }

  static List getCardPart2(BuildContext context) {
    return [
      CustomCardModel(
          title: "Tarot Reading", image: AppImages.tarotLogo, index: 3),
      CustomCardModel(
          title: "Face Reading", image: AppImages.facelogo, index: 4),
      CustomCardModel(
          title: "Palm Reading", image: AppImages.palemreadingLogo, index: 5),
    ];
  }

  static List getCardPart3(BuildContext context) {
    return [
      CustomCardModel(
          title: "Time Travel", image: AppImages.travellogo, index: 6),
      CustomCardModel(
          title: "Astrology", image: AppImages.astrologylogo, index: 7),
      CustomCardModel(
          title: "Biorythm", image: AppImages.biorythmlogo, index: 8),
    ];
  }

  static List getCardPart4(BuildContext context) {
    return [
      CustomCardModel(title: "Dream Meaning", image: AppImages.dream, index: 9),
      CustomCardModel(
          title: "Numerology", image: AppImages.numerologyLogo, index: 10),
      CustomCardModel(
          title: "Love Check", image: AppImages.checklovelogo, index: 11),
    ];
  }

  static List getCardPart5(BuildContext context) {
    return [
      CustomCardModel(
          title: "Meditation", image: AppImages.meditationLogo, index: 12),
      CustomCardModel(
          title: "Emotional Support", image: AppImages.emotionLogo, index: 13),
    ];
  }
}
