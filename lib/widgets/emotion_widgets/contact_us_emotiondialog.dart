import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/widgets/dream_meaning_widgets/custom_dream_submitbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_styles.dart';
import '../settings_widgets/custom_settingstextfield.dart';

class CustomEmotionContactUsDialog extends StatelessWidget {
  const CustomEmotionContactUsDialog({super.key, required this.description, required this.image});
final String description;
final String image;
  
 
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    return Container(
      decoration: ShapeDecoration(shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      )),
      child:
       SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(alignment: Alignment.topRight,child: IconButton(onPressed: (){
              Get.back();
            },icon: Icon(Icons.close,size:width<AppConstants.maxMobileWidth? 30:60,color: AppColors.darkPrimary,),),),
            SizedBox(
              width:width<AppConstants.maxMobileWidth? 75:150,
              child: Image.asset(image,fit: BoxFit.fill,)),
            Text(
              "${description}\nBook personalised call Now!!",textAlign: TextAlign.center,
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
            CustomDreamSubmitButton(title: "Submit", onPressed: (){},iconData: Icons.send,)
          ],
        ),
      ),
    );
  }
}

