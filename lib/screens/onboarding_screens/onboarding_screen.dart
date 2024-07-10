import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../controllers/onboarding_controllers/onboarding_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final OnBoardingController controller = OnBoardingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: controller.pages,
            //waveType: WaveType.circularReveal,
            liquidController: controller.controller,
            onPageChangeCallback: controller.onPageChangeCallback,
            slideIconWidget: Icon(
              Icons.arrow_back_ios,
              size: width < AppConstants.maxMobileWidth
                  ? 30
                  : width < AppConstants.maxTabletWidth
                      ? 50
                      : 60,
            ),
            enableSideReveal: true,
          ),
          Positioned(
            bottom: width < AppConstants.maxMobileWidth ? 40 : 60,
            child: OutlinedButton(
              onPressed: () => controller.animateToNextSlide(),
              style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.black26),
                  shape: const CircleBorder(),
                  padding: EdgeInsets.all(
                      width < AppConstants.maxMobileWidth ? 10 : 20),
                  backgroundColor: Colors.white),
              child: Container(
                padding: EdgeInsets.all(
                    width < AppConstants.maxMobileWidth ? 10 : 20),
                decoration: const BoxDecoration(
                    color: AppColors.darkPrimary, shape: BoxShape.circle),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: width < AppConstants.maxMobileWidth ? 30 : 50,
                ),
              ),
            ),
          ),
          Positioned(
              top: 30,
              right: 20,
              child: TextButton(
                onPressed: () => controller.skip(),
                child: Text('Skip',
                    style: AppStyles.styleRegular20(context).copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: getResponsiveFontSizeText(context,
                            fontSize: width < AppConstants.maxMobileWidth
                                ? 20
                                : 32))),
              )),
          Obx(
            () => Positioned(
                bottom: 10,
                child: AnimatedSmoothIndicator(
                    effect: WormEffect(
                      spacing: width < AppConstants.maxMobileWidth ? 15 : 30,
                      dotColor: Colors.grey,
                      activeDotColor: AppColors.darkPrimary,
                      dotHeight: width < AppConstants.maxMobileWidth
                          ? 15
                          : width < AppConstants.maxTabletWidth
                              ? 30
                              : 35,
                      dotWidth: width < AppConstants.maxMobileWidth
                          ? 15
                          : width < AppConstants.maxTabletWidth
                              ? 30
                              : 35,
                    ),
                    activeIndex: controller.currentPage.value,
                    count: 3)),
          )
        ],
      ),
    );
  }
}
