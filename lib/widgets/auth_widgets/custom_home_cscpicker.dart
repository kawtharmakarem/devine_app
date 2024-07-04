import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';

class CustomCscPicker extends StatefulWidget {
  const CustomCscPicker(
      {super.key,
      required this.onCountryChanged,
      required this.onStateChanged,
      required this.onCityChanged,
      this.currentCountry,
      this.currentState,
      this.currentCity});
  final void Function(String) onCountryChanged;
  final void Function(String?) onStateChanged;
  final void Function(String?) onCityChanged;
  final String? currentCountry;
  final String? currentState;
  final String? currentCity;

  @override
  State<CustomCscPicker> createState() => _CustomCscPickerState();
}

class _CustomCscPickerState extends State<CustomCscPicker> {
  //  String countryValue = "";
  // String stateValue = "";
  // String cityValue = "";
  @override
  Widget build(BuildContext context) {
    GlobalKey<CSCPickerState> cscPickerKey = GlobalKey();
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return SizedBox(
      height:width<AppConstants.maxMobileWidth? height * 0.15:height*0.2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 2,
              child: Text(
                'Place of birth :',
      style:   AppStyles.stylePoppinsRegular20(context).copyWith(color: AppColors.darkPrimary,fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 20:width<AppConstants.maxTabletWidth? 28:32)),
              )),
          Expanded(
            flex: 3,
            child: CSCPicker(
              key: cscPickerKey,
              currentCountry: widget.currentCountry,
              currentState: widget.currentState,
              currentCity: widget.currentCity,
              showStates: true,
              showCities: true,
              flagState: CountryFlag.DISABLE,
              dropdownDecoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: AppColors.black))),
              disabledDropdownDecoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: AppColors.myGray))),
              countrySearchPlaceholder: "Country",
              stateSearchPlaceholder: "State",
              citySearchPlaceholder: "City",
              countryDropdownLabel: "Country",
              stateDropdownLabel: "State",
              cityDropdownLabel: "City",
              selectedItemStyle: AppStyles.stylePoppinsRegular20(context)
                  .copyWith(
                      fontSize:
                          getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxTabletWidth? 18:28)),
              dropdownHeadingStyle: AppStyles.stylePoppinsRegular20(context)
                  .copyWith(fontWeight: FontWeight.w600),
              dropdownItemStyle: AppStyles.stylePoppinsRegular20(context)
                  .copyWith(
                      fontSize:
                          getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxTabletWidth? 18:28)),
              dropdownDialogRadius: 10.0,
              searchBarRadius: 10.0,
              onCountryChanged: widget.onCountryChanged,
              onStateChanged: widget.onStateChanged,
              onCityChanged: widget.onCityChanged,
            ),
          )
        ],
      ),
    );
  }
}
