import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class CustomSettingsTextField extends StatelessWidget {
  const CustomSettingsTextField(
      {super.key,
      required this.labelText,
      required this.hintText,
      this.maxLines,
      this.controller});
  final String labelText;
  final String hintText;
  final int? maxLines;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        style: width < AppConstants.maxMobileWidth
            ? AppStyles.stylePoppinsRegular20(context)
            : AppStyles.stylePoppinsRegular20(context).copyWith(
                fontSize: getResponsiveFontSizeText(context,
                    fontSize: width < AppConstants.maxTabletWidth ? 28 : 32)),
        decoration: InputDecoration(
            contentPadding: width < AppConstants.maxMobileWidth
                ? const EdgeInsets.symmetric(horizontal: 5, vertical: 5)
                : const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Container(
              margin: const EdgeInsets.all(0),
              child: Text(labelText),
            ),
            labelStyle: AppStyles.styleRufinaBold32(context).copyWith(
                color: AppColors.darkPrimary,
                fontSize: getResponsiveFontSizeText(context,
                    fontSize: width < AppConstants.maxMobileWidth ? 28 :width<AppConstants.maxTabletWidth? 40:46)),
            hintText: hintText,
            hintStyle: AppStyles.stylePoppinsRegular20(context).copyWith(
                color: AppColors.primary,
                fontSize: getResponsiveFontSizeText(context,
                    fontSize: width < AppConstants.maxMobileWidth ? 20 : 24)),
            enabledBorder: OutlineInputBorder(
                gapPadding: 0,
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    const BorderSide(width: 2, color: AppColors.darkPrimary)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    const BorderSide(width: 2, color: AppColors.darkPrimary))),
      ),
    );
  }
}
