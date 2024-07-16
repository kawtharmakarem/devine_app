import 'package:divinecontrol/models/tarotreading_models/tarot_result_card_model.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';
import '../homepage_widgets/custom_appbar.dart';

class ItemResultDetails extends StatelessWidget {
  const ItemResultDetails({
    super.key,
    required this.results,
    required this.index,
  });
  final List<TarotResultCardModel> results;
  final int index;
  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context)?.settings.arguments as String;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.lightPurple1,
        appBar: CustomAppBar(title: title, leading: true),
        body: width < AppConstants.maxTabletWidth
            ? getMobileItemResultDetails(height, width, context)
            : getDesktopItemResultDetails(height, context, width),
      ),
    );
  }

  Widget getMobileItemResultDetails(
      double height, double width, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
                width: width,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.asset(AppImages.fortuneBg)),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    width: width * 0.2,
                    //height: 70,
                    child: Image.asset(results[index].resultImage)),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  results[index].title,
                  style: AppStyles.styleBold24(context).copyWith(
                      color: AppColors.white,
                      fontSize: getResponsiveFontSizeText(context,
                          fontSize:
                              width < AppConstants.maxMobileWidth ? 22 : 30)),
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 5),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '•',
                    style: AppStyles.styleBold24(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: width<AppConstants.maxMobileWidth?24:32)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: width * 0.9,
                    child: Text(
                      "${results[index].heading1}",
                      style: AppStyles.styleBold24(context).copyWith(
                          color: AppColors.black,
                          fontSize: getResponsiveFontSizeText(context,
                              fontSize: width < AppConstants.maxMobileWidth
                                  ? 20
                                  : 28)),
                    ),
                  ),
                ],
              ),
              Text(results[index].para1,
                  style: AppStyles.styleRegular20(context).copyWith(
                      color: AppColors.black,
                      fontSize: getResponsiveFontSizeText(context,
                          fontSize:
                              width < AppConstants.maxMobileWidth ? 18 : 24))),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '•',
                    style: AppStyles.styleBold24(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: width<AppConstants.maxMobileWidth?24:32)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: width * 0.9,
                    child: Text(
                      "${results[index].heading2}",
                      style: AppStyles.styleBold24(context).copyWith(
                          color: AppColors.black,
                          fontSize: getResponsiveFontSizeText(context,
                              fontSize: width < AppConstants.maxMobileWidth
                                  ? 20
                                  : 28)),
                    ),
                  ),
                ],
              ),
              Text(results[index].para2,
                  style: AppStyles.styleRegular20(context).copyWith(
                      color: AppColors.black,
                      fontSize: getResponsiveFontSizeText(context,
                          fontSize:
                              width < AppConstants.maxMobileWidth ? 18 : 24))),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '•',
                    style: AppStyles.styleBold24(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: width<AppConstants.maxMobileWidth?24:32)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: width * 0.9,
                    child: Text(
                      "${results[index].heading3}",
                      style: AppStyles.styleBold24(context).copyWith(
                          color: AppColors.black,
                          fontSize: getResponsiveFontSizeText(context,
                              fontSize: width < AppConstants.maxMobileWidth
                                  ? 20
                                  : 28)),
                    ),
                  ),
                ],
              ),
              Text(results[index].para3,
                  style: AppStyles.styleRegular20(context).copyWith(
                      color: AppColors.black,
                      fontSize: getResponsiveFontSizeText(context,
                          fontSize:
                              width < AppConstants.maxMobileWidth ? 18 : 24))),
            ],
          ),
        ),
      ],
    );
  }

  Widget getDesktopItemResultDetails(
      double height, BuildContext context, double width) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: width * 0.4,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                     // width: width*0.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(AppImages.fortuneBg)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: width*0.08,
                        child: Image.asset(results[index].resultImage,fit: BoxFit.fill,)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        results[index].title,
                        style: AppStyles.styleBold24(context).copyWith(
                            color: AppColors.white,
                            fontSize: getResponsiveFontSizeText(context,
                                fontSize: 32)),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: width * 0.05,
            ),
            SizedBox(
              width: width * 0.5,
              height: height * 0.8,
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('•',style:AppStyles.styleBold24(context).copyWith(
                              color: AppColors.black,
                              fontSize:
                                  getResponsiveFontSizeText(context, fontSize: 32)),),
                                  const SizedBox(width: 10,),
                        Container(
                          width: width*0.4,
                          child: Text(
                            "${results[index].heading1}",
                            style: AppStyles.styleBold24(context).copyWith(
                                color: AppColors.black,
                                fontSize:
                                    getResponsiveFontSizeText(context, fontSize: 32)),
                          ),
                        ),
                      ],
                    ),
                    Text(results[index].para1,
                        style: AppStyles.styleRegular20(context).copyWith(
                            color: AppColors.black,
                            fontSize: getResponsiveFontSizeText(context,
                                fontSize: 28))),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('•',style:AppStyles.styleBold24(context).copyWith(
                              color: AppColors.black,
                              fontSize:
                                  getResponsiveFontSizeText(context, fontSize: 32)),),
                                                                    const SizedBox(width: 10,),

                        Container(
                          width: width*0.4,
                          child: Text(
                            "${results[index].heading2}",
                            style: AppStyles.styleBold24(context).copyWith(
                                color: AppColors.black,
                                fontSize:
                                    getResponsiveFontSizeText(context, fontSize: 32)),
                          ),
                        ),
                      ],
                    ),
                    Text(results[index].para2,
                        style: AppStyles.styleRegular20(context).copyWith(
                            color: AppColors.black,
                            fontSize: getResponsiveFontSizeText(context,
                                fontSize: 28))),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('•',style:AppStyles.styleBold24(context).copyWith(
                              color: AppColors.black,
                              fontSize:
                                  getResponsiveFontSizeText(context, fontSize: 32)),),
                                                                    const SizedBox(width: 10,),

                        Container(
                          width: width*0.4,
                          child: Text(
                            "${results[index].heading3}",
                            style: AppStyles.styleBold24(context).copyWith(
                                color: AppColors.black,
                                fontSize:
                                    getResponsiveFontSizeText(context, fontSize: 32)),
                          ),
                        ),
                      ],
                    ),
                    Text(results[index].para3,
                        style: AppStyles.styleRegular20(context).copyWith(
                            color: AppColors.black,
                            fontSize: getResponsiveFontSizeText(context,
                                fontSize: 28))),
                   
                  ],
                ),
              ),
            ),
          ],
        ),
        //const Expanded(child: SizedBox()),
      ],
    );
  }
}
