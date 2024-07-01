import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/tarotreading_models/gridview_item_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';


class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key, required this.itemModel});
  final GridViewItemModel itemModel;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
            backgroundColor: AppColors.lightPurple1,
            appBar: AppBar(
              backgroundColor: AppColors.lightPurple2,

              title: Text(itemModel.title,
                  style: AppStyles.styleSemiBold24(context).copyWith(
                      fontSize:
                           getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxTabletWidth? 28:40))),
                          leading: IconButton(onPressed: (){
                            Navigator.pop(context);
                          }, icon: SvgPicture.asset(AppImages.leftArrow)),
            ),
            body:width <  AppConstants.maxTabletWidth ? getMobileItemDetails(height, width,context):
            // width<AppConstants.maxTabletWidth? getTabletItemDetails(width, context): 
            getDesktopItemDetails(height, context,width),
          );
       
  }



  Widget getMobileItemDetails(double height, double width,BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width/20,vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(
                   AppImages.fortuneBg 
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Image.asset(AppImages.fortune),
                const SizedBox(height: 5,),
                Text(itemModel.cardTitle,style: AppStyles.styleBold24(context).copyWith(color: AppColors.white,fontSize: getResponsiveFontSizeText(context, fontSize: width<AppConstants.maxMobileWidth?24:28)),)
              ],)
            ],
          ),
          
          const SizedBox(height: 5,),
          Text(
            itemModel.detailsTitle,
            style: AppStyles.styleBold24(context)
                .copyWith(color: AppColors.black,fontSize:  getResponsiveFontSizeText(context, fontSize: width<AppConstants.maxMobileWidth? 24:28)),
          ),
          const SizedBox(height: 5,),
          Expanded(
            child: ListView(
              children: [
                Text(itemModel.details,
                    style: AppStyles.styleRegular20(context)
                        .copyWith(color: AppColors.black,fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 20:28))),
              ],
            ),
          ),
          
          Row(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: width*0.05,
                    height: width*0.05,
                    child: SvgPicture.asset(AppImages.hand)),
                  Text(
                    '${itemModel.likesNumber}',
                    style: AppStyles.styleBold24(context)
                        .copyWith(color: AppColors.black,fontSize: getResponsiveFontSizeText(context, fontSize: width<AppConstants.maxMobileWidth?24:28)),
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                     width: width*0.05,
                    height: width*0.05,
                    child: SvgPicture.asset(AppImages.eye)),
                  Text(
                    '${itemModel.seeNumber}k',
                    style: AppStyles.styleBold24(context)
                        .copyWith(color: AppColors.black,fontSize: getResponsiveFontSizeText(context, fontSize: width<AppConstants.maxMobileWidth?24:28)),
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:const EdgeInsets.all(20),
                decoration: BoxDecoration(color:Colors.grey[300],borderRadius: BorderRadius.circular(80)),
                child: SvgPicture.asset(AppImages.save,height:width<AppConstants.maxMobileWidth? 20:40,width:width<AppConstants.maxMobileWidth? 20:40)),
              const SizedBox(width: 10,),
              Container(
                padding:const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(80)),
                child: SvgPicture.asset(AppImages.share,height:width<AppConstants.maxMobileWidth? 20:40,width:width<AppConstants.maxMobileWidth? 20:40)),
            ],
          ),
        ],
      ),
    );
  }

   Widget getDesktopItemDetails(double height, BuildContext context,double width) {
    return Column(
      children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             SizedBox(
              width: width*0.4,
               child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                         AppImages.fortuneBg 
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      Image.asset(AppImages.fortune),
                      const SizedBox(height: 5,),
                      Text(itemModel.cardTitle,style: AppStyles.styleBold24(context).copyWith(color: AppColors.white,fontSize: getResponsiveFontSizeText(context, fontSize: width<AppConstants.maxMobileWidth?24:28)),)
                    ],)
                  ],
                ),
             ),
                     
                    SizedBox(width: width*0.05,),
                   SizedBox(
                     width: width*0.5,
                     height: height*0.8,
              child: Column(
                children: [
                  Text(
                    itemModel.detailsTitle,
                    style: AppStyles.styleBold24(context)
                        .copyWith(color: AppColors.black,fontSize: getResponsiveFontSizeText(context, fontSize: 32)),
                  ),
                  const SizedBox(height: 5,),
                  Expanded(
                    child: ListView(
                      children: [
                        Text(itemModel.details,
                            style: AppStyles.styleRegular20(context)
                                .copyWith(color: AppColors.black,fontSize: getResponsiveFontSizeText(context, fontSize: 28))),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(AppImages.hand,width: 40,height: 40,),
                            Text(
                              '${itemModel.likesNumber}',
                              style: AppStyles.styleBold24(context)
                                  .copyWith(color: AppColors.black,fontSize: getResponsiveFontSizeText(context, fontSize: 28)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(AppImages.eye,width: 40,height: 40,),
                            Text(
                              '${itemModel.seeNumber}k',
                              style: AppStyles.styleBold24(context)
                                  .copyWith(color: AppColors.black,fontSize: getResponsiveFontSizeText(context, fontSize: 28)),
                            )
                          ],
                        )
                      ],
                    ),
                ],
              ),
                     ),
           ],
         ),
        const Expanded(child:SizedBox() ),
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
    );
  }


}
