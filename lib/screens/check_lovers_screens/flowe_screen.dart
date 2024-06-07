import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';
import '../../widgets/checklove_widgets/petal_widget.dart';
import '../../widgets/checklove_widgets/whole_widget.dart';

class Flower extends StatefulWidget {
  const Flower({super.key});

  @override
  State<Flower> createState() => _FlowerState();
}

class _FlowerState extends State<Flower> {
  static const module = -math.pi / 2;
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
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        backgroundColor: AppColors.lightPurple1,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Love Check",
            style: width < AppConstants.maxMobileWidth
                ? AppStyles.styleBold24(context)
                    .copyWith(color: AppColors.darkPrimary)
                : AppStyles.styleBold24(context).copyWith(
                    color: AppColors.darkPrimary,
                    fontSize: getResponsiveFontSizeText(context, fontSize: 40)),
          ),
          backgroundColor: AppColors.primary,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              }, icon: SvgPicture.asset(AppImages.leftArrow)),
        ),
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
                        )),
                HoleWidget(size: size)
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
                        )),
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
          height: 10,
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
                        )),
                HoleWidget(size: size)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
