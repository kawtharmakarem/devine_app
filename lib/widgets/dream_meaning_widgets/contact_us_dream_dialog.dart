import 'package:divinecontrol/utils/app_images.dart';
import 'package:divinecontrol/widgets/dream_meaning_widgets/custom_dream_submitbutton.dart';
import 'package:flutter/material.dart';

import '../../utils/app_styles.dart';
import '../settings_widgets/custom_settingstextfield.dart';

class ContactUsDreamDialog extends StatelessWidget {
  const ContactUsDreamDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Material(
        
        elevation: 4,
        borderRadius: BorderRadius.circular(20),
        child: Container(
      
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 70,
                      child: Image.asset(AppImages.head,fit: BoxFit.fill,)),
                    Text(
                      'Do you have Sleep Disorder ?\nBook personalised call Now!!',textAlign: TextAlign.center,
                      style: AppStyles.styleRufinaBold32(context).copyWith(
                          fontSize: getResponsiveFontSizeText(context, fontSize: 18)),
                    ),
                  ],
                ),
               
                const SizedBox(
                  height: 20,
                ),
                CustomSettingsTextField(
                    labelText: "Full Name *", hintText: "Enter Your Name"),
                const SizedBox(
                  height: 20,
                ),
                CustomSettingsTextField(
                    labelText: "Email *", hintText: "Enter Your Email"),
                const SizedBox(
                  height: 20,
                ),
                CustomSettingsTextField(
                  labelText: "Message",
                  hintText: "Write Your Message",
                  maxLines: 4,
                ),
                const SizedBox(height: 10,),
                CustomDreamSubmitButton(title: "Submit", onPressed: (){},iconData: Icons.send,),
                const SizedBox(height: 5,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

