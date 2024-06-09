import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomSpinIndicator extends StatelessWidget {
  const CustomSpinIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.rotate(
            angle: math.pi,
            child: TriangleIndicator(
              color: AppColors.borderColor,
              width:width<AppConstants.maxTabletWidth? width * 0.083:width*0.045, //30,
              height:width<AppConstants.maxTabletWidth? width * 0.055:width*0.03, //20,
            )),
        Container(
          width:width<AppConstants.maxTabletWidth? width * 0.25:width*0.1, //90,
          height:width<AppConstants.maxTabletWidth? width * 0.25:width*0.11, //90,
          decoration: const ShapeDecoration(
              color: AppColors.borderColor, shape: CircleBorder()),
          child: Center(
            child: Container(
              height:width<AppConstants.maxTabletWidth? width * 0.18:width*0.07, //65,
              width:width<AppConstants.maxTabletWidth? width * 0.18:width*0.07, // 65,
              decoration:
                  const ShapeDecoration(color: Colors.white, shape: CircleBorder()),
              child: Center(
                  child: Text(
                "Spin",
                style: width < AppConstants.maxMobileWidth
                    ? AppStyles.styleBold24(context)
                        .copyWith(color: AppColors.borderColor)
                    : AppStyles.styleBold24(context).copyWith(
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize: 40),
                        color: AppColors.borderColor),
              )),
            ),
          ),
        ),
      ],
    );
  }
}
