import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';
import '../../widgets/dream_meaning_widgets/custom_textfield.dart';
import '../../widgets/dream_meaning_widgets/history_button.dart';

class DreamBookPage extends StatefulWidget {
  const DreamBookPage({super.key});

  @override
  State<DreamBookPage> createState() => _DreamBookPageState();
}

class _DreamBookPageState extends State<DreamBookPage> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _dreamTitleController = TextEditingController();
  final TextEditingController _writeDreamController = TextEditingController();
  final formatter = DateFormat.yMd();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar:const CustomAppBar(title: "Dream Book", leading: true),
      body: width < AppConstants.maxMobileWidth
          ? getMobileDreamBook(context, height)
          : width < AppConstants.maxTabletWidth
              ? getTabletDreamBook(context, width, height)
              : getDesktopDreamBook(context, width, height),
    );
  }

  Padding getMobileDreamBook(BuildContext context, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              '“Track , Analyze, and Explore your Dreams Anytime by Adding them to your Dream Book”',
              textAlign: TextAlign.justify,
              style: AppStyles.styleRegular20(context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  title: 'DreamHistory',
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                              content: Text('Click here to see your history '),
                              alignment: Alignment.topRight,
                            ));
                  },
                ),
              ],
            ),
            CustomTextField(
              label: 'Date',
              hintText: 'select date',
              maxLines: 2,
              controller: _dateController,
              onTap: () async {
                FocusScope.of(context).requestFocus(FocusNode());
                DateTime? date = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    initialDate: DateTime.now(),
                    builder: (context,child){
                      return Theme(
                        data: ThemeData.dark().copyWith(
                          colorScheme:const ColorScheme.dark().copyWith(
                            primary: AppColors.darkPrimary,
                            onPrimary: AppColors.white,
                            onSurface: AppColors.white
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.darkPrimary,
                              textStyle: AppStyles.styleRegular20(context)
                            )
                          )
                        ),
                        child: child!);
                    });
                date == null
                    ? _dateController.text = 'no date selected'
                    : _dateController.text = formatter.format(date);
                setState(() {});
              },
            ),
            SizedBox(
              height: height * 0.025,
            ),
            CustomTextField(
                hintText: 'dream title',
                maxLines: 2,
                label: 'Dream Title:',
                controller: _dreamTitleController),
            SizedBox(
              height: height * 0.025,
            ),
            CustomTextField(
                hintText: 'write your dream',
                maxLines: 4,
                label: 'Write Your Dream :',
                controller: _writeDreamController),
            SizedBox(
              height: height * 0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(onPressed: () {}, title: 'SaveDream'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding getTabletDreamBook(
      BuildContext context, double width, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              '“Track , Analyze, and Explore your Dreams Anytime by Adding them to your Dream Book”',
              textAlign: TextAlign.justify,
              style: AppStyles.styleRegular20(context).copyWith(
                  fontSize: getResponsiveFontSizeText(context, fontSize: 32)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  title: 'DreamHistory',
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                              content: Text('Click here to see your history '),
                              alignment: Alignment.topRight,
                            ));
                  },
                ),
              ],
            ),
            CustomTextField(
              label: 'Date',
              hintText: 'select date',
              suffix: Icons.calendar_month,
              maxLines: 2,
              controller: _dateController,
              onTap: () async {
                FocusScope.of(context).requestFocus(FocusNode());
                DateTime? date = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    initialDate: DateTime.now(),
                    builder: (context,child){
                      return Transform.scale(
                        scale: 1.5,
                        child: Theme(
                          data: ThemeData.dark().copyWith(
                            colorScheme:const ColorScheme.dark().copyWith(
                              primary: AppColors.darkPrimary,
                              onPrimary: AppColors.white,
                              onSurface: AppColors.white
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                foregroundColor: AppColors.darkPrimary,
                                textStyle: AppStyles.styleRegular20(context)
                              )
                            )
                          ),
                          child: child!),
                      );
                    });
                date == null
                    ? _dateController.text = 'no date selected'
                    : _dateController.text = formatter.format(date);
                setState(() {});
              },
            ),
            SizedBox(
              height: height * 0.03,
            ),
            CustomTextField(
                hintText: 'dream title',
                maxLines: 3,
                label: 'Dream Title:',
                controller: _dreamTitleController),
            SizedBox(
              height: height * 0.03,
            ),
            CustomTextField(
                hintText: 'write your dream',
                maxLines: 5,
                label: 'Write Your Dream :',
                controller: _writeDreamController),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(onPressed: () {}, title: 'SaveDream'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding getDesktopDreamBook(
      BuildContext context, double width, double height) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 20, vertical: 5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              '“Track , Analyze, and Explore your Dreams Anytime by Adding them to your Dream Book”',
              textAlign: TextAlign.justify,
              style: AppStyles.styleRegular20(context).copyWith(
                  fontSize: getResponsiveFontSizeText(context, fontSize: 32)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  title: 'DreamHistory',
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                              content: Text('Click here to see your history '),
                              alignment: Alignment.topRight,
                            ));
                  },
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    label: 'Date',
                    hintText: 'select date',
                    suffix: Icons.calendar_month,
                    maxLines: 2,
                    controller: _dateController,
                    onTap: () async {
                      FocusScope.of(context).requestFocus( FocusNode());
                      DateTime? date = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                          initialDate: DateTime.now(),
                          builder: (context,child){
                            return Transform.scale(
                              scale: 1.8,
                              child: Theme(data: ThemeData.dark().copyWith(
                                colorScheme: const ColorScheme.dark(
                                  primary: AppColors.darkPrimary,
                                  onPrimary: AppColors.white,
                                  onSurface: AppColors.white,
                                  
                                ),
                                dialogBackgroundColor: AppColors.lightPurple1,
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    foregroundColor: AppColors.darkPrimary,
                                    textStyle: AppStyles.styleRegular20(context)
                                  )
                                )
                              ), child: child!),
                            );
                          });
                      date == null
                          ? _dateController.text = 'no date selected'
                          : _dateController.text = formatter.format(date);
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(
                  width: width * 0.05,
                ),
                Expanded(
                  child: CustomTextField(
                      hintText: 'dream title',
                      maxLines: 2,
                      label: 'Dream Title:',
                      controller: _dreamTitleController),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.05,
            ),
            CustomTextField(
                hintText: 'write your dream',
                maxLines: 4,
                label: 'Write Your Dream :',
                controller: _writeDreamController),
             SizedBox(
              height: height*0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: 1.3,
                  child: CustomButton(onPressed: () {}, title: 'SaveDream')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
