import 'dart:developer';

import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:divinecontrol/widgets/checklove_widgets/petal_clipper_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../screens/check_lovers_screens/flowe_screen.dart';

class Petal extends StatefulWidget {
  const Petal({super.key, required this.angle, required this.index, required this.callBack});
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
                    ..showSnackBar(SnackBar(
                      backgroundColor: AppColors.lightPurple1,
                      content: Align(
                        child: Text(
                          widget.index % 2 == 0 ? "Love" : "Doesn't Love",
                          style: size.width < AppConstants.maxMobileWidth
                              ? AppStyles.styleBold24(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 36))
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

                  setState(() {

                  });
                 
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
