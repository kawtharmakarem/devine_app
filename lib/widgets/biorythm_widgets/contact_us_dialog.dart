import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';
import '../settings_widgets/custom_settingstextfield.dart';
import 'custom_biorythm_button.dart';

class ContactUsDialog extends StatelessWidget {
  const ContactUsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(alignment: Alignment.topRight,child: IconButton(onPressed: (){
              Get.back();
            },icon: Icon(Icons.close,size:width<AppConstants.maxMobileWidth? 30:60,color: AppColors.darkPrimary,),),),
            SizedBox(
              width:width<AppConstants.maxMobileWidth? 75:150,
              child: Image.asset(AppImages.biorythmlogo,fit: BoxFit.fill,)),
            Text(
              'Want to maximize productivity ?\nBook personalised call Now!!',textAlign: TextAlign.center,
              style: AppStyles.styleRufinaBold32(context).copyWith(
                  fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 18:28)),
            ),
           
             SizedBox(
              height:width<AppConstants.maxMobileWidth? 20:40,
            ),
            CustomSettingsTextField(
                labelText: "Full Name *", hintText: "Enter Your Name"),
            SizedBox(
              height:width<AppConstants.maxMobileWidth? 20:40,
            ),
            CustomSettingsTextField(
                labelText: "Email *", hintText: "Enter Your Email"),
            SizedBox(
              height:width<AppConstants.maxMobileWidth? 20:40,
            ),
            CustomSettingsTextField(
              labelText: "Message",
              hintText: "Write Your Message",
              maxLines:width<AppConstants.maxTabletWidth? 4:3,
            ),
            const SizedBox(height: 20,),
            CustomSubmitBiorythmButton(title: "Submit",onPressed: (){},iconData:Icons.send,)
          ],
        ),
      ),
    );
  }
}

