import 'package:divinecontrol/screens/homepage_screens/register_screen.dart';
import 'package:divinecontrol/screens/homepage_screens/main_view_screen.dart';
import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../widgets/homepage_widgets/custom_home_textbutton.dart';
import '../../widgets/homepage_widgets/custom_home_textfield.dart';
import '../../widgets/homepage_widgets/custom_homepage_button.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body:width<AppConstants.maxTabletWidth? getMobileLogin(width, height, context):getDesktopLogin(width, height, context),
      ),
    );
  }

  Padding getMobileLogin(double width, double height, BuildContext context) {
    return Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.015),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  width: width * 0.4,
                  child: Image.asset(
                    AppImages.companyLogo,
                    fit: BoxFit.fill,
                  )),
               SizedBox(
                height: height*0.015,
              ),
              Text(
                'Welcome Back!!',
                style: AppStyles.styleRufinaBold32(context).copyWith(
                    fontSize:
                        getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 40:60)),
              ),
              Text(
                'Please Login On Divine Connection',
                style: AppStyles.stylePoppinsRegular20(context).copyWith(
                    fontSize:
                        getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 18:28)),
              ),
               SizedBox(
                height: height*0.015,
              ),

              CustomHomeTextFiled(
                emailController: emailController,
                label: 'Email',
              ),
               SizedBox(
                height: height*0.015,
              ),
              CustomHomeTextFiled(
                obscureText: true,
                  emailController: passwordController, label: 'Password'),
               SizedBox(
                height: height*0.0075,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot password?',
                  style: AppStyles.stylePoppinsRegular20(context).copyWith(
                      fontSize:
                          getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 18:24)),
                ),
              ),
               SizedBox(
                height: height*0.023,
              ),

              CustomHomePageButton(onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const MainViewScreen()));
              },title: 'Login',),
             SizedBox(
                height: height*0.0075,
              ),
              CustomHomeTextButton(
                  questionText: "Don't have an account?",
                  buttonTitle: 'Register',
                  onPressed: () {
                    
                       Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RegisterScreen()));
                  
                   
                  }),
               SizedBox(
                height: height*0.0075,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                      child: Divider(
                    color: AppColors.black,
                  )),
                  Text(
                    ' or login with ',
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
               SizedBox(
                height: height*0.0075,
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
                  //   width: width*0.0075,
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


   Widget getDesktopLogin(double width, double height, BuildContext context) {
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
                    'Welcome Back!!',
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Please Login On Divine Connection',
                    style: AppStyles.stylePoppinsRegular20(context).copyWith(
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize: 30)),
                  ),
                   SizedBox(
                    height: height*0.05,
                  ),
                  
                  CustomHomeTextFiled(
                    emailController: emailController,
                    label: 'Email',
                  ),
                   SizedBox(
                    height: height*0.03,
                  ),
                  CustomHomeTextFiled(
                    obscureText: true,
                      emailController: passwordController, label: 'Password'),
                   SizedBox(
                    height: height*0.015,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot password?',
                      style: AppStyles.stylePoppinsRegular20(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize:28)),
                    ),
                  ),
                   SizedBox(
                    height: height*0.05,
                  ),
                  
                  CustomHomePageButton(onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const MainViewScreen()));
                  },title: 'Login',),
                               SizedBox(
                    height: height*0.015,
                  ),
                  CustomHomeTextButton(
                      questionText: "Don't have an account?",
                      buttonTitle: 'Register',
                      onPressed: () {
                        
                           Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RegisterScreen()));
                      
                       
                      }),
                   SizedBox(
                    height: height*0.05,
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                          child: Divider(
                        color: AppColors.black,
                      )),
                      Text(
                        ' or login with ',
                        style: AppStyles.stylePoppinsRegular20(context).copyWith(
                            fontSize:
                                getResponsiveFontSizeText(context, fontSize:28)),
                      ),
                      const Expanded(
                          child: Divider(
                        color: AppColors.black,
                      ))
                    ],
                  ),
                   SizedBox(
                    height: height*0.015,
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

