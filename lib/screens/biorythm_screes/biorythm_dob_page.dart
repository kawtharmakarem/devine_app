import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';
import '../../widgets/homepage_widgets/custom_appbar.dart';
import '../../widgets/traveltime_widgets/custom_travelbutton.dart';
import 'biorhythm_page.dart';

class BiorythmDobPage extends StatefulWidget {
  const BiorythmDobPage({super.key});

  @override
  State<BiorythmDobPage> createState() => _BiorythmDobPageState();
}

class _BiorythmDobPageState extends State<BiorythmDobPage> {
  final formatter = DateFormat('yyyy-MM-dd');
  DateTime? _selectedDate;
  final TextEditingController _dateController = TextEditingController();

  // List<DateTime?> _singleDatePickerValueWithDefaultValue = [
  //   DateTime.now().add(const Duration(days: 1)),
  // ];

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
      appBar: CustomAppBar(title: 'Bio - Rhythm', leading: true),
      body: width < AppConstants.maxTabletWidth
          ? getMobileFutureContent(width, context)
          : getDesktopFutureContent(width, context),
    );
  }

  Padding getMobileFutureContent(double width, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Column(
        children: [
          SizedBox(
              width: width * 0.3,
              child: Image.asset(
                AppImages.biorythmlogo,
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
              ? CustomTravelButton(
                onPressed: () {
                 
                  Get.off(() => BiorhythmPage(),arguments: _dateController.text,
                      transition: Transition.circularReveal,
                      duration: const Duration(seconds: 2));
                },
                title: "Get your Biorythm",
              )
              : SizedBox()
        ],
      ),
    );
  }

  Padding getDesktopFutureContent(double width, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         SizedBox(
              width: width * 0.2,
              child: Image.asset(
                AppImages.biorythmlogo,
                fit: BoxFit.fill,
              )),
          SizedBox(
            width: width * 0.4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                getDatePickerTextField(context, width),
                const SizedBox(
                  height: 60,
                ),
                _selectedDate!= null
              ? CustomTravelButton(
                onPressed: () {
                 
                  Get.off(() => BiorhythmPage(),arguments: _dateController.text,
                      transition: Transition.zoom,
                      duration: const Duration(seconds: 2));
                },
                title: "Get your Biorythm",
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
              ? AppStyles.styleRegular20(context).copyWith(
                  color: AppColors.darkPrimary,fontWeight: FontWeight.w500,
                  fontSize: getResponsiveFontSizeText(context, fontSize: 20))
              : AppStyles.styleRegular20(context).copyWith(
                  color: AppColors.darkPrimary,
                  fontSize: getResponsiveFontSizeText(context, fontSize: 32)),
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
                  fontSize: getResponsiveFontSizeText(context, fontSize: 26)),
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
          width<AppConstants.maxMobileWidth?  _selectDate(context, width):_selectTabletDate(context, width);
          },
        ),
      ],
    );
  }

  _selectTabletDate(BuildContext context, double width) async {
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
              

        builder: (context,child){
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
            fontSize: 16,
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
          disabledDayTextStyle:
              const TextStyle(color: Colors.grey, fontSize: 18),
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
          lastDate: DateTime(4000)
          // firstDate: DateTime(DateTime.now().year - 2, DateTime.now().month - 1,
          //     DateTime.now().day - 5),
          // lastDate: DateTime(DateTime.now().year + 3, DateTime.now().month + 2,
          //     DateTime.now().day + 10),
          // selectableDayPredicate: (day) =>
          //     !day
          //         .difference(DateTime.now().add(const Duration(days: 1)))
          //         .isNegative &&
          //     day.isBefore(DateTime.now().add(const Duration(days: 30))),
        ),
        dialogSize: Size(324, 400),
        );
  if(newSlectedDate!.length>0){

_selectedDate=newSlectedDate.first;
_dateController
..text=formatter.format(_selectedDate!)
..selection=TextSelection.fromPosition(TextPosition(offset: _dateController.text.length,affinity: TextAffinity.upstream));
setState(() {
  
});
  }
  
  }
}
