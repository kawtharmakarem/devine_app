import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomTravelButton extends StatelessWidget {
  const CustomTravelButton({
    super.key,
    required this.onPressed,
    required this.title,
  });
  final void Function() onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: double.infinity,
      height: width < AppConstants.maxMobileWidth ? 60 : 80,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.white,
              textStyle: width < AppConstants.maxMobileWidth
                  ? AppStyles.styleBold24(context)
                  : AppStyles.styleBold24(context).copyWith(
                      fontSize:
                          getResponsiveFontSizeText(context, fontSize: 32))),
          child: Text(title)),
    );
  }
}
