import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomHomeTextButton extends StatelessWidget {
  const CustomHomeTextButton({
    super.key, required this.questionText, required this.buttonTitle, required this.onPressed,
  });
  final String questionText;
  final String buttonTitle;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    double height=MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questionText,
          style: AppStyles.stylePoppinsRegular20(context).copyWith(
              fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 18:width<AppConstants.maxTabletWidth? 24:28)),
        ),
        TextButton(
            onPressed: onPressed,
            child: Container(
                padding:  EdgeInsets.only(bottom: height*0.0045),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: AppColors.darkPrimary, width: 1))),
                child: Text(
                  buttonTitle,
                  style: TextStyle(
                      fontSize: getResponsiveFontSizeText(
                        context,
                        fontSize:width<AppConstants.maxMobileWidth? 18:width<AppConstants.maxTabletWidth? 24:28,
                      ),
                      color: AppColors.darkPrimary),
                )))
      ],
    );
  }
}
