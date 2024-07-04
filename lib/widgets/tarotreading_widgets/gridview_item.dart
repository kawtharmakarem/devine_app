import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/tarotreading_models/gridview_item_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem(
      {super.key, required this.itemModel, required this.onSlectedItem});
  final GridViewItemModel itemModel;
  final void Function(GridViewItemModel itemModel) onSlectedItem;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: () => onSlectedItem(itemModel),
      child: Card(
      elevation: 4,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: width < AppConstants.maxTabletWidth
          ? getNewMobileGridViewItem(context, width,height)
          : getDesktopGridViewItem(context, width,height),
    ));
  }

  // Widget getMobileGridViewItem(BuildContext context, double width) {
  //   return GestureDetector(
  //     onTap: () => onSlectedItem(itemModel),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         ClipRRect(
  //             borderRadius: const BorderRadius.only(
  //                 topLeft: Radius.circular(20), topRight: Radius.circular(20)),
  //             child: Container(
  //                width: double.infinity,

  //                 decoration: const BoxDecoration(
  //                   borderRadius: BorderRadius.only(
  //                       topLeft: Radius.circular(20),
  //                       topRight: Radius.circular(20)),
  //                 ),
  //                 child: Image.asset(itemModel.image))),
  //         Expanded(
  //           child: ListView(
  //             padding: const EdgeInsets.only(left: 5,right: 5),
  //             //shrinkWrap: true,
  //             children: [
  //               Text(itemModel.title,
  //                   style: AppStyles.styleSemiBold24(context).copyWith(
  //                       color: AppColors.black,
  //                       fontSize: getResponsiveFontSizeText(context,
  //                           fontSize: width < AppConstants.maxMobileWidth
  //                               ? 20
  //                               : 24))),
  //                               Text('Date',style: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 18:20)),),
  //               Text(itemModel.description,
  //                   style: AppStyles.styleRegular20(context).copyWith(
  //                       color: AppColors.black,
  //                       fontSize: getResponsiveFontSizeText(context,
  //                           fontSize: width < AppConstants.maxMobileWidth
  //                               ? 18
  //                               : 20))),
  //             ],
  //           ),
  //         ),
  //         // width < AppConstants.maxMobileWidth
  //         //     ? Container()
  //         //     : const Expanded(child: SizedBox()),
  //         Container(
  //           padding: const EdgeInsets.only(left: 5),
  //           child: Row(
  //             children: [
  //               Row(
  //                 children: [
  //                   SvgPicture.asset(AppImages.hand),
  //                   Text(
  //                     '${itemModel.likesNumber}',
  //                     style: AppStyles.styleBold24(context).copyWith(
  //                         color: AppColors.black,
  //                         fontSize:
  //                             getResponsiveFontSizeText(context, fontSize: 18)),
  //                   )
  //                 ],
  //               ),
  //               Row(
  //                 children: [
  //                   SvgPicture.asset(AppImages.eye),
  //                   Text(
  //                     '${itemModel.seeNumber}k',
  //                     style: AppStyles.styleBold24(context).copyWith(
  //                         color: AppColors.black,
  //                         fontSize:
  //                             getResponsiveFontSizeText(context, fontSize: 18)),
  //                   )
  //                 ],
  //               )
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }



Widget getNewMobileGridViewItem(BuildContext context, double width,double height) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
             height:width<AppConstants.maxMobileWidth? height/8:height/10,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: width,
                    height: height/5,
                    child: Image.asset(itemModel.imageBg,fit: BoxFit.fill,)),
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset(itemModel.image),
                      ),
                    )
                ],
              )),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(left: 5,right: 5),
              //shrinkWrap: true,
              children: [
                Text(itemModel.title,
                    style: AppStyles.styleSemiBold24(context).copyWith(
                        color: AppColors.black,
                        fontSize: getResponsiveFontSizeText(context,
                            fontSize: width < AppConstants.maxMobileWidth
                                ? 20
                                : 24))),
                                Text('Date',style: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 18:20)),),
                Text(itemModel.description,
                    style: AppStyles.styleRegular20(context).copyWith(
                        color: AppColors.black,
                        fontSize: getResponsiveFontSizeText(context,
                            fontSize: width < AppConstants.maxMobileWidth
                                ? 18
                                : 20))),
              ],
            ),
          ),
          // width < AppConstants.maxMobileWidth
          //     ? Container()
          //     : const Expanded(child: SizedBox()),
          Container(
            padding: const EdgeInsets.only(left: 5),
            child: Row(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(AppImages.hand),
                    Text(
                      '${itemModel.likesNumber}',
                      style: AppStyles.styleBold24(context).copyWith(
                          color: AppColors.black,
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 18)),
                    )
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(AppImages.eye),
                    Text(
                      '${itemModel.seeNumber}k',
                      style: AppStyles.styleBold24(context).copyWith(
                          color: AppColors.black,
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 18)),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      
    );
  }


  Widget getDesktopGridViewItem(BuildContext context, double width,double height) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: width,
              height: height/5,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Image.asset(itemModel.imageBg)),
                    Container(
                      padding:const EdgeInsets.all(10),
                      child: Image.asset(itemModel.image))
                ],
              )),
          Expanded(
            
            child: ListView(
              padding: const EdgeInsets.only(left: 5,right: 5),
              children: [
                Text(itemModel.title,
                    style: AppStyles.styleSemiBold24(context).copyWith(
                        color: AppColors.black,
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize: 28))),
                            Text('Date',style: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 24)),),
                Text(itemModel.description,
                   
                    style: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 24))),
              ],
            ),
          ),
          // width < AppConstants.maxMobileWidth
          //     ? Container()
          //     : const Expanded(child: SizedBox()),
          Row(
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppImages.hand,width: 30,height: 30,),
                  Text(
                    '${itemModel.likesNumber}',
                    style: AppStyles.styleBold24(context).copyWith(
                        color: AppColors.black,
                       ),
                  )
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(AppImages.eye,width: 30,height: 30,),
                  Text(
                    '${itemModel.seeNumber}k',
                    style: AppStyles.styleBold24(context).copyWith(
                        color: AppColors.black,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      
    );
  }
}
