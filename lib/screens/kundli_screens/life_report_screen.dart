import 'package:divinecontrol/screens/kundli_screens/lifereport_details_screen.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:divinecontrol/widgets/kundli_widgets/custom_datetimpicker.dart';
import 'package:divinecontrol/widgets/kundli_widgets/custom_kundle_button.dart';
import 'package:divinecontrol/widgets/kundli_widgets/custom_kundle_textfield.dart';
import 'package:divinecontrol/widgets/kundli_widgets/custom_kundli_cspicker.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class LifeReportScreen extends StatefulWidget {
  const LifeReportScreen({super.key});

  @override
  State<LifeReportScreen> createState() => _LifeReportScreenState();
}

class _LifeReportScreenState extends State<LifeReportScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController textListController = TextEditingController();
  String countryValue="";
  String stateValue="";
  String cityValue="";
  final List<String> items = [
    'City 1',
    'City 2',
    'City 3',
    'City 4',
    'City 5',
    'City 6',
    'City 7',
    'City 8',
  ];
  GlobalKey<FormState> formState = GlobalKey();
  @override
  void dispose() {
    nameController.dispose();
    textListController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
      appBar:const CustomAppBar(title: "Enter Your Details", leading: true),
      body: Padding(
        padding: width < AppConstants.maxMobileWidth
            ? const EdgeInsets.symmetric(horizontal: 10)
            : width < AppConstants.maxTabletWidth
                ? const EdgeInsets.symmetric(horizontal: 30, vertical: 20)
                : const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formState,
            child: Column(
              children: [
                SizedBox(
                  height: width < AppConstants.maxMobileWidth ? 15 : 30,
                ),
                CustomKundleTextField(
                    hintText: "Name",
                    label: "Enter your name",
                    controller: nameController),
                SizedBox(
                  height: width < AppConstants.maxMobileWidth ? 15 : 30,
                ),
                const CustomDatePicker(
                    hintText: "selecte date",
                    label: "Date Of Birth :",
                    iconDate: Icons.calendar_month),
                SizedBox(
                  height: width < AppConstants.maxMobileWidth ? 15 : 30,
                ),
                const CustomTimePicker(
                    hintText: "select time",
                    label: "Birth Time:",
                    iconData: Icons.watch),
                SizedBox(
                  height: width < AppConstants.maxMobileWidth ? 15 : 30,
                ),
                // CustomKundleDropDownList(
                //   items: items,
                //   label: "Place Of Birth :",
                //   controller: textListController,
                // ),
                CustomKundlicscPicker(
                  currentCountry: countryValue,
                  currentState: stateValue,
                  currentCity: cityValue,
                  onCountryChanged: (value){
                    setState(() {
                      countryValue=value;
                    });
                  }, onStateChanged: (value){
                    setState(() {
                      stateValue=value!;
                    });
                  }, onCityChanged: (value){
                    setState(() {
                      cityValue=value!;
                    });
                  }),
                width < AppConstants.maxMobileWidth
                    ? const SizedBox(
                        height: 10,
                      )
                    : const SizedBox(
                        height: 30,
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'SaveAsDefault',
                          style: width < AppConstants.maxMobileWidth
                              ? AppStyles.styleRegular20(context)
                                  .copyWith(color: AppColors.darkPrimary)
                              : AppStyles.styleRegular20(context).copyWith(
                                  color: AppColors.darkPrimary,
                                  fontSize: getResponsiveFontSizeText(context,
                                      fontSize: 28)),
                        )),
                    const Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'UseDefaultProfile',
                          style: width < AppConstants.maxMobileWidth
                              ? AppStyles.styleRegular20(context)
                                  .copyWith(color: AppColors.darkPrimary)
                              : AppStyles.styleRegular20(context).copyWith(
                                  color: AppColors.darkPrimary,
                                  fontSize: getResponsiveFontSizeText(context,
                                      fontSize: 28)),
                        )),
                  ],
                ),
                width < AppConstants.maxMobileWidth
                    ? const SizedBox(
                        height: 10,
                      )
                    : const SizedBox(
                        height: 30,
                      ),
                Align(
                    alignment: Alignment.center,
                    child: CustomKundleButton(
                        onPressed: () {
                          if (formState.currentState!.validate()) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const LifeReportDetailsScreen()));
                          }
                        },
                        title: "Submit"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
