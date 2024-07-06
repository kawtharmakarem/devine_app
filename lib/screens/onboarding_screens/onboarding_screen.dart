import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../controllers/onboarding_controllers/onboarding_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class OnBoardingScreen extends StatelessWidget {
   OnBoardingScreen({super.key});

 
   final OnBoardingController controller=OnBoardingController();

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: controller.pages,
            liquidController: controller.controller,
            onPageChangeCallback:controller.onPageChangeCallback ,
            slideIconWidget:const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
          ),
          Positioned(
            bottom: 60,
            child: 
            OutlinedButton(
              onPressed: () =>controller.animateToNextSlide(),
              style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.black26),
                  shape:const CircleBorder(),
                  padding:const EdgeInsets.all(10),
                  backgroundColor: Colors.white),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: AppColors.darkPrimary, shape: BoxShape.circle),
                child: const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 30,),
              ),
            ),
          )
       , Positioned(
        top: 50,
        right: 20,
        child: TextButton(
        onPressed: ()=>controller.skip(),
        child: Text('Skip',style: AppStyles.styleRegular20(context)),)),
        Obx(
          ()=> Positioned(
            bottom: 10,
            child: AnimatedSmoothIndicator(
              
              effect: const WormEffect(
                
                dotColor: Colors.grey,
                activeDotColor: AppColors.darkPrimary,
                
          
               // dotHeight: 5
              ),
              activeIndex: controller.currentPage.value, count: 3)),
        )
        ],
      ),
    );
  }


}

