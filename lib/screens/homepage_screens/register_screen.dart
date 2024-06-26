import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_home_textbutton.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_homepage_button.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_register_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../utils/app_images.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  int _selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body:width<AppConstants.maxTabletWidth?  getMobileRegister(width, context, height):getDesktopRegister(width, context, height),
      ),
    );
  }

  Padding getMobileRegister(double width, BuildContext context, double height) {
    return Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.015),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width:width<AppConstants.maxMobileWidth? width * 0.28:width*0.35,
                      child: Image.asset(
                        AppImages.companyLogo,
                        fit: BoxFit.fill,
                      )),
                  Text(
                    'Register here',
                    style: AppStyles.styleRufinaBold32(context).copyWith(
                        fontSize: getResponsiveFontSizeText(context,
                            fontSize:width<AppConstants.maxMobileWidth? 40:60)),
                  ),
                ],
              ),
              SizedBox(height: height*0.0075,),
              Text(
                'Create Your Account On Divine Connection',
                textAlign: TextAlign.center,
                style: AppStyles.styleRufinaBold32(context).copyWith(
                    color: AppColors.darkPrimary,
                    fontSize:
                        getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 18:28)),
              ),
                             SizedBox(height: height*0.0075,),

              Row(
                children: [
                  Expanded(
                    child: CustomRegisterTextField(
                        controller: fnameController, label: "First name"),
                  ),
                   SizedBox(width: width*0.027,),
                  
                  Expanded(
                    child: CustomRegisterTextField(
                        controller: lnameController, label: "Last name"),
                  ),
                ],
              ),
                              SizedBox(height: height*0.0075,),

              CustomRegisterTextField(
                  controller: emailController, label: 'Email'),
                              SizedBox(height: height*0.0075,),

              CustomRegisterTextField(
                  controller: phoneController, label: 'Phone No.'),
                              SizedBox(height: height*0.0075,),

              CustomRegisterTextField(
                  controller: passwordController, label: 'Passowrd'),
                              SizedBox(height: height*0.0075,),

              CustomRegisterTextField(
                  controller: confirmPassController, label: 'Confirm Password'),
               SizedBox(
                height: height*0.05,
              ),
              CustomHomePageButton(
                onTap: () {},
                title: 'Register',
              ),
              CustomHomeTextButton(questionText: 'Already have an account?', buttonTitle: "Login", onPressed: (){
                Navigator.pop(context);
              }),
               Row(
                children: [
                  const Expanded(
                      child: Divider(
                    color: AppColors.black,
                  )),
                  Text(
                    'or signup with',
                    style: AppStyles.stylePoppinsRegular20(context).copyWith(
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 18:24)),
                  ),
                  const Expanded(
                      child: Divider(
                    color: AppColors.black,
                  ))
                ],
              ),
             
              Row(
                children: [
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        // launch a new page with url on web
                        launchUrlString('https://www.google.com');
                      },
                      icon: Image.asset(AppImages.google,fit: BoxFit.fill,width: width*0.08,)),
                  // SizedBox(
                  //   width: width*0.027,
                  // ),
                  IconButton(
                      onPressed: () {
                        launchUrlString("https://www.facebook.com");
                      },
                      icon: Image.asset(AppImages.facebook,fit: BoxFit.fill,width: width*0.08,)),
                  const Spacer()
                ],
              )
            ],
          ),
        ),
      );
  }

  Widget getDesktopRegister(double width, BuildContext context, double height) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
      children: [
        Stack(
      children: [
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(AppImages.background,fit: BoxFit.fill,),
          ),
        Padding(
          padding:  EdgeInsets.only(left:width*0.03,top: height*0.03),
          child: Column(
            children: [
              SizedBox(
                  width: width * 0.3,
                  child: Image.asset(
                    AppImages.companyLogo,
                    fit: BoxFit.fill,
                  )),
              //  SizedBox(
              //   height: height*0.09
              // ),
              Text(
                'Register here',
                style: AppStyles.styleRufinaBold32(context).copyWith(
                    fontSize:
                        getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 40:60)),
              ),
            ],
          ),
        ),
      ],
    ),
        SizedBox(
          width: width*0.5,
          child: Padding(
            padding:  EdgeInsets.only(right: width*0.03),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Create Your Account On Divine Connection',
                    textAlign: TextAlign.center,
                    style: AppStyles.styleRufinaBold32(context).copyWith(
                        color: AppColors.darkPrimary,
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 18:28)),
                  ),
                                 SizedBox(height: height*0.0075,),
                          
                  Row(
                    children: [
                      Expanded(
                        child: CustomRegisterTextField(
                            controller: fnameController, label: "First name"),
                      ),
                       SizedBox(width: width*0.027,),
                      
                      Expanded(
                        child: CustomRegisterTextField(
                            controller: lnameController, label: "Last name"),
                      ),
                    ],
                  ),
                                  SizedBox(height: height*0.015,),
                          
                  CustomRegisterTextField(
                      controller: emailController, label: 'Email'),
                                  SizedBox(height: height*0.015,),
                          
                  CustomRegisterTextField(
                      controller: phoneController, label: 'Phone No.'),
                                  SizedBox(height: height*0.015,),
                          
                  CustomRegisterTextField(
                      controller: passwordController, label: 'Passowrd'),
                                  SizedBox(height: height*0.015,),
                          
                  CustomRegisterTextField(
                      controller: confirmPassController, label: 'Confirm Password'),
                   SizedBox(
                    height: height*0.03,
                  ),
                  CustomHomePageButton(
                    onTap: () {},
                    title: 'Register',
                  ),
                  CustomHomeTextButton(questionText: 'Already have an account?', buttonTitle: "Login", onPressed: (){
                    Navigator.pop(context);
                  }),
                   Row(
                    children: [
                      const Expanded(
                          child: Divider(
                        color: AppColors.black,
                      )),
                      Text(
                        'or signup with',
                        style: AppStyles.stylePoppinsRegular20(context).copyWith(
                            fontSize:
                                getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 18:24)),
                      ),
                      const Expanded(
                          child: Divider(
                        color: AppColors.black,
                      ))
                    ],
                  ),
                             
                  Row(
                      children: [
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              // launch a new page with url on web
                              launchUrlString('https://www.google.com');
                            },
                            icon: Image.asset(AppImages.google,fit: BoxFit.fill,width: width*0.04,)),
                        
                        IconButton(
                            onPressed: () {
                              launchUrlString("https://www.facebook.com");
                            },
                            icon: Image.asset(AppImages.facebook,fit: BoxFit.fill,width: width*0.04,)),
                            const Spacer()
                    
                      ],
                    ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
