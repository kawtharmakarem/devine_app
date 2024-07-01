import 'dart:math';

import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../models/tarotreading_models/gridview_item_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_styles.dart';
import '../widgets/tarotreading_widgets/item_details.dart';
import 'card_values.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({super.key, required this.itemModel});
  final GridViewItemModel itemModel;
  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  CardsList cardsList = CardsList();
  int? pageIndex;
  bool moved = false;

  

  List<bool> isMoved = [
    for (int i = 0; i < cardValues.length; i++) ...{false}
  ];

  List<double> leftList = [
    for (int i = 0; i < cardValues.length; i++) ...{
       150 *
          sin((i - (cardValues.length - 1) / 2) /
              (cardValues.length - 1) *
              0.8 *
              pi)
    }
  ];

  List<double> topList = [
    for (int i = 0; i < cardValues.length; i++) ...{
      150 *
          cos((i - (cardValues.length - 1) / 2) /
              (cardValues.length - 1) *
              0.8 *
              pi)
    }
  ];

 
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.lightPurple2,
        body: getCardPageContent(context, width, height),
      ),
    );
  }

  SingleChildScrollView getCardPageContent(
      BuildContext context, double width, double height) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  splashColor: AppColors.purple,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(AppImages.leftarrow)),
              Text(
                widget.itemModel.title,
                style: AppStyles.styleSemiBold24(context).copyWith(
                    fontSize: getResponsiveFontSizeText(context,
                        fontSize:
                            width < AppConstants.maxMobileWidth ? 24 : 50)),
              ),
              const SizedBox(),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5)),
            child: Text(
              'Choose One Card',
              style:AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 20:28))
            
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset(AppImages.shuffleImage),
          SizedBox(
            width: width,
            height: MediaQuery.of(context).size.height ,
            child: Stack(children: [
              ...List.generate(cardValues.length, (index) {
                return AnimatedPositioned(
                 
                  curve: decelerateEasing,
                  left:
                     // MediaQuery.of(context).size.width / 2 + leftList[index],
                      MediaQuery.of(context).size.width /2 + leftList[index]-width*0.08333,
                   top: MediaQuery.of(context).size.height / 200 + topList[index],
                   
                  duration: const Duration(seconds: 1),
                  child: SizedBox(
                    height: 170,
                    width: 70,
                    child: InkWell(
                      onTap: () {
                        width < AppConstants.maxMobileWidth
                            ? 
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) =>
                            //         ItemDetails(itemModel: widget.itemModel),
                            //         ),
                            //         )
                            Get.to(()=>ItemDetails(itemModel: widget.itemModel),transition: Transition.size,duration: const Duration(seconds: 3))
                            : showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: ItemDetails(
                                        itemModel: widget.itemModel),
                                  );
                                });
                        // if(isMoved [index]){
                        //   topList[index] =
                        //       200 *
                        //           cos((index - (cardValues.length - 1) / 2) /
                        //               (cardValues.length - 1) *
                        //               0.8 *
                        //               pi);
                        //   leftList[index] =
                        //       200 *
                        //           sin((index - (cardValues.length - 1) / 2) /
                        //               (cardValues.length - 1) *
                        //               0.8 *
                        //               pi);
                        //   isMoved[index] = false;
                        //   moved = false;
                        // }else{
                        //   topList[index] = 350;
                        //   leftList[index] = 0;
                        //   isMoved[index] = true;
                        //   moved = true;
                        //   pageIndex = index;
                        // }
                        // setState(() {});
                      },
                      child: cardsList.setCardList()[index],
                    ),
                  ),
                );
              }),
              Positioned(
                top: height / 2,
                right: width / 2 - 150,
                left: width / 2 - 150,
                child: GestureDetector(
                  onTap: () {
                    if (moved) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => cardValues[pageIndex!]));
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
                            150 *
                                cos((i - (cardValues.length - 1) / 2) /   
                                    (cardValues.length - 1) *
                                    0.8 *
                                    pi)
                          }
                        ];
                        leftList = [
                          for (int i = 0; i < cardValues.length; i++) ...{
                            150 *
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
                    margin: const EdgeInsets.all(20),
                    //padding: const EdgeInsets.symmetric(horizontal: 50 , vertical: 20),
                    width: width*0.5,
                    height: height * 0.07,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColors.lightPurple1,
                        border: Border.all(width: 2, color: AppColors.purple),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text('Shuffle Cards',
                        style:AppStyles.styleBold24(context).copyWith(color: AppColors.darkPrimary,
                                fontSize: getResponsiveFontSizeText(context,
                                    fontSize:width<AppConstants.maxMobileWidth? 20: 40))),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class CardsList {
  setCardList() {
    List cardList = [
      for (int i = 0; i < cardValues.length; i++) ...{
        Image.asset('assets/tarotimages/card.png')
      }
    ];
    return cardList;
  }
}
