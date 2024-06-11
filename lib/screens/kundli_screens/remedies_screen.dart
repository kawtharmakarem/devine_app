import 'package:divinecontrol/screens/kundli_screens/lifereport_details_screen.dart';
import 'package:divinecontrol/screens/kundli_screens/remedies_details_screen.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:divinecontrol/widgets/kundli_widgets/custom_datetimpicker.dart';
import 'package:divinecontrol/widgets/kundli_widgets/custom_kundle_button.dart';
import 'package:divinecontrol/widgets/kundli_widgets/custom_kundle_dropdown.dart';
import 'package:divinecontrol/widgets/kundli_widgets/custom_kundle_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class RemediesScreen extends StatefulWidget {
  const RemediesScreen({super.key});

  @override
  State<RemediesScreen> createState() => _RemediesScreenState();
}

class _RemediesScreenState extends State<RemediesScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController textListController = TextEditingController();
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
      appBar: AppBar(
        title: Text(
          "Enter Your details",
          style: width < AppConstants.maxMobileWidth
              ? AppStyles.styleBold24(context)
                  .copyWith(color: AppColors.darkPrimary)
              : AppStyles.styleBold24(context).copyWith(
                  color: AppColors.darkPrimary,
                  fontSize: getResponsiveFontSizeText(context, fontSize: 32)),
        ),
        backgroundColor: AppColors.lightPurple1,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppImages.leftArrow),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Form(
            key: formState,
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                CustomKundleTextField(
                    hintText: "Name",
                    label: "Enter your name",
                    controller: nameController),
                const SizedBox(
                  height: 15,
                ),
                const CustomDatePicker(
                    hintText: "selecte date",
                    label: "Date Of Birth :",
                    iconDate: Icons.calendar_month),
                const SizedBox(
                  height: 15,
                ),
                const CustomTimePicker(
                    hintText: "select time",
                    label: "Birth Time:",
                    iconData: Icons.watch),
                const SizedBox(
                  height: 15,
                ),
                CustomKundleDropDownList(
                  items: items,
                  label: "Place Of Birth :",
                  controller: textListController,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment:width<AppConstants.maxTabletWidth? MainAxisAlignment.spaceEvenly:MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'SaveAsDefault',
                          style:width<AppConstants.maxMobileWidth? AppStyles.styleRegular20(context)
                              .copyWith(color: AppColors.darkPrimary):AppStyles.styleRegular20(context)
                            .copyWith(color: AppColors.darkPrimary).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 28)),
                        )),
                        const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'UseDefaultProfile',
                        style:width<AppConstants.maxMobileWidth? AppStyles.styleRegular20(context)
                            .copyWith(color: AppColors.darkPrimary):AppStyles.styleRegular20(context)
                            .copyWith(color: AppColors.darkPrimary).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 28)),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.center,
                    child: CustomKundleButton(
                        onPressed: () {
                          if (formState.currentState!.validate()) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const RemediesDetailsScreen()));
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
