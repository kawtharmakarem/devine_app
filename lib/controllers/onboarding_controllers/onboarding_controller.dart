import 'package:divinecontrol/screens/auth_screens/main_cards_page.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../../models/onboarding_models/on_boarding_model.dart';
import '../../utils/app_colors.dart';
import '../../widgets/onboarding_widgets/onboarding_page.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();

  RxInt currentPage = 0.obs;
  final pages = [
    OnBoardingPage(
      onBoardingModel: OnBoardingModel(
        image: AppImages.onboardingcard,
        subTitle: "We provide all kinds of Astrology services like, Face Reading , Palm Reading, Bio-Rythm , Dream Meaning, Time Travel, Meditation, Tarot Reading, Numerology, Future Predictions, Horoscopes, Emotional Wellbeing and much more !!!",
        title: "Who we Are ?",
        // subTitle: "Divine Connection is best astrology website for online Astrology predictions. With a gigantic pool of Vedic astrologers, Tarot readers, Numerologists, Vastu experts and more....",
        bgColor: AppColors.primary,
      ),
    ),
    OnBoardingPage(
      onBoardingModel: OnBoardingModel(
        image: AppImages.onboardingfirst,
        title: "What do we Do ?",
        subTitle: "We provide highly accurate, precise and well research astrological Solution and Services.\nWe have used AL/ ML technology by analysing your thoughts, emotions, and behaviors with tools to navigate life's complexities.",
      // subTitle: "We provide astrological solutions to the people who are facing problems.\nWe give direction to their life with the assistance of our trusted and certified astrologers.\nWe provide hightly accurate ,precise and well researched astrological content with AL/ML technology by equipping your thoughts, emotions, and behaviors with tools to navigate life's complexities.",
        bgColor: AppColors.lightPurple2,
      ),
    ),
    OnBoardingPage(
      onBoardingModel: OnBoardingModel(
        image: AppImages.onboardingsecond,
        title: "Our Vision and Mission:",
        subTitle: "We are helping people and we have the best Al powered Personalised Solution to learn & share the Astrological, spiritual and well-being experiences in transparent and trustworthy manner on our platform.",
      // subTitle: "We are working to build the world's largest community of people who want to learn & share Astrological, spiritual and well-being experiences on a single platform in a transparent, trustworthy and credible manner.\nWe are growing each day and offer the best Al powered Personalised solution to our users",
        bgColor: AppColors.lightPurple1,
      ),
    )
  ];
  void onPageChangeCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
  }

  skip() {
    Get.off(() => const MainCardsPage(),
        transition: Transition.zoom,
        duration: const Duration(seconds: AppConstants.durationSecond));
  }

  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    if (nextPage == 3) {
      Get.off(() => const MainCardsPage(),
          transition: Transition.zoom,
          duration: const Duration(seconds: 2));
    } else {
      controller.animateToPage(page: nextPage);
    }
  }
 
}
