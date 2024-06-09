import 'dart:async';
import 'dart:developer';

import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/app_colors.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';
import '../../widgets/fortunewheel_widgets/custom_indicator.dart';

class MyFortuneWheel extends StatefulWidget {
  const MyFortuneWheel({super.key});

  @override
  State<MyFortuneWheel> createState() => _MyFortuneWheelState();
}

class _MyFortuneWheelState extends State<MyFortuneWheel> {
  StreamController<int> selected = StreamController<int>.broadcast();
 late int selecteIndex ;

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    final colors = [
      AppColors.white,
      AppColors.green,
      AppColors.red,
      AppColors.yello,
      AppColors.black,
      AppColors.purple,
      AppColors.blue,
      AppColors.orang
    ];
    final descriptions = [
      "White represents purity, clarity, and innocence. It embodies a sense of openness and possibility, like a blank canvas awaiting a masterpiece. White encourages simplicity, offering a fresh start and a clean slate. It symbolizes peace, light, and the potential for new beginnings. Reflect on a time when you felt the serene tranquility associated with white. Was it during a quiet moment of meditation, the blissful stillness of a snowy landscape, or the feeling of clarity that comes with letting go of burdens?",
      "Green, the verdant heart of the rainbow, is a breath of fresh air. Imagine standing amidst a lush forest, the sunlight dappling through the leaves, and the smell of damp earth filling your senses. That's the peace and harmony green represents. It's the nurturing energy of nature, the potential for growth in new beginnings, and the sense of balance that brings tranquility to your life. When did you last feel that sense of calm associated with green? Was it during a nature walk, the quiet focus of tending to your garden, or the feeling of growth in a new relationship?",
      "Red isn't just a color; it's a primal force. Imagine a crackling bonfire, its flames licking the night sky – that's the passionate energy of red. It represents the intense love that burns between soulmates, the raw courage that lets you face your fears, and the unbridled determination that fuels your greatest achievements. Think of a personal experience where you felt this red energy surging within you. Was it a heart-pounding moment of competition, a passionate declaration of love, or the burning desire to achieve a long-held goal?",
      "Yellow, the color of sunshine, bathes us in warmth and optimism. Imagine a field of sunflowers, their faces turned towards the sun, radiating pure happiness. That's the essence of yellow – pure joy, childlike wonder, and the unwavering belief in a brighter tomorrow. It's the feeling of pure contentment on a perfect summer day, the intellectual stimulation that comes with learning something new, or the simple act of helping someone and witnessing the resulting joy. Reflect on a time when you felt that yellow sunshine radiate from within you.",
      "Black is the color of mystery, depth, and power. It holds the secrets of the universe within its infinite darkness, inviting introspection and exploration. Black represents strength, elegance, and the enigmatic allure of the unknown. It symbolizes resilience, absorbing and transforming energy like the night sky swallowing the light. Reflect on a time when you embraced the darkness and found hidden strength within. Was it during a challenging period of growth, the quiet solitude of a starlit night, or the moment you confronted your fears and emerged stronger?",
      "Violet, the final color, blends the fiery passion of red with the calming peace of blue. Imagine a majestic butterfly emerging from its chrysalis, its wings shimmering with an otherworldly beauty. That's the transformative power of violet – creativity, inspiration, and the potential for limitless change. Think of a time you experienced a personal transformation. Was it a new experience that opened your eyes to a different perspective, the moment you decided to chase a lifelong dream, or the feeling of boundless potential awakening within you?",
      "Blue, the color of the vast ocean and endless sky, evokes feelings of trust and serenity. Imagine gazing upon a star-studded night sky, feeling a sense of awe and connection to something much larger than yourself. That's the depth of blue – wisdom, loyalty, and a sense of peace that washes over you like gentle waves. Think of a time you felt that blue tranquility. Was it during a heartfelt conversation with a trusted friend, the calming rhythm of your breath during meditation, or the feeling of security knowing you are loved and supported?",
      "Orange is the vibrant child of red and yellow, brimming with enthusiasm and a zest for life. Picture a ripe orange just plucked from the tree, its juicy explosion mirroring the burst of creative energy orange represents. It's the spark that ignites your imagination, the uninhibited joy of self-expression, and the playful spirit that fuels your most innovative ideas. When did you last experience that orange spark? Was it while painting a masterpiece, composing a lively song, or simply coming up with a brilliant solution to a problem?",
    ];
    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
      appBar: AppBar(
          title: Text(
            "Fortune Wheel",
            style: width < AppConstants.maxMobileWidth
                ? AppStyles.styleBold24(context)
                    .copyWith(color: AppColors.darkPrimary)
                : AppStyles.styleBold24(context).copyWith(
                    color: AppColors.darkPrimary,
                    fontSize: getResponsiveFontSizeText(context, fontSize: 40)),
          ),
          backgroundColor: AppColors.lightPurple1,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(AppImages.leftArrow),
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width < AppConstants.maxMobileWidth ? 10 : 40,
            vertical: width < AppConstants.maxTabletWidth ? 5 : 20),
        child: GestureDetector(
          onTap: () {
            selecteIndex=Fortune.randomInt(0, colors.length);
            setState(() {
              selected.add(selecteIndex);
            });
            log(selecteIndex.toString());
          },
          child: Column(
            children: [
              Expanded(
                  child: Container(
                decoration: ShapeDecoration(
                  shape: CircleBorder(
                      side: BorderSide(
                          width: width < AppConstants.maxMobileWidth ? 10 : 20,
                          color: AppColors.borderColor)),
                ),
                child: FortuneWheel(
                  selected: selected.stream,
                  items: [
                    for (var it in colors)
                      FortuneItem(
                          child: Container(
                        color: it,
                      ))
                  ],
                  physics: CircularPanPhysics(
                    duration: const Duration(seconds: 1),
                      curve: Curves.decelerate),
                     duration:const Duration(seconds: 20),

                  // onFling: () {
                  //   setState(() {});
                  //   selected.add(0);
                  // },
                  onAnimationStart: () {
                    setState(() {
                      
                    });
                  },
                  onAnimationEnd: () {
                    selected.stream.listen((event) {
                      setState(() {
                        selecteIndex = event;
                      });
                    });

                    getDialogWidget(context, descriptions);
                  },
                  onFocusItemChanged: (value) {},
                  indicators: const [
                    FortuneIndicator(
                        alignment: Alignment.center,
                        child: CustomSpinIndicator())
                  ],
                  animateFirst: false,
                  styleStrategy: const UniformStyleStrategy(
                    borderColor: Colors.white,
                    borderWidth: 10,
                    textAlign: TextAlign.end,
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> getDialogWidget(
      BuildContext context, List<String> descriptions) {
    double width = MediaQuery.sizeOf(context).width;
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return Center(
              child: AlertDialog(
                  backgroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        width: 2, color: AppColors.borderColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  scrollable: true,
                  content: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.close,
                              color: AppColors.black,
                              size:
                                  width < AppConstants.maxMobileWidth ? 40 : 70,
                            )),
                      ),
                      Text(
                        descriptions[selecteIndex],
                        style: AppStyles.styleBold24(context).copyWith(
                            color: AppColors.black,
                            fontSize: getResponsiveFontSizeText(
                              context,
                              fontSize:
                                  width < AppConstants.maxMobileWidth ? 22 : 32,
                            )),
                      ),
                    ],
                  )));
        });
  }
}
