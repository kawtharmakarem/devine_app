import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:divinecontrol/screens/numerology_screens/numerology_screen.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:divinecontrol/widgets/traveltime_widgets/custom_travelbutton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class NumerologyMainScreen extends StatefulWidget {
  const NumerologyMainScreen({super.key});

  @override
  State<NumerologyMainScreen> createState() => _NumerologyMainScreenState();
}

class _NumerologyMainScreenState extends State<NumerologyMainScreen> {
  DateTime? _selectedDate;
  final TextEditingController _dateController = TextEditingController();
  final formatter = DateFormat.yMd();
  //final _random=Random();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
      appBar: CustomAppBar(title: 'Numerology', leading: true),
      body: width < AppConstants.maxTabletWidth
          ? getMobileNumererologyContent(width, context)
          : getDesktopNumererologyContent(width, context),
    );
  }

  Padding getMobileNumererologyContent(double width, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Column(
        children: [
          SizedBox(
              width: width * 0.3,
              child: Image.asset(
                AppImages.numerologyLogo,
                fit: BoxFit.fill,
              )),
          const SizedBox(
            height: 40,
          ),
          getDatePickerTextField(context, width),
          const SizedBox(
            height: 20,
          ),
          _selectedDate != null
              ? Column(
                  children: [
                    CustomTravelButton(
                      onPressed: () {
                        Get.off(() => Numerology(),
                            transition: Transition.circularReveal,
                            arguments: formatter.format(_selectedDate!).split("/")[0],
                            duration: const Duration(
                                seconds: AppConstants.durationSecond));
                      },
                      title: "Get Your Numererology",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Note: update your date of birth in the account to use it as default date of birth for this feature.",
                      style: AppStyles.styleRegular20(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 18:28)),
                    ),
                  ],
                )
              : SizedBox()
        ],
      ),
    );
  }

  Padding getDesktopNumererologyContent(double width, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width * 0.2,
            child: Image.asset(
              AppImages.numerologyLogo,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: width * 0.4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                getDatePickerTextField(context, width),
                const SizedBox(
                  height: 60,
                ),
                _selectedDate != null
                    ? Column(
                      children: [
                        CustomTravelButton(
                            onPressed: () {
                              Get.off(() => Numerology(),
                                  transition: Transition.zoom, arguments: formatter.format(_selectedDate!).split("/")[0],
                                  duration: const Duration(
                                      seconds: AppConstants.durationSecond));
                            },
                            title: "Get Your Numererology",
                          ),
                           const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Note: update your date of birth in the account to use it as default date of birth for this feature.",
                      style: AppStyles.styleRegular20(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize:32)),
                    ),
                      ],
                    )
                    : SizedBox()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getDatePickerTextField(BuildContext context, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date of Birth:',
          style: width < AppConstants.maxMobileWidth
              ? AppStyles.styleBold20(context).copyWith(
                  color: AppColors.darkPrimary,
                  fontSize: getResponsiveFontSizeText(context, fontSize: 20))
              : AppStyles.styleBold20(context).copyWith(
                  color: AppColors.darkPrimary,
                  fontSize: getResponsiveFontSizeText(context, fontSize: 30)),
        ),
        const SizedBox(
          height: 2,
        ),
        TextField(
          style: width < AppConstants.maxMobileWidth
              ? AppStyles.styleRegular20(context)
                  .copyWith(color: AppColors.darkPrimary)
              : AppStyles.styleRegular20(context).copyWith(
                  color: AppColors.darkPrimary,
                  fontSize: getResponsiveFontSizeText(context, fontSize: 28)),
          decoration: InputDecoration(
              suffix: Icon(
                FontAwesomeIcons.calendarCheck,
                size: 30,
                color: AppColors.darkPrimary,
              ),
              fillColor: AppColors.white,
              filled: true,
              // hintText: "SelectDate",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          controller: _dateController,
          onTap: () async {
            FocusScope.of(context).requestFocus(new FocusNode());
            width < AppConstants.maxMobileWidth
                ? _selectDate(context, width)
                : _selectDateForTablet(context, width);
          },
        ),
      ],
    );
  }

  _selectDateForTablet(BuildContext context, double width) async {
    DateTime? newSlectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
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
                                fontSize: 25))))),
            child: child!,
          ),
        );
      },
    );
    if (newSlectedDate != null) {
      _selectedDate = newSlectedDate;
      _dateController
        ..text = formatter.format(_selectedDate!)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _dateController.text.length,
            affinity: TextAffinity.upstream));
      setState(() {});
    }
  }

  _selectDate(BuildContext context, double width) async {
    List<DateTime?>? newSlectedDate = await showCalendarDatePicker2Dialog(
      dialogBackgroundColor: AppColors.lightPurple1,
      context: context,

      //value: _singleDatePickerValueWithDefaultValue,

      builder: (context, child) {
        return child!;
      },
      config: CalendarDatePicker2WithActionButtonsConfig(
        dayBorderRadius: BorderRadius.circular(20),
        selectedDayHighlightColor: AppColors.darkPrimary,
        okButtonTextStyle: AppStyles.styleRegular20(context).copyWith(
            color: AppColors.darkPrimary,
            fontSize: getResponsiveFontSizeText(context, fontSize: 18)),
        cancelButtonTextStyle: AppStyles.styleRegular20(context).copyWith(
            color: AppColors.darkPrimary,
            fontSize: getResponsiveFontSizeText(context, fontSize: 18)),
        calendarType: CalendarDatePicker2Type.single,
        weekdayLabels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
        weekdayLabelTextStyle: const TextStyle(
          color: AppColors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        //firstDayOfWeek: 1,
        controlsHeight: 60,
        dayMaxWidth: 30,
        animateToDisplayedMonthDate: true,
        controlsTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        dayTextStyle: const TextStyle(
            color: AppColors.darkPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 18),
        disabledDayTextStyle: const TextStyle(color: Colors.grey, fontSize: 18),
        centerAlignModePicker: true,
        useAbbrLabelForMonthModePicker: true,
        modePickerTextHandler: ({required monthDate, isMonthPicker}) {
          if (isMonthPicker ?? false) {
            // Custom month picker text
            return '${getLocaleShortMonthFormat(const Locale('en')).format(monthDate)} ';
          }

          return null;
        },
        firstDate: DateTime(1500),
      ),
      dialogSize: Size(324, 400),
    );
    if (newSlectedDate!.length > 0) {
      _selectedDate = newSlectedDate.first;
      _dateController
        ..text = formatter.format(_selectedDate!)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _dateController.text.length,
            affinity: TextAffinity.upstream));
      setState(() {});
    }
  }
}
