import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/tarotreading_models/gridview_item_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../utils/app_images.dart';
import '../utils/app_styles.dart';
import '../widgets/homepage_widgets/custom_appbar.dart';
import '../widgets/tarotreading_widgets/item_result_details.dart';
import 'card_values.dart';

class CardsPageTabletQuestion extends StatefulWidget {
  const CardsPageTabletQuestion(
      {super.key, required this.itemModel, required this.title});
  final String title;
  final GridViewItemModel itemModel;
  @override
  State<CardsPageTabletQuestion> createState() =>
      _CardsPageTabletQuestionState();
}

class _CardsPageTabletQuestionState extends State<CardsPageTabletQuestion> {
  CardsList cardsList = CardsList();
  int? pageIndex;
  bool moved = false;

  List<bool> isMoved = [
    for (int i = 0; i < cardValues.length; i++) ...{false}
  ];

  List<double> leftList = [
    for (int i = 0; i < cardValues.length; i++) ...{
      200 *
          sin((i - (cardValues.length - 1) / 2) /
              (cardValues.length - 1) *
              0.8 *
              pi)
    }
  ];

  List<double> topList = [
    for (int i = 0; i < cardValues.length; i++) ...{
      200 *
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
      body: width < AppConstants.maxTabletWidth
          ? getTabletCardsPage(context, width)
          : getDesktopCardsPage(context, width),
    );
  }

  SingleChildScrollView getTabletCardsPage(BuildContext context, double width) {
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
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
                        fontWeight: FontWeight.w500,
                        fontSize: getResponsiveFontSizeText(context,
                            fontSize:
                                width < AppConstants.maxMobileWidth ? 20 : 28)),
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
            offset: Offset(-50, -100),
            child: Transform.scale(
              scale: 1.5,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.of(context).size.height * 0.8,
                child: Stack(
                  children: List.generate(cardValues.length, (index) {
                    return AnimatedPositioned(
                      curve: decelerateEasing,
                      left: MediaQuery.of(context).size.width / 2 +
                          leftList[index],
                      top: MediaQuery.of(context).size.height / 8 +
                          topList[index],
                      duration: const Duration(seconds: 1),
                      child: SizedBox(
                        height: 170,
                        width: 70,
                        child: InkWell(
                          onTap: () {
                            if (isMoved[index]) {
                              topList[index] = 200 *
                                  cos((index - (cardValues.length - 1) / 2) /
                                      (cardValues.length - 1) *
                                      0.8 *
                                      pi);
                              leftList[index] = 200 *
                                  sin((index - (cardValues.length - 1) / 2) /
                                      (cardValues.length - 1) *
                                      0.8 *
                                      pi);
                              isMoved[index] = false;
                              moved = false;
                            } else {
                              topList[index] = 350; //350
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
          ),
          Transform.translate(
            offset: Offset(0, -350),
            child: GestureDetector(
              onTap: () {
                if (moved) {
                  Get.to(
                      () => ItemResultDetails(
                          results: widget.itemModel.results,
                          index: Random().nextInt(pageIndex!)),
                      arguments: widget.title,
                      transition: Transition.size,
                      duration:
                          const Duration(seconds: AppConstants.durationSecond));
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
                        200 *
                            cos((i - (cardValues.length - 1) / 2) /
                                (cardValues.length - 1) *
                                0.8 *
                                pi)
                      }
                    ];
                    leftList = [
                      for (int i = 0; i < cardValues.length; i++) ...{
                        200 *
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
                width: width * 0.4,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: moved ? AppColors.darkPrimary : Colors.white,
                    border: Border.all(width: 2, color: AppColors.darkPrimary),
                    borderRadius: BorderRadius.circular(15)),
                child: moved
                    ? Text(
                        'This one',
                        style: AppStyles.styleRegular20(context).copyWith(
                            fontSize: getResponsiveFontSizeText(context,
                                fontSize: 28)),
                      )
                    : Text('Shuffle Cards',
                        style: AppStyles.styleRegular20(context).copyWith(
                            color: AppColors.darkPrimary,
                            fontSize: getResponsiveFontSizeText(context,
                                fontSize: 28))),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getDesktopCardsPage(BuildContext context, double width) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                        fontWeight: FontWeight.w500,
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize: 32)),
                  ),
                ),
                SizedBox(
                  width: width * 0.4,
                  child: Image.asset(AppImages.tarotCardGirl),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(200, -500),
            child: Transform.scale(
              scale: 2,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.of(context).size.height * 0.8,
                child: Stack(
                  children: List.generate(cardValues.length, (index) {
                    return AnimatedPositioned(
                      curve: decelerateEasing,
                      left: MediaQuery.of(context).size.width / 2 +
                          leftList[index],
                      top: MediaQuery.of(context).size.height / 8 +
                          topList[index],
                      duration: const Duration(seconds: 1),
                      child: SizedBox(
                        height: 170,
                        width: 70,
                        child: InkWell(
                          onTap: () {
                            if (isMoved[index]) {
                              topList[index] = 200 *
                                  cos((index - (cardValues.length - 1) / 2) /
                                      (cardValues.length - 1) *
                                      0.8 *
                                      pi);
                              leftList[index] = 200 *
                                  sin((index - (cardValues.length - 1) / 2) /
                                      (cardValues.length - 1) *
                                      0.8 *
                                      pi);
                              isMoved[index] = false;
                              moved = false;
                            } else {
                              topList[index] = 350; //350
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
          ),
          Transform.translate(
            offset: Offset(900, -550),
            child: GestureDetector(
              onTap: () {
                if (moved) {
                  Get.to(
                      () => ItemResultDetails(
                          results: widget.itemModel.results,
                          index: Random().nextInt(pageIndex!)),
                      arguments: widget.title,
                      transition: Transition.size,
                      duration:
                          const Duration(seconds: AppConstants.durationSecond));
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
                        200 *
                            cos((i - (cardValues.length - 1) / 2) /
                                (cardValues.length - 1) *
                                0.8 *
                                pi)
                      }
                    ];
                    leftList = [
                      for (int i = 0; i < cardValues.length; i++) ...{
                        200 *
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
                width: width * 0.3,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: moved ? AppColors.darkPrimary : Colors.white,
                    border: Border.all(width: 2, color: AppColors.darkPrimary),
                    borderRadius: BorderRadius.circular(15)),
                child: moved
                    ? Text(
                        'This one',
                        style: AppStyles.styleRegular20(context).copyWith(
                            fontSize: getResponsiveFontSizeText(context,
                                fontSize: 32)),
                      )
                    : Text('Shuffle Cards',
                        style: AppStyles.styleRegular20(context).copyWith(
                            color: AppColors.darkPrimary,
                            fontSize: getResponsiveFontSizeText(context,
                                fontSize: 32))),
              ),
            ),
          )
        ],
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
