import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomPrivacyTitle extends StatelessWidget {
  const CustomPrivacyTitle({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: AppColors.lightPurple2,
          borderRadius: BorderRadius.circular(8)),
      child: Text(title,textAlign: TextAlign.center,
          style: AppStyles.styleRufinaBold32(context).copyWith(
              fontWeight: FontWeight.w600,
              fontSize: getResponsiveFontSizeText(context, fontSize: 20))),
    );
  }
}