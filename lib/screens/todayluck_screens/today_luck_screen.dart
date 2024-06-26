import 'dart:async';
import 'dart:math' as math;
import 'package:audioplayers/audioplayers.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class TodaysLuckScreen extends StatefulWidget {
  const TodaysLuckScreen({super.key});

  @override
  State<TodaysLuckScreen> createState() => _TodaysLuckScreenState();
}

class _TodaysLuckScreenState extends State<TodaysLuckScreen> {
  late AudioPlayer player;
  bool isVisible = false;
  int index = 0;
 
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        
        body: AnimatedCrossFade(
          firstChild: getCloseBox(context, width),
          secondChild:width<AppConstants.maxTabletWidth? getMobileOpenBox(context, width):getDesktopOpenBox(context, width),
          crossFadeState:
              !isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 300),
        ),
      ),
    );
  }

  Padding getMobileOpenBox(BuildContext context, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FutureBuilder(
            future: Future.delayed(const Duration(milliseconds: 3000)),
            builder: (context,snapshot)=>
             
              snapshot.connectionState==ConnectionState.done? Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.lightOrange.withOpacity(0.5)
                ),
                child: Text(
                  quotes[index],
                  style: width < AppConstants.maxMobileWidth
                      ? AppStyles.stylePacificoRegular28(context)
                      : AppStyles.stylePacificoRegular28(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 36)),
                  textAlign: TextAlign.center,
                ),
              ):const SizedBox(width: double.maxFinite,)
            
          ),
          Transform.scale(
              scale: 1.5,
              child: Lottie.asset(AppImages.obox, fit: BoxFit.fill,repeat: false)),
          ElevatedButton(
            onPressed: () {
              setState(() {
                index = math.Random().nextInt(quotes.length-1);

               // isVisible = !isVisible;
               Navigator.popAndPushNamed(context, "todayluckroute");
                
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.myGray,
              padding: EdgeInsets.symmetric(
                  horizontal: width / 10, vertical: width / 40),
            ),
            child: Text(
              'Retry',
              style: width < AppConstants.maxMobileWidth
                  ? AppStyles.styleBold24(context)
                  : AppStyles.styleBold24(context).copyWith(
                      fontSize:
                          getResponsiveFontSizeText(context, fontSize: 32)),
            ),
          ),
        ],
      ),
    );
  }

  Padding getDesktopOpenBox(BuildContext context, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Transform.scale(
                    scale: 1.5,
                    child: Lottie.asset(AppImages.obox, fit: BoxFit.fill,repeat: false)),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      index = math.Random().nextInt(quotes.length-1);
                                     Navigator.popAndPushNamed(context, "todayluckroute");

                
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.myGray,
                    padding: EdgeInsets.symmetric(
                        horizontal: width / 10, vertical: width / 40),
                  ),
                  child: Text(
                    'Retry',
                    style: AppStyles.styleBold24(context).copyWith(
                            fontSize:
                                getResponsiveFontSizeText(context, fontSize: 32)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: Future.delayed(const Duration(milliseconds: 3000)),
              builder: (context,snapshot) =>snapshot.connectionState==ConnectionState.done?
                 Container(
                  width: width*0.4,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.lightOrange.withOpacity(0.5)),
                    child: Text(
                      quotes[index],
                      style: AppStyles.stylePacificoRegular28(context).copyWith(
                              fontSize:
                                  getResponsiveFontSizeText(context, fontSize: 40)),
                      textAlign: TextAlign.center,
                    )):Container()
              
            ),
          ),
        ],
      ),
    );
  }


  GestureDetector getCloseBox(BuildContext context, double width) {
    return GestureDetector(
        onTap: () {
          setState(() {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await player.setSource(AssetSource('sounds/sound.m4a'));
              await player.resume();
            });
            isVisible = !isVisible;
          });
        },
        child: width < AppConstants.maxTabletWidth
            ? getMobileCloseBoxContent(width, context)
            : getDesktopCloseBoxContent(width, context));
  }

  Column getMobileCloseBoxContent(double width, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(color: AppColors.primary),
          child: Text(
            'Tap a box',
            style: width < AppConstants.maxMobileWidth
                ? AppStyles.stylePacificoRegular28(context)
                : AppStyles.stylePacificoRegular28(context).copyWith(
                    fontSize: getResponsiveFontSizeText(context, fontSize: 36)),
            textAlign: TextAlign.center,
          ),
        ),
        Transform.scale(scale: 1.2, child: Lottie.asset(AppImages.cbox)),
      ],
    );
  }

  Widget getDesktopCloseBoxContent(double width, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
                Transform.scale(scale: 1.2, child: Lottie.asset(AppImages.cbox)),

        Container(
          padding: EdgeInsets.all(width * 0.025),
          decoration: BoxDecoration(
              color: AppColors.primary, borderRadius: BorderRadius.circular(8)),
          child: Text(
            'Tap a box',
            style: AppStyles.stylePacificoRegular28(context).copyWith(
                fontSize: getResponsiveFontSizeText(context, fontSize: 50)),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  static List<String> quotes = [
    "The only way to do great work is to love what you do.",
    "If you can't explain it simply, you don't understand it well enough.",
    "A good friend is someone who knows your heart and still holds your hand.",
    "The only way to do great work is to love what you do.",
    "If you can't explain it simply, you don't understand it well enough.",
    "A good friend is someone who knows your heart and still holds your hand",
    "If you can't explain it simply, you don't understand it well enough.",
    "A good friend is someone who knows your heart and still holds your hand.",
    "The only way to do great work is to love what you do"
  ];
}
