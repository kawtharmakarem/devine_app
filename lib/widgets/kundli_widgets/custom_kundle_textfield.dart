import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class CustomKundleTextField extends StatefulWidget {
  const CustomKundleTextField({
    super.key,
    required this.hintText,
     this.label,
    required this.controller,
    this.keyboardType, this.onFieldSubmitted
  });
  final String? label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
 final void Function(String)? onFieldSubmitted;

  @override
  State<CustomKundleTextField> createState() => _CustomKundleTextFieldState();
}

class _CustomKundleTextFieldState extends State<CustomKundleTextField> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
     widget. label==null?  Container() : Text(
            widget.label! ,
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
            keyboardType: widget.keyboardType,
            // validator: (data) {
            //   if (data!.isEmpty) {
            //     return 'Field is required';
            //   } else {
            //     return null;
            //   }
            // },
            style: width < AppConstants.maxMobileWidth
                ? AppStyles.styleRegular20(context)
                : AppStyles.styleRegular20(context).copyWith(
                    fontSize: getResponsiveFontSizeText(context, fontSize: 30)),
            controller: widget.controller,
            onFieldSubmitted: widget.onFieldSubmitted,
            decoration: InputDecoration(
              hintText: widget.hintText,
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
