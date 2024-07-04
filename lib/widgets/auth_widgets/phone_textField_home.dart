import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      width: width,
      height:width<AppConstants.maxTabletWidth? height * 0.08:height*0.1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 1, color: AppColors.darkPrimary)),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CountryCodePicker(
              textStyle: AppStyles.stylePoppinsRegular20(context).copyWith(
                color: AppColors.darkPrimary,
                fontSize: getResponsiveFontSizeText(context,
                    fontSize: width < AppConstants.maxMobileWidth ? 18 : 32),
              ),
              initialSelection: '+91',
              showDropDownButton: true,
              enabled: true,
              showCountryOnly: false,
              hideMainText: false,
              showFlag: true,
              padding: EdgeInsets.zero,
              dialogTextStyle:
                  AppStyles.stylePoppinsRegular20(context).copyWith(
                fontSize: getResponsiveFontSizeText(context,
                    fontSize: width < AppConstants.maxMobileWidth ? 18 : 32),
              ),
              searchStyle: AppStyles.stylePoppinsRegular20(context),
            ),
          ),
          const SizedBox(
            width: 5,
            height: 20,
            child: VerticalDivider(
              indent: 1,
              endIndent: 1,
              thickness: 1,
              color: AppColors.darkPrimary,
            ),
          ),
          Expanded(
            flex: 2,
            child: TextFormField(
              decoration: InputDecoration.collapsed(
                hintText: 'Mobile Number',
                hintStyle: AppStyles.stylePoppinsRegular20(context).copyWith(
                  fontSize: getResponsiveFontSizeText(context,
                      fontSize: width < AppConstants.maxMobileWidth ? 18 : 32),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
