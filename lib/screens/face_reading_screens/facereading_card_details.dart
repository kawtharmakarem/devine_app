import 'package:divinecontrol/models/facereading_models/facereading_card_model.dart';
import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FaceReadingCardDetails extends StatelessWidget {
  const FaceReadingCardDetails({super.key, required this.cardModel});
  final FaceReadingCardModel cardModel;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // return width < AppConstants.maxMobileWidth || width>AppConstants.maxTabletWidth?
    return  SafeArea(
        child: Scaffold(
      body: Container(
        padding:const EdgeInsets.all(30),
        decoration:const BoxDecoration(color: AppColors.lightPurple1),
        child:width<AppConstants.maxMobileWidth? getMobileDetails(context):getDesktopDetails(context,width),
      ),
    ));
  }

  Column getMobileDetails(BuildContext context) {
    return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(AppImages.leftArrow)),
              Text(
                cardModel.title,
                style: AppStyles.styleBold24(context),
              ),
              const SizedBox()
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Image.asset(cardModel.image),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              children: [
                Text(cardModel.description),
              ],
            ),
          )
        ],
      );
  }

  Column getDesktopDetails(BuildContext context,double width) {
    return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(AppImages.leftArrow)),
              Text(
                cardModel.title,
                style: AppStyles.styleBold24(context).copyWith(fontSize: 50),
              ),
              const SizedBox()
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: width*0.7,
            child: Image.asset(cardModel.image,fit: BoxFit.cover,)),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              // shrinkWrap: true,
              children: [
                Text(cardModel.description,style:AppStyles.styleBold24(context).copyWith(fontSize: 32)),
              ],
            ),
          )
        ],
      );
  }
}
