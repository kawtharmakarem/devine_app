import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';

class CustomKundlicscPicker extends StatefulWidget {
  const CustomKundlicscPicker(
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
  State<CustomKundlicscPicker> createState() => _CustomKundlicscPickerState();
}

class _CustomKundlicscPickerState extends State<CustomKundlicscPicker> {
  //  String countryValue = "";
  // String stateValue = "";
  // String cityValue = "";
  @override
  Widget build(BuildContext context) {
    GlobalKey<CSCPickerState> cscPickerKey = GlobalKey();
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return SizedBox(
      height:
          width < AppConstants.maxMobileWidth ? height * 0.2 : height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Place of birth :',
            style: width < AppConstants.maxMobileWidth
                ? AppStyles.styleBold24(context).copyWith(
                    fontSize: getResponsiveFontSizeText(context, fontSize: 20))
                : AppStyles.styleBold24(context).copyWith(
                    fontSize: getResponsiveFontSizeText(context, fontSize: 32)),
          ),
          CSCPicker(
            key: cscPickerKey,
            currentCountry: widget.currentCountry,
            currentState: widget.currentState,
            currentCity: widget.currentCity,
            showStates: true,
            showCities: true,
            flagState: CountryFlag.DISABLE,
            
            dropdownDecoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              border: Border(
                  bottom: BorderSide(color: Colors.black54),
                  top: BorderSide(color: Colors.black54),
                  right: BorderSide(color: Colors.black54),
                  left: BorderSide(color: Colors.black54)),
            ),
            disabledDropdownDecoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.myGray))),
            countrySearchPlaceholder: "Country",
            stateSearchPlaceholder: "State",
            citySearchPlaceholder: "City",
            countryDropdownLabel: "Country",
            stateDropdownLabel: "State",
            cityDropdownLabel: "City",
            selectedItemStyle: width < AppConstants.maxMobileWidth
          ? AppStyles.stylePoppinsRegular20(context)
          : AppStyles.stylePoppinsRegular20(context).copyWith(
              fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxTabletWidth? 28:32)),
            dropdownHeadingStyle:width < AppConstants.maxMobileWidth
          ? AppStyles.stylePoppinsRegular20(context)
          : AppStyles.stylePoppinsRegular20(context).copyWith(
              fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxTabletWidth? 28:32)),
            dropdownItemStyle:width < AppConstants.maxMobileWidth
          ? AppStyles.stylePoppinsRegular20(context)
          : AppStyles.stylePoppinsRegular20(context).copyWith(
              fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxTabletWidth? 28:32)),
            dropdownDialogRadius: 10.0,
            searchBarRadius: 10.0,
            onCountryChanged: widget.onCountryChanged,
            onStateChanged: widget.onStateChanged,
            onCityChanged: widget.onCityChanged,
          )
        ],
      ),
    );
  }
}
