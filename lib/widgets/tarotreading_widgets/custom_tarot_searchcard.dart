import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:divinecontrol/widgets/tarotreading_widgets/custom_search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomSearchQuestionCard extends StatelessWidget {
  const CustomSearchQuestionCard({super.key, this.title});
  //  final GridViewItemModel itemModel;
  // final void Function(CustomSearchQuestionCardModel itemModel) onSlectedItem;
  final String? title;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return getNewMobileCustomSearchQuestionCard(context, width, height);
  }

  Widget getNewMobileCustomSearchQuestionCard(
      BuildContext context, double width, double height) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.hardEdge,
      child: Container(
        width: width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: width,
                  height: height / 8,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    AppColors.darkPrimary,
                    AppColors.primary,
                    AppColors.darkPrimary
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
                  // child: Image.asset(AppImages.whereistarotBg,fit: BoxFit.fill,)
                ),
                Positioned(
                  // child: Image.asset(itemModel.image),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: SizedBox(
                        width: width * 0.16,
                        child: Image.asset(
                          AppImages.newcard,
                          fit: BoxFit.fill,
                        )),
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  Text("Think Deeply And Ask Your Qusetion",
                      textAlign: TextAlign.center,
                      style: AppStyles.styleRufinaBold32(context).copyWith(
                          color: AppColors.darkPrimary,
                          fontWeight: FontWeight.w900,
                          fontSize: getResponsiveFontSizeText(context,
                              fontSize: width < AppConstants.maxMobileWidth
                                  ? 20
                                  : 24))),
                  Text(
                    "The Universe speaks in whispers.\nTune in with the Tarot and hear its message.✨\nUncover your journey.\nTune in to Know the secret of your fate !!",textAlign: TextAlign.center,
                    // "The Universe speaks in whispers.\nTune in with the Tarot and hear its message.✨",textAlign: TextAlign.center,
                    style: AppStyles.styleRegular20(context).copyWith(
                        color: AppColors.darkPrimary,fontWeight: FontWeight.w500,
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize: 20)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                
                ],
              ),
            ),
              Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: CustomSearchTextField(
                        labelText: "Ask Me",
                        maxLines: 1,
                        prefixIcon: const Icon(FontAwesomeIcons.searchengin),
                        hintText: "What Do You Think",
                        onChanged: (value) {}),
                  ),
          ],
        ),
      ),
    );
  }

  // Widget getDesktopCustomSearchQuestionCard(BuildContext context, double width,double height) {
  //   return  Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Container(
  //             width: width,
  //             height: height/5,
  //             decoration: const BoxDecoration(
  //               borderRadius: BorderRadius.only(
  //                   topLeft: Radius.circular(20),
  //                   topRight: Radius.circular(20)),
  //             ),
  //             child: Stack(
  //               alignment: Alignment.center,
  //               children: [
  //                 Positioned(
  //                   top: 0,
  //                   left: 0,
  //                   child: Image.asset(itemModel.imageBg)),
  //                   Container(
  //                     padding:const EdgeInsets.all(10),
  //                     child: Image.asset(itemModel.image))
  //               ],
  //             )),
  //         Expanded(

  //           child: ListView(
  //             padding: const EdgeInsets.only(left: 5,right: 5),
  //             children: [
  //               Text(itemModel.title,
  //                   style: AppStyles.styleSemiBold24(context).copyWith(
  //                       color: AppColors.black,
  //                       fontSize:
  //                           getResponsiveFontSizeText(context, fontSize: 28))),
  //                            Text(itemModel.subTitle,style: AppStyles.styleRegular20(context).copyWith(fontWeight: FontWeight.w600,fontSize: getResponsiveFontSizeText(context, fontSize: 24)),),
  //               Text(itemModel.description,

  //                   style: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 24))),
  //             ],
  //           ),
  //         ),

  //       ],

  //   );
  // }
}
