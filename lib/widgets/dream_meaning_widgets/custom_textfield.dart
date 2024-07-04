import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.maxLines,
      required this.label,
      this.onTap,
      this.suffix,
      required this.controller});
  final String label;
  final String hintText;
  final int maxLines;
  final void Function()? onTap;
 final IconData? suffix;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: width < AppConstants.maxMobileWidth
              ? AppStyles.styleBold24(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 20))
              : AppStyles.styleBold24(context).copyWith(
                  fontSize: getResponsiveFontSizeText(context, fontSize: 32)),
        ),
        SizedBox(
          height: width < AppConstants.maxMobileWidth ? 2 : 5,
        ),
        Material(
          clipBehavior: Clip.hardEdge,
          elevation: 2,
          shadowColor: AppColors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: TextFormField(
              style: width<AppConstants.maxMobileWidth? AppStyles.styleRegular20(context):AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxTabletWidth? 28:32)),
              controller: controller,
              onTap: onTap,
              maxLines: maxLines,
              decoration: InputDecoration(
                suffix:Icon(suffix,size: width<AppConstants.maxMobileWidth? 20:60,),
                hintText: hintText,
                isDense: true,
                contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                
                hintStyle: TextStyle(
                    letterSpacing: 2,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: width < AppConstants.maxMobileWidth
                        ? getResponsiveFontSizeText(context, fontSize: 18)
                        : getResponsiveFontSizeText(context, fontSize: 28)),
                fillColor: Colors.white30,
                filled: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
