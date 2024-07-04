import 'dart:developer';

import 'package:divinecontrol/widgets/dream_meaning_widgets/history_button.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';
import '../../widgets/dream_meaning_widgets/custom_dropdown_list.dart';

class DreamMeaning extends StatefulWidget {
  const DreamMeaning({super.key});

  @override
  State<DreamMeaning> createState() => _DreamMeaningState();
}

class _DreamMeaningState extends State<DreamMeaning> {
  final List<String> items = [
    'A_Item1',
    'A_Item2',
    'A_Item3',
    'A_Item4',
    'B_Item1',
    'B_Item2',
    'B_Item3',
    'B_Item4',
  ];

  final List<String> dreams = [
    'A_Item1 dream description',
    'A_Item2 dream description',
    'A_Item3 dream description',
    'A_Item4 dream description',
    'B_Item1 dream description',
    'B_Item2 dream description',
    'B_Item3 dream description',
    'B_Item4 dream description',
  ];
  int selectedDream = 0;
  String? dreamDescription = ".....................";
  String? dreamTitle = "select a dream";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar:const CustomAppBar(title: "Dream Meaning", leading: true),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.5),
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomDropdownList(
              onChanged: (value) {
                dreamTitle = "";
                dreamDescription = "";
                setState(() {
                  dreamTitle = value;
                  selectedDream = items.indexOf(value!);
                  log(selectedDream.toString());
                  log(dreamTitle.toString());
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Container(
                width: width * 0.9,
                height: height * 0.4,
                decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: Colors.black54)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "YourDream :",
                          style: width < AppConstants.maxMobileWidth
                            ? AppStyles.styleBold24(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 20))
                              : AppStyles.styleBold32(context).copyWith(color: AppColors.black),
                        ),
                        Text(dreamTitle!,
                            style: width < AppConstants.maxMobileWidth
                                ? AppStyles.styleRegular20(context)
                                : AppStyles.styleRegular20(context).copyWith(
                                    fontSize: getResponsiveFontSizeText(context,
                                        fontSize: 28)),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Meaning :',
                        style: width < AppConstants.maxMobileWidth
                            ? AppStyles.styleBold24(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 20))
                            : AppStyles.styleBold32(context).copyWith(color: AppColors.black),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        dreamDescription!,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 6,
                        style: AppStyles.styleRegular20(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 18:28),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                    onPressed: () {
                      setState(() {
                        dreamDescription = dreams[selectedDream];
                      });
                    },
                    title: "Interpret"),
              ],
            ),
            SizedBox(
              height: height * 0.1,
            )
          ],
        ),
      ),
    );
  }
}
