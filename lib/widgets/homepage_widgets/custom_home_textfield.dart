import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../utils/app_styles.dart';

class CustomHomeTextFiled extends StatelessWidget {
  const CustomHomeTextFiled({
    super.key,
    required this.emailController,
    required this.label,
    this.obscureText,
  });

  final TextEditingController emailController;
  final String label;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return TextFormField(
      style: width < AppConstants.maxMobileWidth
          ? AppStyles.stylePoppinsRegular20(context)
          : AppStyles.stylePoppinsRegular20(context).copyWith(
              fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxTabletWidth? 28:32)),
      controller: emailController,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        label: Text(label),
        labelStyle:width<AppConstants.maxMobileWidth? AppStyles.stylePoppinsRegular20(context):AppStyles.stylePoppinsRegular20(context).copyWith(
              fontSize: getResponsiveFontSizeText(context, fontSize: 28),
      )),
    );
  }
}
