import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/widgets/dream_meaning_widgets/custom_dream_submitbutton.dart';
import 'package:flutter/material.dart';

import '../../utils/app_styles.dart';
import '../settings_widgets/custom_settingstextfield.dart';

class CustomContactUsCard extends StatelessWidget {
  const CustomContactUsCard({super.key, this.image, required this.description, this.horizontalPadding, this.iconData});
  final String? image;
  final IconData? iconData;
  final String description;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    return Padding(
              padding:  EdgeInsets.symmetric(horizontal:horizontalPadding ?? 5, vertical: 10),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(20),
        
        child: Container(
      
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1,color: AppColors.darkPrimary)
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width:width<AppConstants.maxMobileWidth? 70:150,
                      child:image!=null? Image.asset(image!,fit: BoxFit.fill,):Icon(iconData,size:width<AppConstants.maxTabletWidth? 60:100,color: AppColors.darkPrimary,)),
                    Expanded(
                      child: Text(
                        description,textAlign: TextAlign.center,
                        style: AppStyles.styleRufinaBold32(context).copyWith(
                            fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 18:28)),
                      ),
                    ),
                  ],
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
                  maxLines: 4,
                ),
  SizedBox(
                  height:width<AppConstants.maxMobileWidth? 10:20,
                ),                CustomDreamSubmitButton(title: "Submit", onPressed: (){},iconData: Icons.send,),
                const SizedBox(height: 5,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

