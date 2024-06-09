import 'package:divinecontrol/models/numerlogy_models/numer_table_model.dart';
import 'package:divinecontrol/screens/numerology_screens/numerology_details_screen.dart';
import 'package:divinecontrol/widgets/numerology_widgets/custom_table_widet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';
import '../../widgets/numerology_widgets/custom_numerlogy_card.dart';

class Numerology extends StatelessWidget {
  const Numerology({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
      appBar: AppBar(
        title: Text(
          'Numerology',
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
      body: width < AppConstants.maxMobileWidth
          ? getMobileNumerologyContent(context, width)
          : width < AppConstants.maxTabletWidth
              ? getTabletNumerologyContent(context, width)
              : getDeskTopNumerologyContent(context, width),
    );
  }

  Padding getMobileNumerologyContent(BuildContext context, double width) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomNumerlogyCard(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>const NumerologyDetailsScreen()));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Table(
                  border: const TableBorder(
                      horizontalInside: BorderSide(width: 1),
                      verticalInside: BorderSide(width: 1)),
                  children: [
                    for (final item in items)
                      TableRow(children: [
                        CustomTableWidget(numerologyTableModel: item)
                      ])
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding getTabletNumerologyContent(BuildContext context, double width) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomNumerlogyCard(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>const NumerologyDetailsScreen()));
              },
            ),
            const SizedBox(
              height: 40,
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Table(
                  border: const TableBorder(
                      horizontalInside: BorderSide(width: 1),
                      verticalInside: BorderSide(width: 1)),
                  children: [
                    for (final item in items)
                      TableRow(children: [
                        CustomTableWidget(numerologyTableModel: item)
                      ])
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding getDeskTopNumerologyContent(BuildContext context, double width) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CustomNumerlogyCard(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>const NumerologyDetailsScreen()));
              },
            ),
          ),
          const SizedBox(width: 20,),
          Expanded(
            child: Card(
              
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Table(
                border: const TableBorder(
                    horizontalInside: BorderSide(width: 1),
                    verticalInside: BorderSide(width: 1)),
                children: [
                  for (final item in items)
                    TableRow(children: [
                      CustomTableWidget(numerologyTableModel: item)
                    ])
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  static final List<NumerologyTableModel> items = [
    NumerologyTableModel(
        image: AppImages.luckyNumbers,
        title: 'Lucky Numbers',
        subtitle: "1, 3, 4, 10"),
    NumerologyTableModel(
        image: AppImages.color, title: 'Lucky Colors', subtitle: "Blue, Gray"),
    NumerologyTableModel(
        image: AppImages.day,
        title: 'Lucky Days',
        subtitle: "Sunday, Saturday"),
    NumerologyTableModel(
        image: AppImages.stone,
        title: 'Lucky Gemstones',
        subtitle: "Diamond, Coral, Pearl"),
  ];
}
