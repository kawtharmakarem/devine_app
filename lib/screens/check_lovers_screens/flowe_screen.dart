import 'dart:developer';

import 'package:divinecontrol/widgets/checklove_widgets/custom_checklover_button.dart';
import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';
import '../../widgets/checklove_widgets/petal_clipper_widget.dart';
import '../../widgets/checklove_widgets/whole_widget.dart';
import '../../widgets/dream_meaning_widgets/history_button.dart';

class Flower extends StatefulWidget {
  const Flower({super.key});

  @override
  State<Flower> createState() => _FlowerState();
  static _FlowerState? of(BuildContext context) =>
      context.findAncestorStateOfType<_FlowerState>();
}

class _FlowerState extends State<Flower> {
  int _counter = 0;
  set counter(int count) => setState(() {
        _counter = count;
      });

 

  //static const module = -math.pi / 2;
  // final angle1=math.pi+module;
  // final angle2=5*math.pi/4+module;
  // final angle3=3*math.pi/2+module;
  // final angle4=7*math.pi/4+module;
  // final angle5=2*math.pi+module;

  static const angle1 = math.pi;
  static const angle2 = 5 * math.pi / 6;
  static const angle3 = 4 * math.pi / 6;
  static const angle4 = 3 * math.pi / 6;
  static const angle5 = 2 * math.pi / 6;
  static const angle6 = math.pi / 6;
  static const angle7 = 2 * math.pi;
  static const angle8 = 11 * math.pi / 6;
  static const angle9 = 10 * math.pi / 6;
  static const angle10 = 9 * math.pi / 6;
  static const angle11 = 8 * math.pi / 6;
  static const angle12 = 7 * math.pi / 6;
  static const List angles = [
    angle1,
    angle2,
    angle3,
    angle4,
    angle5,
    angle6,
    angle7,
    angle8,
    angle9,
    angle10,
    angle11,
    angle12
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    log("counter ${_counter}");

    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        backgroundColor: AppColors.lightPurple1,
        appBar: CustomAppBar(title: "Love Check", leading: true),
        body: width < AppConstants.maxMobileWidth
            ? getMobileFlower(context, size)
            : width < AppConstants.maxTabletWidth
                ? getTabletFlower(context, size)
                : getDesktopFlower(context, size));
  }

  Column getMobileFlower(BuildContext context, Size size) {
    return Column(
      children: [
        Text(
          "Tap on Petels to remove it",
          style: AppStyles.styleBold24(context),
        ),
        Expanded(
          child: Transform.scale(
            scale: 1.5,
            child: Stack(
              children: [
                ...List.generate(
                    angles.length,
                    (index) => Petal(
                          angle: angles[index],
                          index: index,
                          callBack: (val) {
                            setState(() {
                              _counter = val;

                            });
                            return _counter;
                          },
                        )),
                _counter >= 12
                    ? Positioned(
                        top: size.height / 3,
                        right: size.width / 2.8,
                        child: CustomButton(
                            onPressed: () {
                              
                              setState(() {
                                _counter=0;
                               //Navigator.popAndPushNamed(context, "flowerroute");
                               Get.offAndToNamed("flowerroute");
                              });
                            },
                            title: "Restart")
                        
                        )
                    : HoleWidget(size: size)
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column getTabletFlower(BuildContext context, Size size) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          "Tap on Petels to remove it",
          style: AppStyles.styleBold24(context).copyWith(
              fontSize: getResponsiveFontSizeText(context, fontSize: 32)),
        ),
        Expanded(
          child: Transform.scale(
            scale: 3,
            child: Stack(
              children: [
                ...List.generate(
                    angles.length,
                    (index) => Petal(
                          angle: angles[index],
                          index: index,
                          callBack: (val) {
                            _counter = val;
                            return _counter;
                          },
                        )),
                         _counter >= 12
                    ? Positioned(
                        top: size.height / 2.1,
                        right: size.width / 2.4,
                        child:
                        CustomCheckLoverButton(onPressed: (){
                          setState(() {
                                _counter=0;
                               Navigator.popAndPushNamed(context, "flowerroute");
                              });
                        }, title: "Restart") 
                       
                        )
                    : 
                HoleWidget(size: size)
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column getDesktopFlower(BuildContext context, Size size) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Text(
          "Tap on Petels to remove it",
          style: AppStyles.styleBold24(context).copyWith(
              fontSize: getResponsiveFontSizeText(context, fontSize: 40)),
        ),
        Expanded(
          child: Transform.scale(
            scale: 3,
            child: Stack(
              children: [
                ...List.generate(
                    angles.length,
                    (index) => Petal(
                          angle: angles[index],
                          index: index,
                          callBack: (val) {
                            _counter = val;
                            return _counter;
                          },
                        )),
                         _counter >= 12
                    ? Positioned(
                        top: size.height / 3,
                        right: size.width / 2.21,
                        child: CustomCheckLoverButton(
                            onPressed: () {
                              
                              setState(() {
                                _counter=0;
                               Navigator.popAndPushNamed(context, "flowerroute");
                              });
                            },
                            title: "Restart")
                        
                        )
                    : 
                HoleWidget(size: size)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

typedef int IntCallBack(int value);

class Petal extends StatefulWidget {
  const Petal(
      {super.key,
      required this.angle,
      required this.index,
      required this.callBack});
  final double angle;
  final int index;
  final IntCallBack callBack;

  @override
  State<Petal> createState() => _PetalState();
}

class _PetalState extends State<Petal> {
  int opacity = 1;
static int counter = 0;
@override
  void initState() {
    counter=0;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Positioned(
      top: 50 * math.cos(widget.angle),
      right: 50 * math.sin(widget.angle),
      child: Transform.translate(
        //offset: Offset(-size.width/2.7, size.height/2.7),
        offset: size.width < AppConstants.maxMobileWidth
            ? Offset(-size.width / 2.7, size.height / 3.5)
            : size.width < AppConstants.maxTabletWidth
                ? Offset(-size.width / 2.3, size.height / 2.7)
                : Offset(-size.width / 2.15, size.height / 2.9),
        child: Transform.rotate(
            angle: widget.angle,
            child: ClipPath(
              clipper: PetalClipper(),
              child: GestureDetector(
                onTap: () {
                  opacity = 0;
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(SnackBar(duration: const Duration(milliseconds: 500),
                      backgroundColor: AppColors.lightPurple1,
                      content: Align(
                        child: Text(
                          widget.index % 2 == 0 ? "Love" : "Doesn't Love",
                          style: size.width < AppConstants.maxMobileWidth
                              ? AppStyles.styleBold24(context).copyWith(
                                  fontSize: getResponsiveFontSizeText(context,
                                      fontSize: 36))
                              : size.width < AppConstants.maxTabletWidth
                                  ? AppStyles.styleBold24(context).copyWith(
                                      fontSize: getResponsiveFontSizeText(
                                          context,
                                          fontSize: 40),
                                    )
                                  : AppStyles.styleBold24(context).copyWith(
                                      fontSize: getResponsiveFontSizeText(
                                          context,
                                          fontSize: 40)),
                        ),
                      ),
                    ));
                  counter += 1;
                  widget.callBack(counter);
                  Flower.of(context)!.counter = counter;

                  setState(() {});

                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: opacity == 0
                          ? Colors.transparent
                          : Color.fromRGBO(
                              math.Random().nextInt(255),
                              math.Random().nextInt(255),
                              math.Random().nextInt(255),
                              1)),
                ),
              ),
            )),
      ),
    );
  }
}
