import 'dart:async';
import 'dart:math';

import 'package:divinecontrol/screens/auth_screens/glass_register.dart';
import 'package:divinecontrol/screens/homepage_screens/main_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';
import '../../widgets/auth_widgets/custom_home_textbutton.dart';
import '../../widgets/auth_widgets/normal_textfield.dart';
import '../../widgets/auth_widgets/password_textfield.dart';
import '../../widgets/auth_widgets/custom_homepage_button.dart';
import '../../widgets/auth_widgets/animation_homepage_widget.dart';

class GlassLogin extends StatefulWidget {
  const GlassLogin({super.key});

  @override
  State<GlassLogin> createState() => _GlassLoginState();
}

class _GlassLoginState extends State<GlassLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  double val = 0;
  bool switchScreen = true;
  Timer timer = Timer(Duration(seconds: 1), () {});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return width < AppConstants.maxTabletWidth
        ? getMobileWaveLogin(width, height, context)
        : getDesktopAnimationLogin(width, height, context);
  }

  TweenAnimationBuilder<double> getMobileLogin(
      double width, double height, BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: val),
      duration: const Duration(seconds: 1),
      builder: (_, value, child) {
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(value),
          alignment: Alignment.bottomCenter,
          child: child,
        );
      },
      child: switchScreen
          ? Stack(
              children: [
                Positioned.fill(
                    child: Container(
                  decoration:
                      const BoxDecoration(color: AppColors.lightPurple1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 200,
                      ),
                      Transform.scale(
                          scale: 1.5, child: Image.asset(AppImages.logoonly)),
                    ],
                  ),
                )),
                ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  children: [
                    GlassmorphicContainer(
                      width: width,
                      height: height * 0.8,
                      borderRadius: 20,
                      alignment: Alignment.bottomCenter,
                      linearGradient: LinearGradient(colors: [
                        // Color(0xffffffff).withOpacity(0.1),
                        // Color(0xffffffff).withOpacity(0.05)
                        AppColors.darkPrimary.withOpacity(0.1),
                        AppColors.darkPrimary.withOpacity(0.05),
                      ], stops: [
                        0.1,
                        1
                      ], begin: Alignment.topLeft, end: Alignment.centerRight),
                      border: 2,
                      blur: 3,
                      borderGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColors.darkPrimary.withOpacity(0.5),
                            AppColors.darkPrimary.withOpacity(0.5),

                            //Color(0xffffffff).withOpacity(0.5),
                            // Color(0xffffffff).withOpacity(0.5)
                          ]),
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Text(
                            'Welcome Back!!',
                            style: AppStyles.styleRufinaBold32(context)
                                .copyWith(
                                    fontSize: getResponsiveFontSizeText(context,
                                        fontSize:
                                            width < AppConstants.maxMobileWidth
                                                ? 40
                                                : 60)),
                          ),
                          Text(
                            'Please Login On Divine Connection',
                            style: AppStyles.stylePoppinsRegular20(context)
                                .copyWith(
                                    fontSize: getResponsiveFontSizeText(context,
                                        fontSize:
                                            width < AppConstants.maxMobileWidth
                                                ? 18
                                                : 28)),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          const NormalTextField(
                              labelText: 'Email',
                              prefixIcon: Icon(
                                Icons.account_circle,
                                color: AppColors.darkPrimary,
                              ),
                              hintText: 'Enter Your Email'),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          const PasswordTextField(
                              labelText: 'Password',
                              hintText: 'Enter Your Password'),
                          SizedBox(
                            height: height * 0.0075,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Forgot password?',
                              style: AppStyles.stylePoppinsRegular20(context)
                                  .copyWith(
                                      fontSize: getResponsiveFontSizeText(
                                          context,
                                          fontSize: width <
                                                  AppConstants.maxMobileWidth
                                              ? 18
                                              : 24)),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.04,
                          ),

                          CustomHomePageButton(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MainViewScreen()));
                            },
                            title: 'Login',
                          ),
                          SizedBox(
                            height: height * 0.0075,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Text('Don\'t have an account',
                          //     style: TextStyle(color: Colors.white),),
                          //     TextButton(onPressed: (){
                          //       setState(() {
                          //         val=pi;
                          //         timer=Timer(Duration(milliseconds: 500), () {
                          //           setState(() {
                          //             switchScreen=false;
                          //           });
                          //         });
                          //       });
                          //     }, child: Text('Register Now',style: TextStyle(color: Colors.red),))
                          //   ],
                          // )
                          CustomHomeTextButton(
                              questionText: "Don't have an account?",
                              buttonTitle: 'Register',
                              onPressed: () {
                                // Get.to(()=>GlassRegister(),transition: Transition.zoom,duration: Duration(seconds: 3));
                                setState(() {
                                  val = pi;
                                  timer =
                                      Timer(Duration(milliseconds: 500), () {
                                    setState(() {
                                      switchScreen = false;
                                    });
                                  });
                                });
                                // setState(() {
                                //   showLoginPage=true;
                                // });
                              }),
                          SizedBox(
                            height: height * 0.0075,
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
                                style: AppStyles.stylePoppinsRegular20(context)
                                    .copyWith(
                                        fontSize: getResponsiveFontSizeText(
                                            context,
                                            fontSize: width <
                                                    AppConstants.maxMobileWidth
                                                ? 18
                                                : 24)),
                              ),
                              const Expanded(
                                  child: Divider(
                                color: AppColors.black,
                              ))
                            ],
                          ),
                          SizedBox(
                            height: height * 0.0075,
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              IconButton(
                                  onPressed: () {
                                    // launch a new page with url on web
                                    // launchUrlString('https://www.google.com');
                                  },
                                  icon: Image.asset(
                                    AppImages.google,
                                    fit: BoxFit.fill,
                                    width: width * 0.08,
                                  )),
                              // SizedBox(
                              //   width: width*0.0075,
                              // ),
                              IconButton(
                                  onPressed: () {
                                    // launchUrlString("https://www.facebook.com");
                                  },
                                  icon: Image.asset(
                                    AppImages.facebook,
                                    fit: BoxFit.fill,
                                    width: width * 0.08,
                                  )),
                              const Spacer()
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          : GlassRegister(),
    );
  }

  TweenAnimationBuilder<double> getMobileWaveLogin(
      double width, double height, BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: val),
      duration: const Duration(seconds: 1),
      builder: (_, value, child) {
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(value),
          alignment: Alignment.bottomCenter,
          child: child,
        );
      },
      child: switchScreen
          ? Stack(
              children: [
                Positioned.fill(
                    child: Container(
                  decoration:
                      const BoxDecoration(color: AppColors.lightPurple1),
                )),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Text(
                        'Welcome Back!!',
                        style: AppStyles.styleRufinaBold32(context).copyWith(
                            fontSize: getResponsiveFontSizeText(context,
                                fontSize: width < AppConstants.maxMobileWidth
                                    ? 40
                                    : 60)),
                      ),
                      Text(
                        'Please Login On Divine Connection',
                        style: AppStyles.stylePoppinsRegular20(context)
                            .copyWith(
                                fontSize: getResponsiveFontSizeText(context,
                                    fontSize:
                                        width < AppConstants.maxMobileWidth
                                            ? 18
                                            : 28)),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                       NormalTextField(
                          labelText: 'Email',
                          controller: emailController,
                          prefixIcon: Icon(
                            Icons.account_circle,
                            size: width<AppConstants.maxMobileWidth?30:50,
                          ),
                          hintText: 'Enter Your Email'),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      PasswordTextField(
                        controller: passwordController,
                          labelText: 'Password',
                          hintText: 'Enter Your Password'),
                      SizedBox(
                        height: height * 0.0075,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot password?',
                          style: AppStyles.stylePoppinsRegular20(context)
                              .copyWith(
                                  fontSize: getResponsiveFontSizeText(context,
                                      fontSize:
                                          width < AppConstants.maxMobileWidth
                                              ? 18
                                              : 24)),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      CustomHomePageButton(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MainViewScreen()));
                        },
                        title: 'Login',
                      ),
                      SizedBox(
                        height: height * 0.0075,
                      ),
                      CustomHomeTextButton(
                          questionText: "Don't have an account?",
                          buttonTitle: 'Register',
                          onPressed: () {
                            setState(() {
                              val = pi;
                              timer =
                                  Timer(const Duration(milliseconds: 500), () {
                                setState(() {
                                  switchScreen = false;
                                });
                              });
                            });
                          }),
                      SizedBox(
                        height: height * 0.0075,
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
                            style: AppStyles.stylePoppinsRegular20(context)
                                .copyWith(
                                    fontSize: getResponsiveFontSizeText(context,
                                        fontSize:
                                            width < AppConstants.maxMobileWidth
                                                ? 18
                                                : 24)),
                          ),
                          const Expanded(
                              child: Divider(
                            color: AppColors.black,
                          ))
                        ],
                      ),
                      SizedBox(
                        height: height * 0.0075,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                // launch a new page with url on web
                                // launchUrlString('https://www.google.com');
                              },
                              icon: Image.asset(
                                AppImages.google,
                                fit: BoxFit.fill,
                                width: width * 0.08,
                              )),
                          // SizedBox(
                          //   width: width*0.0075,
                          // ),
                          IconButton(
                              onPressed: () {
                                // launchUrlString("https://www.facebook.com");
                              },
                              icon: Image.asset(
                                AppImages.facebook,
                                fit: BoxFit.fill,
                                width: width * 0.08,
                              )),
                          const Spacer()
                        ],
                      )
                    ],
                  ),
                ),
               const MyAnimationWidget()
              ],
            )
          :const GlassRegister(),
    );
  }

  Widget getDesktopAnimationLogin(
      double width, double height, BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: height * 0.15,
          left: 20,
          child: Text(
            'Welcome Back!!',
            style: AppStyles.styleRufinaBold32(context).copyWith(
                fontSize: getResponsiveFontSizeText(context,
                    fontSize: width < AppConstants.maxMobileWidth ? 40 : 60)),
          ),
        ),
        Positioned(
            top: 10,
            right: 10,
            child: SizedBox(
              width: width * 0.5,
              child: Padding(
                padding: EdgeInsets.only(right: width * 0.03),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Please Login On Divine Connection',
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
                     
                      PasswordTextField(
                          controller: passwordController,
                          labelText: "Password",
                          hintText: "Enter Your Password"),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot password?',
                          style: AppStyles.stylePoppinsRegular20(context)
                              .copyWith(
                                  fontSize: getResponsiveFontSizeText(context,
                                      fontSize: 28)),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),

                      CustomHomePageButton(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MainViewScreen()));
                        },
                        title: 'Login',
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      CustomHomeTextButton(
                          questionText: "Don't have an account?",
                          buttonTitle: 'Register',
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const GlassRegister()));
                          }),
                      SizedBox(
                        height: height * 0.05,
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
                            style: AppStyles.stylePoppinsRegular20(context)
                                .copyWith(
                                    fontSize: getResponsiveFontSizeText(context,
                                        fontSize: 28)),
                          ),
                          const Expanded(
                              child: Divider(
                            color: AppColors.black,
                          ))
                        ],
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                // launch a new page with url on web
                                // launchUrlString('https://www.google.com');
                              },
                              icon: Image.asset(
                                AppImages.google,
                                fit: BoxFit.fill,
                                width: width * 0.04,
                              )),
                          IconButton(
                              onPressed: () {
                                //launchUrlString("https://www.facebook.com");
                              },
                              icon: Image.asset(
                                AppImages.facebook,
                                fit: BoxFit.fill,
                                width: width * 0.04,
                              )),
                          const Spacer()
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )),
        const MyAnimationWidget(),
      ],
    );
  }
}
