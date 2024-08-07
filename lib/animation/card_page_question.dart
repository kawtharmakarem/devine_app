import 'dart:math';

import 'package:divinecontrol/models/tarotreading_models/gridview_item_model.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:divinecontrol/widgets/tarotreading_widgets/item_result_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_styles.dart';
import 'card_values.dart';

class CardsPageQuestion extends StatefulWidget {
  const CardsPageQuestion({
    super.key,
    required this.title,
    required this.itemModel,
  });
  final String title;
  final GridViewItemModel itemModel;

  @override
  State<CardsPageQuestion> createState() => _CardsPageQuestionState();
}

class _CardsPageQuestionState extends State<CardsPageQuestion> {
  CardsList cardsList = CardsList();
  int? pageIndex;
  bool moved = false;

  List<bool> isMoved = [
    for (int i = 0; i < cardValues.length; i++) ...{false}
  ];

  List<double> leftList = [
    for (int i = 0; i < cardValues.length; i++) ...{
      145 *
          sin((i - (cardValues.length - 1) / 2) /
              (cardValues.length - 1) *
              0.8 *
              pi)
    }
  ];

  List<double> topList = [
    for (int i = 0; i < cardValues.length; i++) ...{
      145 *
          cos((i - (cardValues.length - 1) / 2) /
              (cardValues.length - 1) *
              0.8 *
              pi)
    }
  ];

  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: CustomAppBar(title: widget.title, leading: true),
      backgroundColor: AppColors.lightPurple1,
      body: SingleChildScrollView(
        child: Column(
          
          children: [
            Transform.translate(
              offset: Offset(0, 0),
              child: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.myGray),
                    child: Text(
                      'Choose On Card',
                      style: AppStyles.styleRegular20(context).copyWith(
                          color: AppColors.darkPrimary,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.6,
                    child: Image.asset(AppImages.tarotCardGirl),
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: Offset(0, -150),
              child: SizedBox(
                width: 460,
                height: MediaQuery.of(context).size.height * 0.8,
                child: Stack(
                  children: List.generate(cardValues.length, (index) {
                    return AnimatedPositioned(
                      curve: decelerateEasing,
                      left: MediaQuery.of(context).size.width / 2 +
                          leftList[index] -
                          MediaQuery.sizeOf(context).width * 0.09,
                      top: MediaQuery.of(context).size.height / 8 +
                          topList[index],
                      duration: const Duration(seconds: 1),
                      child: SizedBox(
                        height: 170,
                        width: 70,
                        child: InkWell(
                          onTap: () {
                            if (isMoved[index]) {
                              topList[index] = 145 *
                                  cos((index - (cardValues.length - 1) / 2) /
                                      (cardValues.length - 1) *
                                      0.8 *
                                      pi);
                              leftList[index] = 145 *
                                  sin((index - (cardValues.length - 1) / 2) /
                                      (cardValues.length - 1) *
                                      0.8 *
                                      pi);
                              isMoved[index] = false;
                              moved = false;
                            } else {
                              topList[index] = 270; //350
                              leftList[index] = 0;
                              isMoved[index] = true;
                              moved = true;
                              pageIndex = index;
                            }
                            setState(() {});
                          },
                          child: cardsList.setCardList()[index],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, -230),
              child: GestureDetector(
                onTap: () {
                  if (moved) {
                    //Get.to(()=>ItemResultDetails(results: widget.itemModel.results, index: pageIndex!),arguments: widget.title,transition: Transition.circularReveal,duration: const Duration(seconds: AppConstants.durationSecond));
                    Get.to(()=>ItemResultDetails(results: widget.itemModel.results, index: Random().nextInt(pageIndex!)),arguments: widget.title,transition: Transition.circularReveal,duration: const Duration(seconds: AppConstants.durationSecond));
                  } else {
                    Future.delayed(const Duration(seconds: 4), () {
                      topList = [
                        for (int i = 0; i < cardValues.length; i++) ...{0}
                      ];
                      leftList = [
                        for (int i = 0; i < cardValues.length; i++) ...{0}
                      ];
                      setState(() {});
                    });
                    Future.delayed(const Duration(seconds: 5), () {
                      topList = [
                        for (int i = 0; i < cardValues.length; i++) ...{
                          145 *
                              cos((i - (cardValues.length - 1) / 2) /
                                  (cardValues.length - 1) *
                                  0.8 *
                                  pi)
                        }
                      ];
                      leftList = [
                        for (int i = 0; i < cardValues.length; i++) ...{
                          145 *
                              sin((i - (cardValues.length - 1) / 2) /
                                  (cardValues.length - 1) *
                                  0.8 *
                                  pi)
                        }
                      ];
                      setState(() {});
                    });
                    Future.delayed(const Duration(seconds: 1), () {
                      topList.shuffle();
                      leftList.shuffle();
                      setState(() {});
                    });
                    Future.delayed(const Duration(seconds: 2), () {
                      topList.shuffle();
                      leftList.shuffle();
                      setState(() {});
                    });
                    Future.delayed(const Duration(seconds: 3), () {
                      topList.shuffle();
                      leftList.shuffle();
                      setState(() {});
                    });
                    topList.shuffle();
                    leftList.shuffle();
                    cardValues.shuffle();
                    setState(() {});
                  }
                },
                child: Container(
                  // margin: const EdgeInsets.all(15),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: width * 0.8,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: moved ? AppColors.darkPrimary : Colors.white,
                      border:
                          Border.all(width: 2, color: AppColors.darkPrimary),
                      borderRadius: BorderRadius.circular(15)),
                  child: moved
                      ? const Text(
                          'This one',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      : const Text(
                          'Shuffle Cards',
                          style: TextStyle(
                              fontSize: 20, color: Colors.deepPurpleAccent),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardsList {
  setCardList() {
    List cardList = [
      for (int i = 0; i < cardValues.length; i++) ...{
        // Image.asset('assets/card.jpg')
        Image.asset(AppImages.newcard)
      }
    ];
    return cardList;
  }
}
