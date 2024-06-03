import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/tarotreading_models/gridview_item_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';
import '../../utils/tarot_constants.dart';


class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key, required this.itemModel});
  final GridViewItemModel itemModel;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return width < TarotAppConstants.mobileMaxWidth || width>TarotAppConstants.tabletMaxWidth
        ? Scaffold(
            backgroundColor: AppColors.lightPurple2,
            appBar: AppBar(
              backgroundColor: AppColors.lightPurple2,

              title: Text(itemModel.title,
                  style: AppStyles.styleSemiBold24(context).copyWith(
                      fontSize:
                          getResponsiveFontSizeTextTarot(context, fontSize: 32))),
                          leading: IconButton(onPressed: (){
                            Navigator.pop(context);
                          }, icon: SvgPicture.asset(AppImages.leftArrow)),
            ),
            body:width<TarotAppConstants.mobileMaxWidth? getMobileItemDetails(height, context):getDesktopItemDetails(height, context),
          )
        : Container(
          padding: const EdgeInsets.all(40),
          margin: const EdgeInsets.all(20),
          decoration:const BoxDecoration(color: AppColors.lightPurple2),
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(itemModel.title,
                    style: AppStyles.styleSemiBold24(context).copyWith(
                        fontSize:
                            getResponsiveFontSizeTextTarot(context, fontSize: 40))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 4,
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          itemModel.image,
                          fit: BoxFit.fill,
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: height * 0.09,
                        child: Text(
                          'Find Out Here',
                          style: AppStyles.styleSemiBold24(context).copyWith(
                              fontSize: getResponsiveFontSizeTextTarot(context,
                                  fontSize: 40)),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      itemModel.title,
                      style: AppStyles.styleSemiBold24(context)
                          .copyWith(color: AppColors.black,fontSize: getResponsiveFontSizeTextTarot(context, fontSize: 32)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(itemModel.description,
                        style: AppStyles.styleRegular18(context)
                            .copyWith(color: AppColors.black,fontSize: getResponsiveFontSizeTextTarot(context, fontSize: 32))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(AppImages.hand,height: 30,width: 30,),
                            Text(
                              '${itemModel.likesNumber}',
                              style: AppStyles.styleBold24(context)
                                  .copyWith(color: AppColors.black,fontSize: getResponsiveFontSizeTextTarot(context, fontSize: 40)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(AppImages.eye,width: 25,height: 25,),
                            Text(
                              '${itemModel.seeNumber}k',
                              style: AppStyles.styleBold24(context)
                                  .copyWith(color: AppColors.black,fontSize: getResponsiveFontSizeTextTarot(context, fontSize: 40)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding:const EdgeInsets.all(20),
                        decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(80)),
                        child: SvgPicture.asset(AppImages.save,height: 30,width: 30,)),
                      const SizedBox(width: 10,),
                      Container(
                        padding:const EdgeInsets.all(20),
                        decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(80)),
                        child: SvgPicture.asset(AppImages.share,height: 30,width: 30,)),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 60,
                      width: width*0.15,
                      decoration: BoxDecoration(border: Border.all(width: 1,color: AppColors.purple)),
                      child: ElevatedButton(onPressed: (){
                        Navigator.pop(context);
                      }, style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.lightPurple1,
                        textStyle: AppStyles.styleBold24(context).copyWith(fontSize: getResponsiveFontSizeTextTarot(context, fontSize: 40),color: AppColors.purple),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)
                        )
                      ),child:const Text('Ok')),
                    ),
                  ),
                ],
              ),
        );
  }



  Padding getMobileItemDetails(double height, BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 4,
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(
                        itemModel.image,
                        fit: BoxFit.fill,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: height * 0.09,
                      child: Text(
                        'Find Out Here',
                        style: AppStyles.styleSemiBold24(context).copyWith(
                            fontSize: getResponsiveFontSizeTextTarot(context,
                                fontSize: 40)),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    itemModel.title,
                    style: AppStyles.styleSemiBold24(context)
                        .copyWith(color: AppColors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(itemModel.description,
                      style: AppStyles.styleRegular18(context)
                          .copyWith(color: AppColors.black)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppImages.hand),
                          Text(
                            '${itemModel.likesNumber}',
                            style: AppStyles.styleBold24(context)
                                .copyWith(color: AppColors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(AppImages.eye),
                          Text(
                            '${itemModel.seeNumber}k',
                            style: AppStyles.styleBold24(context)
                                .copyWith(color: AppColors.black),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding:const EdgeInsets.all(20),
                      decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(80)),
                      child: SvgPicture.asset(AppImages.save,height: 20,width: 20,)),
                    const SizedBox(width: 10,),
                    Container(
                      padding:const EdgeInsets.all(20),
                      decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(80)),
                      child: SvgPicture.asset(AppImages.share,height: 20,width: 20,)),
                  ],
                )
              ],
            ),
          );
  }


   Padding getDesktopItemDetails(double width, BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 4,
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    width: width*0.8,
                    child: Image.asset(
                      itemModel.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding:const EdgeInsets.symmetric(vertical: 20),
                    width: width*0.8,
                    child: Text(
                      'Find Out Here',textAlign: TextAlign.center,
                      style: AppStyles.styleSemiBold24(context),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    itemModel.title,
                    style: AppStyles.styleSemiBold24(context)
                        .copyWith(color: AppColors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(itemModel.description,
                      style: AppStyles.styleRegular18(context)
                          .copyWith(color: AppColors.black)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppImages.hand,width: 25,height: 25,),
                          Text(
                            '${itemModel.likesNumber}',
                            style: AppStyles.styleBold32(context)
                                .copyWith(color: AppColors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(AppImages.eye,width: 25,height: 25,),
                          Text(
                            '${itemModel.seeNumber}k',
                            style: AppStyles.styleBold32(context)
                                .copyWith(color: AppColors.black),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding:const EdgeInsets.all(20),
                      decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(80)),
                      child: SvgPicture.asset(AppImages.save,height: 40,width: 40,)),
                    const SizedBox(width: 10,),
                    Container(
                      padding:const EdgeInsets.all(20),
                      decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(80)),
                      child: SvgPicture.asset(AppImages.share,height: 40,width: 40,)),
                  ],
                )
              ],
            ),
          );
  }
}
