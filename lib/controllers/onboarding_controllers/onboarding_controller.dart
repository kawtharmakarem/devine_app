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
        title: "Page 1",
        subTitle: "Read Your Future Now!",
        bgColor: AppColors.primary,
      ),
    ),
    OnBoardingPage(
      onBoardingModel: OnBoardingModel(
        image: AppImages.onboardingfirst,
        title: "Page 2",
        subTitle: "Embark On Your Journey!",
        bgColor: AppColors.lightPurple2,
      ),
    ),
    OnBoardingPage(
      onBoardingModel: OnBoardingModel(
        image: AppImages.onboardingsecond,
        title: "Page 3",
        subTitle: "Read Your Future Now!",
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
