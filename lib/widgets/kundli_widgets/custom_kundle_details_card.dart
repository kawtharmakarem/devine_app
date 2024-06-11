import 'package:divinecontrol/screens/kundli_screens/match_markting_details_screen.dart';
import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/widgets/dream_meaning_widgets/custom_dropdown_list.dart';
import 'package:divinecontrol/widgets/kundli_widgets/custom_checkbox.dart';
import 'package:divinecontrol/widgets/kundli_widgets/custom_datetimpicker.dart';
import 'package:divinecontrol/widgets/kundli_widgets/custom_kundle_button.dart';
import 'package:divinecontrol/widgets/kundli_widgets/custom_kundle_dropdown.dart';
import 'package:divinecontrol/widgets/kundli_widgets/custom_kundle_textfield.dart';
import 'package:flutter/material.dart';

import '../../utils/app_styles.dart';

class CustomKundleDetailsCard extends StatefulWidget {
  const CustomKundleDetailsCard({super.key, required this.cardTitle});
  final String cardTitle;

  @override
  State<CustomKundleDetailsCard> createState() =>
      _CustomKundleDetailsCardState();
}

class _CustomKundleDetailsCardState extends State<CustomKundleDetailsCard> {
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  GlobalKey<FormState> formKey=GlobalKey();
  bool isChecked = false;
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

  @override
  void dispose() {
    nameController.dispose();
    cityController.dispose();
    textListController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Card(
      elevation: 4,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal:width<AppConstants.maxTabletWidth? 5:10),
          color: AppColors.white,
          child: Form(
            key: formKey,
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                widget.cardTitle,
                style: width < AppConstants.maxMobileWidth
                    ? AppStyles.styleBold24(context).copyWith(
                        color: AppColors.darkPrimary,fontSize:
                            getResponsiveFontSizeText(context, fontSize: 22))
                    :width<AppConstants.maxTabletWidth? AppStyles.styleBold24(context).copyWith(
                       color: AppColors.darkPrimary, fontSize:
                            getResponsiveFontSizeText(context, fontSize: 32)):AppStyles.styleBold24(context).copyWith(
                        color: AppColors.darkPrimary,fontSize:
                            getResponsiveFontSizeText(context, fontSize: 36)),
              ),
              children: [
                const Divider(
                  color: AppColors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                CustomKundleTextField(
                    hintText: "Enter you name",
                    label: "Name",
                    controller: nameController),
                const SizedBox(
                  height: 10,
                ),
                
                const CustomDatePicker(hintText: "select date", label:"Birth Date", iconDate: Icons.calendar_view_day_rounded),
                const SizedBox(
                  height: 10,
                ),
               
                const CustomTimePicker(hintText: "Birth Time", label: "Birth Time", iconData: Icons.watch),
                const SizedBox(
                  height: 10,
                ),
               CustomCheckBox(isChecked: isChecked),
                
                const SizedBox(
                  height: 10,
                ),
                CustomKundleDropDownList(items: items, label: "Birth Place", controller: textListController)
                // CustomKundleTextField(
                //     hintText: "Enter birth city name",
                //     label: "Birth Place",
                //     controller: cityController),
                //     const SizedBox(height: 10,),
                   
               , const SizedBox(
                  height: 30,
                )
              ],
            ),
          )),
    );
  }

}
