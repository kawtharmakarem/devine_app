import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomPrivacyTitle extends StatelessWidget {
  const CustomPrivacyTitle({
    super.key, required this.title, this.details,
  });
  final String title;
  final String? details;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: AppColors.lightPurple2,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Text(title,textAlign: TextAlign.center,
              style: AppStyles.styleRufinaBold32(context).copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: getResponsiveFontSizeText(context, fontSize: 20))),
              details==null?const SizedBox():    SizedBox(
                    height: 100,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Text(details!,style: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 18)),)
                      ],
                    ),
                  )
        ],
      ),

    );
  }
}