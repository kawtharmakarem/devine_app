import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker(
      {super.key,
      required this.hintText,
      required this.label,
      required this.iconDate});
  final String hintText;
  final String label;
  final IconData iconDate;

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
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
          validator: (data) {
            if (data!.isEmpty) {
              return 'Field is required';
            } else {
              return null;
            }
          },
          style: width < AppConstants.maxMobileWidth
              ? AppStyles.styleRegular20(context)
                  .copyWith(color: AppColors.darkPrimary)
              : AppStyles.styleRegular20(context).copyWith(
                  color: AppColors.darkPrimary,
                  fontSize: getResponsiveFontSizeText(context, fontSize: 26)),
          decoration: InputDecoration(
              suffix: Icon(widget.iconDate),
              fillColor: AppColors.white,
              filled: true,
              hintText: widget.hintText,
              errorStyle: width < AppConstants.maxMobileWidth
                  ? AppStyles.styleRegular20(context).copyWith(
                      color: Colors.red,
                      fontSize:
                          getResponsiveFontSizeText(context, fontSize: 16))
                  : AppStyles.styleRegular20(context)
                      .copyWith(color: Colors.red),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          controller: dateController,
          onTap: () async {
            FocusScope.of(context).requestFocus(new FocusNode());
            _selectDate(context, width);
          },
        ),
      ],
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

class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker(
      {super.key,
      required this.hintText,
      required this.label,
      required this.iconData});
  final String hintText;
  final String label;
  final IconData iconData;

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  TextEditingController timeController = TextEditingController();
  TimeOfDay? _selectedTime;
  @override
  void dispose() {
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
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
          validator: (data) {
            if (data!.isEmpty) {
              return 'Field is required';
            } else {
              return null;
            }
          },
          style: width < AppConstants.maxMobileWidth
              ? AppStyles.styleRegular20(context)
                  .copyWith(color: AppColors.darkPrimary)
              : AppStyles.styleRegular20(context).copyWith(
                  color: AppColors.darkPrimary,
                  fontSize: getResponsiveFontSizeText(context, fontSize: 26)),
          decoration: InputDecoration(
              suffix: Icon(widget.iconData),
              fillColor: AppColors.white,
              filled: true,
              hintText: widget.hintText,
              errorStyle: width < AppConstants.maxMobileWidth
                  ? AppStyles.styleRegular20(context).copyWith(
                      color: Colors.red,
                      fontSize:
                          getResponsiveFontSizeText(context, fontSize: 16))
                  : AppStyles.styleRegular20(context)
                      .copyWith(color: Colors.red),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          controller: timeController,
          onTap: () async {
            FocusScope.of(context).requestFocus(new FocusNode());
            _selectTime(context, width);
          },
        ),
      ],
    );
  }

  _selectTime(BuildContext context, double width) async {
    TimeOfDay? newSlectedTime = await showTimePicker(
        context: context,
        initialTime: _selectedTime ?? TimeOfDay.now(),
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
                      onSurface: AppColors.lightPurple1,
                    ),
                    buttonTheme: const ButtonThemeData(
                      colorScheme:
                          ColorScheme.dark(primary: AppColors.darkPrimary),
                    ),
                    textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                            foregroundColor: AppColors.darkPrimary,
                            textStyle: TextStyle(
                                fontSize: getResponsiveFontSizeText(context,
                                    fontSize: 20))))),
                child: child!),
          );
        });

    if (newSlectedTime != null) {
      _selectedTime = newSlectedTime;
      timeController
        ..text = "${_selectedTime!.hour} : ${_selectedTime!.minute}"
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: timeController.text.length,
            affinity: TextAffinity.upstream));
      setState(() {});
    }
  }
}
