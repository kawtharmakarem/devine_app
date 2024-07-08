import 'package:divinecontrol/widgets/kundli_widgets/custom_kundle_textfield.dart';
import 'package:divinecontrol/widgets/kundli_widgets/custom_score_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class MatchMarktingDetailsScreen extends StatefulWidget {
  const MatchMarktingDetailsScreen({super.key});

  @override
  State<MatchMarktingDetailsScreen> createState() =>
      _MatchMarktingDetailsScreenState();
}

class _MatchMarktingDetailsScreenState
    extends State<MatchMarktingDetailsScreen> {
  TextEditingController numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
      appBar: AppBar(
        title: Text(
          "Match Making",
          style: width < AppConstants.maxMobileWidth
              ? AppStyles.styleBold24(context)
                  .copyWith(color: AppColors.darkPrimary)
              : AppStyles.styleBold24(context).copyWith(
                  color: AppColors.darkPrimary,
                  fontSize: getResponsiveFontSizeText(context, fontSize: 32)),
        ),
        backgroundColor: AppColors.lightPurple1,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppImages.leftArrow),
        ),
      ),
      body:width<AppConstants.maxTabletWidth? getMobileScore(width, context):getDesktopScore(width, context),
    );
  }

  Padding getMobileScore(double width, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              color: AppColors.black.withOpacity(0.7),
              thickness: 2,
            ),
            Text(
              "Compatibility Score",
              style: width < AppConstants.maxMobileWidth
                  ? AppStyles.styleBold24(context)
                  : AppStyles.styleBold24(context).copyWith(
                      fontSize:
                          getResponsiveFontSizeText(context, fontSize: 32)),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomScore(
                pointer:
                    double.tryParse(numberController.text.toString()) ?? 0),
            Text(
              "Try Changing The Number Here:",
              style: width < AppConstants.maxMobileWidth
                  ? AppStyles.styleBold24(context)
                  : AppStyles.styleBold24(context).copyWith(
                      fontSize:
                          getResponsiveFontSizeText(context, fontSize: 32)),
            ),
            SizedBox(
                width: width * 0.2,
                child: CustomKundleTextField(
                  hintText: "",
                  
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value) {
                    setState(() {
                      numberController.text = value;
                    });
                  },
                  controller: numberController,
                )),
            Divider(
              indent: 20,
              endIndent: 20,
              color: AppColors.black.withOpacity(0.7),
              thickness: 2,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Details',
              style: width < AppConstants.maxMobileWidth
                  ? AppStyles.styleBold24(context).copyWith(
                      fontSize:
                          getResponsiveFontSizeText(context, fontSize: 32))
                  : AppStyles.styleBold24(context).copyWith(
                      fontSize:
                          getResponsiveFontSizeText(context, fontSize: 40)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Not A Good Match",
              style: AppStyles.styleRegular20(context).copyWith(
                  color: AppColors.darkPrimary,
                  fontSize: getResponsiveFontSizeText(context,
                      fontSize:
                          width < AppConstants.maxMobileWidth ? 22 : 30)),
            )
          ],
        ),
      ),
    );
  }

  Padding getDesktopScore(double width, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              color: AppColors.black.withOpacity(0.7),
              thickness: 2,
            ),
            const SizedBox(height: 20,),
            Text(
              "Compatibility Score",
              style:AppStyles.styleBold24(context).copyWith(
                      fontSize:
                          getResponsiveFontSizeText(context, fontSize: 40)),
            ),
            const SizedBox(
              height: 50,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Column(
                 children: [
                   Text(
                                 "Try Changing The Number Here:",
                                 style:  AppStyles.styleBold24(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 32)),
                               ),
                               const SizedBox(height: 20,),
                               SizedBox(
                    width: width * 0.2,
                    child: CustomKundleTextField(
                      hintText: "",
                      
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (value) {
                        setState(() {
                          numberController.text = value;
                        });
                      },
                      controller: numberController,
                    )),
                    const SizedBox(height:30 ,),
                    SizedBox(
                      height: 5,
                      width: width*0.3,
                      child: Divider(
                                    indent: 20,
                                    endIndent: 20,
                                    color: AppColors.black.withOpacity(0.7),
                                    thickness: 2,
                                  ),
                    ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Details',
              style: AppStyles.styleBold24(context).copyWith(
                      fontSize:
                          getResponsiveFontSizeText(context, fontSize: 40)),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Not A Good Match",
              style: AppStyles.styleRegular20(context).copyWith(
                  color: AppColors.darkPrimary,
                  fontSize: getResponsiveFontSizeText(context,
                      fontSize:
                          30)),
            )
                 ],
               ),
                 CustomScore(
                pointer:
                    double.tryParse(numberController.text.toString()) ?? 0),

            ],
            
            ),
          
           
            
          ],
        ),
      ),
    );
  }
}
