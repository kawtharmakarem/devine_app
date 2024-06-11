import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class CustomKundleTextField extends StatelessWidget {
  const CustomKundleTextField({
    super.key,
    required this.hintText,
    required this.label,
    this.onTap,
    required this.controller,
  });
  final String label;
  final String hintText;
  final void Function()? onTap;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: width < AppConstants.maxMobileWidth
                ? AppStyles.styleBold24(context).copyWith(
                    fontSize: getResponsiveFontSizeText(context, fontSize: 20))
                : AppStyles.styleBold24(context).copyWith(
                    fontSize: getResponsiveFontSizeText(context, fontSize: 32)),
          ),
          const SizedBox(
            height: 2,
          ),
          TextFormField(
            validator: (data) {
              if (data!.isEmpty) {
                return 'Field is required';
              } else {
                return null;
              }
            },
            style: width < AppConstants.maxMobileWidth
                ? AppStyles.styleRegular20(context)
                : AppStyles.styleRegular20(context).copyWith(
                    fontSize: getResponsiveFontSizeText(context, fontSize: 30)),
            controller: controller,
            onTap: onTap,
            decoration: InputDecoration(
              hintText: hintText,
              errorStyle: width < AppConstants.maxMobileWidth
                  ? AppStyles.styleRegular20(context).copyWith(
                      color: Colors.red,
                      fontSize:
                          getResponsiveFontSizeText(context, fontSize: 16))
                  : AppStyles.styleRegular20(context)
                      .copyWith(color: Colors.red),
              isDense: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              hintStyle: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: width < AppConstants.maxMobileWidth
                      ? getResponsiveFontSizeText(context, fontSize: 18)
                      : getResponsiveFontSizeText(context, fontSize: 28)),
              fillColor: AppColors.white,
              filled: true,
            ),
          ),
        ],
      ),
    );
  }
}
