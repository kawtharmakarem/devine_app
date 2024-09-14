import 'package:carousel_slider/carousel_slider.dart';
import 'package:divinecontrol/admin_panel/admin_panel_widgets/custom_question_card.dart';
import 'package:divinecontrol/screens/emotion_screens/emotion_screen.dart';
import 'package:divinecontrol/screens/palemreading_screens/palemreading_screen.dart';
import 'package:divinecontrol/screens/traveltime_screens/traveltime_screen.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../models/homepage_models/carousel_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class QestionSection extends StatefulWidget {
  const QestionSection({super.key});

  @override
  State<QestionSection> createState() => _QestionSectionState();
}

class _QestionSectionState extends State<QestionSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Icon(FontAwesomeIcons.question,size: 40,color: AppColors.myLightRed,),
            Text('Swipe Questions',style: AppStyles.styleRufinaBold32(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 28)),),
          ],
        ),
        getCarouselSection(sliders)
      ],
    );
  }

   Widget getCarouselSection(List<CarouselModel>? sliders) {
    if (sliders != null) {
      return CarouselSlider(
          items: sliders
              .map((carouselModel) => SizedBox(
                    width: double.infinity,
                    child: CustomQuestionCard(question: carouselModel.title,onTap: carouselModel.onTap,),
                  ))
              .toList(),
          options: CarouselOptions(
              height: 50,
              autoPlay: false,
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
        onTap: () => Get.to(()=>PalemReadingScreen(),transition: Transition.size,duration: const Duration(seconds: AppConstants.durationSecond)),
        image: AppImages.carouselPalmread),
    CarouselModel(
        title: "Glimpse Into The Future", image: AppImages.carouselFuture,onTap: () => Get.to(()=>TravelTimeScreen(),transition: Transition.size,duration: const Duration(seconds: AppConstants.durationSecond)),),
    CarouselModel(
        title: "Ever Wondered What Your Dreams are telling You?",
        image: AppImages.carouselDream),
    CarouselModel(
        title: "Uncover the Number that shape your Destiny?",
        image: AppImages.carouselNumero),
    CarouselModel(
        title: "How Can I Control My Anger?", image: AppImages.carouselAnger,onTap: () => Get.to(()=>EmotionScreen(),transition: Transition.size,duration: const Duration(seconds: AppConstants.durationSecond)),),
  ];

  
}

