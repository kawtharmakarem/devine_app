import 'package:divinecontrol/screens/auth_screens/main_cards_page.dart';
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
        subTitle: "We provide all kinds of Astrology services like, Future Predictions, Horoscopes, Face Reading , Palm Reading, Biorythm , Dream Interpretation, Emotional Support, Time Travel, Meditation, Tarot Reading, Numerology, Birth chart and Compatibility Readings, Horoscopes, Financial Planning, Career Guidances, Psychology & Emotional Wellbeing services and much more !!!\nlet us be your guide on this extraordinary voyage of self-discovery",
        title: "Who we Are ?",
        // subTitle: "Divine Connection is best astrology website for online Astrology predictions. With a gigantic pool of Vedic astrologers, Tarot readers, Numerologists, Vastu experts and more....",
        bgColor: AppColors.primary,
      ),
    ),
    OnBoardingPage(
      onBoardingModel: OnBoardingModel(
        image: AppImages.onboardingfirst,
        title: "What do we Do ?",
      subTitle: "We provide astrological solutions to the people who are facing problems.\nWe give direction to their life with the assistance of our trusted and certified astrologers.\nWe provide hightly accurate ,precise and well researched astrological content with AL/ML technology by equipping your thoughts, emotions, and behaviors with tools to navigate life's complexities.",
        bgColor: AppColors.lightPurple2,
      ),
    ),
    OnBoardingPage(
      onBoardingModel: OnBoardingModel(
        image: AppImages.onboardingsecond,
        title: "Our Vision and Mission:",
        // subTitle: "We provide all kinds of Astrology services like, Future Predictions, Horoscopes, Face Reading , Palm Reading, Biorythm , Dream Interpretation, Emotional Support, Time Travel, Meditation, Tarot Reading, and many more !!!",
       subTitle: "We are working to build the world's largest community of people who seek, learn and share astrological, spiritual and well-being experiences on a single platform in a transparent, trustworthy and credible manner.\nDivine Connection continues to grow with each passing day, so is growing our potential and urge to offer the best of astrology to our users. We are working to build the world's largest community of spiritual and wellbeing experts, and we hope you become a part of this journey one prediction at a time.",
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
        duration: const Duration(seconds: 2));
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
