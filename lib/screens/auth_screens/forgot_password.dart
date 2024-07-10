import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:divinecontrol/widgets/auth_widgets/normal_textfield.dart';
import 'package:divinecontrol/widgets/auth_widgets/animation_homepage_widget.dart';
import 'package:divinecontrol/widgets/auth_widgets/custom_homepage_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';

class ForgotPasswordSceen extends StatefulWidget {
  const ForgotPasswordSceen({super.key});

  @override
  State<ForgotPasswordSceen> createState() => _ForgotPasswordSceenState();
}

class _ForgotPasswordSceenState extends State<ForgotPasswordSceen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: width < AppConstants.maxTabletWidth
          ? getMobileForgotPassword(width, height, context)
          : getDeskTopAnimationForgotPassword(width, height, context),
    );
  }

  Widget getMobileForgotPassword(
      double width, double height, BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 0.1,),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.3,
                      child: Image.asset(
                        AppImages.companyLogo,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(
                      'Reset Password',
                      style: AppStyles.styleRufinaBold32(context).copyWith(
                          fontSize: getResponsiveFontSizeText(context,
                              fontSize: width < AppConstants.maxMobileWidth
                                  ? 32
                                  : 60)),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
              SizedBox(
                width: width*0.9,
                child: Image.asset(AppImages.forgotpassword)),
              SizedBox(height: height*0.01,),
               
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width/20),
                  child: Text(
                    "Just enter the email address you've used to register with us and we'll send you a reset link !",textAlign: TextAlign.center,
                    style: AppStyles.stylePoppinsRegular20(context).copyWith(
                        fontSize: getResponsiveFontSizeText(context,
                            fontSize:
                                width < AppConstants.maxMobileWidth ? 20 : 28)),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                NormalTextField(
                    controller: emailController,
                    labelText: "Email",
                    prefixIcon: Icon(
                      Icons.email,
                      size: width < AppConstants.maxMobileWidth ? 30 : 50,
                    ),
                    hintText: "Email"),
                     SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: CustomHomePageButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        title: 'Submit',
                      ),
                    ),
                     SizedBox(width: width*0.1,),
                    Expanded(
                      child: CustomHomePageButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        title: 'Back',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0, height<670? 50:0),
          child: const MyAnimationWidget())
      ],
    );
  }

  Widget getDeskTopAnimationForgotPassword(
      double width, double height, BuildContext context) {
    return Stack(children: [
      Positioned(
        bottom: height * 0.15,
        left: 20,
        child: Text(
          'Reset Password',
          style: AppStyles.styleRufinaBold32(context).copyWith(
              fontSize: getResponsiveFontSizeText(context,
                  fontSize:60)),
        ),
      ),
      Positioned(
        top: 10,
        right: 10,
        child: SizedBox(
          width: width * 0.5,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  SizedBox(
            width: width*0.3,
            child: Image.asset(AppImages.forgotpassword)),
                Text(
                  "Just enter the email address you've used to register with us and we'll send you a reset link !",
                  style: AppStyles.styleRufinaBold32(context),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                NormalTextField(
                    controller: emailController,
                    labelText: "Email",
                    prefixIcon: const Icon(
                      Icons.email,
                      size: 40,
                    ),
                    hintText: "Enter Your Email"),
                SizedBox(
                  height: height * 0.03,
                ),
                  SizedBox(
                    width: width*0.3,
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: CustomHomePageButton(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: 'Submit',
                        ),
                      ),
                       SizedBox(width: width*0.02,),
                      Expanded(
                        child: CustomHomePageButton(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: 'Back',
                        ),
                      ),
                    ],
                                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      const MyAnimationWidget()
    ]);
  }
}
