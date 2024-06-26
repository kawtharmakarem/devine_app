
import 'package:divinecontrol/screens/traveltime_screens/seefuture_details_screen.dart';
import 'package:divinecontrol/widgets/traveltime_widgets/custom_travelbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class FutureTimeScreen extends StatefulWidget {
  const FutureTimeScreen({super.key});

  @override
  State<FutureTimeScreen> createState() => _FutureTimeScreenState();
}

class _FutureTimeScreenState extends State<FutureTimeScreen> {
  // DateTime dateTime = DateTime.now();
  // final formatter = DateFormat.yMd();
  DateTime? _selectedDate;
  final TextEditingController _dateController = TextEditingController();
  final formatter = DateFormat.yMd();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
      appBar: AppBar(
        title: Text(
          'Time Travel',
          style: width < AppConstants.maxMobileWidth
              ? AppStyles.styleBold24(context)
                  .copyWith(color: AppColors.darkPrimary)
              : AppStyles.styleBold24(context).copyWith(
                  color: AppColors.darkPrimary,
                  fontSize: getResponsiveFontSizeText(context, fontSize: 40)),
        ),
        backgroundColor: AppColors.primary,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppImages.leftArrow),
        ),
      ),
      body:width<AppConstants.maxTabletWidth? getMobileFutureContent(width, context):getDesktopFutureContent(width, context),
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
                AppImages.travellogo,
                fit: BoxFit.fill,
              )),
          const SizedBox(
            height: 40,
          ),
          getDatePickerTextField(context,width),
          const SizedBox(
            height: 40,
          ),
          CustomTravelButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SeeFutureDetailsScreen()));
            },
            title: "See future",
          )
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
            width: width*0.2,
            child: Image.asset(
              AppImages.travellogo,
              fit: BoxFit.fill,
            ),
          ),
         
          SizedBox(
            width: width*0.4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                getDatePickerTextField(context,width),
                const SizedBox(
                  height: 60,
                ),
                CustomTravelButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SeeFutureDetailsScreen()));
                  },
                  title: "See future",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }


  TextField getDatePickerTextField(BuildContext context,double width) {
    return TextField(
      style:width<AppConstants.maxMobileWidth? AppStyles.styleRegular20(context)
          .copyWith(color: AppColors.darkPrimary):AppStyles.styleRegular20(context).copyWith(color: AppColors.darkPrimary,fontSize: getResponsiveFontSizeText(context, fontSize: 26)),
      decoration: InputDecoration(
          fillColor: AppColors.white,
          filled: true,
          hintText: "SelectDate",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
      controller: _dateController,
      onTap: () async {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context,width);
      },
    );
  }

  _selectDate(BuildContext context,double width) async {
    DateTime? newSlectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2040),
      builder: (context, child) {
        return Transform.scale(
          scale:width<AppConstants.maxMobileWidth?1:width<AppConstants.maxTabletWidth? 1.5:1.8,
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
}
