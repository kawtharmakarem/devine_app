import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../utils/app_styles.dart';

class CustomCheckBox extends StatefulWidget {
  CustomCheckBox({super.key, required this.isChecked});
  bool isChecked;
  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Row(

      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Transform.scale(
          scale: width < AppConstants.maxMobileWidth ? 1 : 2,
          child: Checkbox(
            value: widget.isChecked,
            onChanged: (val) {
              setState(() {
                widget.isChecked = val!;
              });
            },
          ),
        ),
        const SizedBox(width: 5,),
        Text(
          "Don't know my exact time of birth",
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: AppStyles.styleRegular20(context).copyWith(
              fontSize: getResponsiveFontSizeText(context,
                  fontSize: width < AppConstants.maxMobileWidth ? 18 : 30)),
        )
      ],
    );
  }
}

// CheckboxListTile(
                //     title: Text(
                //       "Don't know my exact time of birth",
                //       style: AppStyles.styleRegular20(context),
                //     ),
                //     controlAffinity: ListTileControlAffinity.leading,
                //     activeColor: AppColors.darkPrimary,
                //     value: isChecked,
                //     onChanged: (value) {
                //       setState(() {
                //         isChecked = value!;
                //       });
                //     }),