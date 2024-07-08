import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class CustomRegisterDatePicker extends StatefulWidget {
  const CustomRegisterDatePicker(
      {super.key,
      required this.label,
      });
  final String label;

  @override
  State<CustomRegisterDatePicker> createState() => _CustomRegisterDatePickerState();
}

class _CustomRegisterDatePickerState extends State<CustomRegisterDatePicker> {
  TextEditingController dateController = TextEditingController();
  DateTime? _selectedDate;
  final formatter = DateFormat.yMd();
  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
            padding: const EdgeInsets.only(left: 10,right: 10),

      child: TextFormField(
        
        // validator: (data) {
        //   if (data!.isEmpty) {
        //     return 'Field is required';
        //   } else {
        //     return null;
        //   }
        // },
        style: width < AppConstants.maxMobileWidth
            ? AppStyles.stylePoppinsRegular20(context)
            : AppStyles.stylePoppinsRegular20(context).copyWith(
                fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxTabletWidth? 28:32)),
        decoration: InputDecoration(
                    contentPadding:const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
      
          label: Text(widget.label,),
            labelStyle: AppStyles.stylePoppinsRegular20(context).copyWith(color: AppColors.darkPrimary,fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 20:width<AppConstants.maxTabletWidth? 28:32)),
          
           enabledBorder:const UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: AppColors.darkPrimary
            )
          ),
          focusedBorder:const UnderlineInputBorder(
            borderSide: BorderSide(width: 2,color: AppColors.darkPrimary)
          )
           ),
        controller: dateController,
        onTap: () async {
          FocusScope.of(context).requestFocus( FocusNode());
          _selectDate(context, width);
        },
      ),
    );
  }

  _selectDate(BuildContext context, double width) async {
    DateTime? newSlectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2040),
      builder: (context, child) {
        return Transform.scale(
          scale: width < AppConstants.maxMobileWidth
              ? 1
              : width < AppConstants.maxTabletWidth
                  ? 1.5
                  : 1.8,
          child: Theme(
            data: ThemeData.dark().copyWith(
                colorScheme: const ColorScheme.dark(
                  primary: AppColors.darkPrimary,
                  onPrimary: AppColors.white,
                  onSurface: AppColors.white,
                ),
                dialogBackgroundColor: AppColors.lightPurple1,
                textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                        foregroundColor: AppColors.darkPrimary,
                        textStyle: TextStyle(
                            fontSize: getResponsiveFontSizeText(context,
                                fontSize: 20))))),
            child: child!,
          ),
        );
      },
    );
    if (newSlectedDate != null) {
      _selectedDate = newSlectedDate;
      dateController
        ..text = formatter.format(_selectedDate!)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: dateController.text.length,
            affinity: TextAffinity.upstream));
      setState(() {});
    }
  }
}