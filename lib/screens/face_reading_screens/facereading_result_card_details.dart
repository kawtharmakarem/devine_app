import 'package:divinecontrol/models/facereading_models/facereading_model.dart';
import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:divinecontrol/widgets/dream_meaning_widgets/history_button.dart';
import 'package:divinecontrol/widgets/face_reading_widgets/custom_scan_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_constants.dart';

class FaceReadingResultCardDetails extends StatelessWidget {
  const FaceReadingResultCardDetails({super.key, required this.resultModel});
final FaceReadingResultsModel resultModel;
  @override
  Widget build(BuildContext context) {
double width = MediaQuery.of(context).size.width;
    // return width < AppConstants.maxMobileWidth || width>AppConstants.maxTabletWidth? 
 return   SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: AppColors.lightPurple1,
          borderRadius: BorderRadius.circular(20)),
          child:width<AppConstants.maxMobileWidth? getMobileFaceReadingResults(context):getDesktopFaceReadingResults(context),
        ),
      ),
    );
     }

  Column getMobileFaceReadingResults(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Text(resultModel.title,style: AppStyles.styleBold24(context),),
          Image.asset(resultModel.image),
          
          const Divider(color: AppColors.black,
          thickness: 2,),
          Text('Descriptions',style: AppStyles.styleBold24(context),),
          Text(resultModel.subTitle),
          const SizedBox(height: 50,),
          CustomButton(onPressed: (){
            Navigator.pop(context);
          }, title: 'Ok')

        ],);
  }


   Column getDesktopFaceReadingResults(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: SvgPicture.asset(AppImages.leftArrow)),
              Text(resultModel.title,style: AppStyles.styleBold24(context).copyWith(fontSize: 50),),
              const SizedBox()
            ],
          ),
          Image.asset(resultModel.image),
          
          const Divider(color: AppColors.black,
          thickness: 2,),
          Text('Descriptions',style: AppStyles.styleBold24(context).copyWith(fontSize: 40),),
          Text(resultModel.subTitle,style: AppStyles.styleRegular26(context).copyWith(color: AppColors.black),),
          const SizedBox(height: 50,),
          

        ],);
  }
}