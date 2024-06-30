import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../utils/app_styles.dart';

class CustomRegisterTextField extends StatelessWidget {
  const CustomRegisterTextField({
    super.key,
    required this.controller,
    this.label,
  });

  final TextEditingController controller;
  final String? label;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return SizedBox(
      height: height * 0.08,
      child: TextFormField(
        style: width < AppConstants.maxMobileWidth
            ? AppStyles.stylePoppinsRegular20(context)
            : AppStyles.stylePoppinsRegular20(context).copyWith(
                fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxTabletWidth? 28:30)),
        controller: controller,
        decoration: InputDecoration(
          label: Text(
            label ?? "",
            style: width < AppConstants.maxMobileWidth
                ? AppStyles.stylePoppinsRegular20(context)
                : AppStyles.stylePoppinsRegular20(context).copyWith(
                    fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxTabletWidth? 28:30)),
          ),
        ),
      ),
    );
  }
}
