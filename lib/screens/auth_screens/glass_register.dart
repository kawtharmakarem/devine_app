import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
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
import 'glass_login.dart';

class GlassRegister extends StatefulWidget {
  const GlassRegister({super.key});

  @override
  State<GlassRegister> createState() => _GlassRegisterState();
}

class _GlassRegisterState extends State<GlassRegister> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  Timer registerTimer = Timer(const Duration(seconds: 1), () {});
  bool switchScreen = true;
  double val = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return width < AppConstants.maxTabletWidth
        ? getMobileRegisterWaveContent(width, height, context)
        : getDesktopAnimatioRegister(width, context, height);
  }

  TweenAnimationBuilder<double> getMobileRegisterContent(
      double width, double height, BuildContext context) {
    return TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: val),
        duration: const Duration(seconds: 1),
        onEnd: () => setState(() {
              print('OnEndRegiste');
            }),
        builder: (context, value, child) {
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(value),
            alignment: Alignment.bottomCenter,
            child: child,
          );
        },
        child: switchScreen
            ? Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(pi),
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: [
                    Positioned.fill(
                        child: Container(
                      decoration: BoxDecoration(color: AppColors.lightPurple1),
                      child: Transform.scale(
                          scale: 1.5, child: Image.asset(AppImages.logoonly)),
                    )),
                    ListView(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      children: [
                        GlassmorphicContainer(
                          width: width,
                          height: height * 0.8,
                          borderRadius: 20,
                          alignment: Alignment.bottomCenter,
                          linearGradient: LinearGradient(
                              colors: [
                                // Color(0xffffffff).withOpacity(0.1),
                                // Color(0xffffffff).withOpacity(0.05)
                                AppColors.darkPrimary.withOpacity(0.1),
                                AppColors.darkPrimary.withOpacity(0.05),
                              ],
                              stops: [
                                0.1,
                                1
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.centerRight),
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
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  'Register here',
                                  style: AppStyles.styleRufinaBold32(context)
                                      .copyWith(
                                          fontSize: getResponsiveFontSizeText(
                                              context,
                                              fontSize: width <
                                                      AppConstants
                                                          .maxMobileWidth
                                                  ? 40
                                                  : 60)),
                                ),
                                SizedBox(
                                  height: height * 0.0075,
                                ),
                                Text(
                                  'Create Your Account On Divine Connection',
                                  textAlign: TextAlign.center,
                                  style: AppStyles.styleRufinaBold32(context)
                                      .copyWith(
                                          color: AppColors.darkPrimary,
                                          fontSize: getResponsiveFontSizeText(
                                              context,
                                              fontSize: width <
                                                      AppConstants
                                                          .maxMobileWidth
                                                  ? 18
                                                  : 28)),
                                ),
                                SizedBox(
                                  height: height * 0.0075,
                                ),

                                const NormalTextField(
                                    labelText: "First Name",
                                    prefixIcon: Icon(
                                      Icons.account_circle,
                                      color: AppColors.darkPrimary,
                                    ),
                                    hintText: "Enter Your First Name"),
                                SizedBox(
                                  height: height * 0.0075,
                                ),
                                const NormalTextField(
                                    labelText: "Last Name",
                                    prefixIcon: Icon(
                                      Icons.account_circle,
                                      color: AppColors.darkPrimary,
                                    ),
                                    hintText: "Enter Your Last Name"),
                                SizedBox(
                                  height: height * 0.0075,
                                ),

                                const NormalTextField(
                                    labelText: 'Email',
                                    prefixIcon: Icon(
                                      Icons.email,
                                    ),
                                    hintText: 'Enter Your Email'),
                                SizedBox(
                                  height: height * 0.0075,
                                ),
                                const NormalTextField(
                                    labelText: 'Phone No.',
                                    prefixIcon: Icon(
                                      Icons.phone,
                                    ),
                                    hintText: 'Enter Your Mobile Number'),

                                SizedBox(
                                  height: height * 0.0075,
                                ),

                                const PasswordTextField(
                                    labelText: 'Password',
                                    hintText: "Enter Your Password"),
                                SizedBox(
                                  height: height * 0.0075,
                                ),

                                const PasswordTextField(
                                    labelText: "Confrim Password",
                                    hintText: "ReEnter Your Password"),
                                SizedBox(
                                  height: height * 0.05,
                                ),
                                CustomHomePageButton(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Container()));
                                  },
                                  title: 'Register',
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     Text(
                                //       'Already have an account!',
                                //       style: TextStyle(color: Colors.white),
                                //     ),
                                //     TextButton(
                                //         onPressed: () {
                                //           setState(() {
                                //             val = pi;
                                //             registerTimer =
                                //                 Timer(Duration(milliseconds: 500), () {
                                //               setState(() {
                                //                 switchScreen = false;
                                //               });
                                //             });
                                //           });

                                //         },
                                //         child: Text(
                                //           'Login',
                                //           style: TextStyle(color: Colors.red),
                                //         ))
                                //   ],
                                // )
                                CustomHomeTextButton(
                                    questionText: 'Already have an account?',
                                    buttonTitle: "Login",
                                    onPressed: () {
                                      setState(() {
                                        val = pi;
                                        registerTimer = Timer(
                                            Duration(milliseconds: 500), () {
                                          setState(() {
                                            switchScreen = false;
                                          });
                                        });
                                      });
                                      // Get.to(()=>GlassLogin(),transition: Transition.zoom,duration: Duration(seconds: 3));
                                    }),
                                Row(
                                  children: [
                                    const Expanded(
                                        child: Divider(
                                      color: AppColors.black,
                                    )),
                                    Text(
                                      'or signup with',
                                      style: AppStyles.stylePoppinsRegular20(
                                              context)
                                          .copyWith(
                                              fontSize:
                                                  getResponsiveFontSizeText(
                                                      context,
                                                      fontSize: width <
                                                              AppConstants
                                                                  .maxMobileWidth
                                                          ? 18
                                                          : 24)),
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
                                          //launchUrlString('https://www.google.com');
                                        },
                                        icon: Image.asset(
                                          AppImages.google,
                                          fit: BoxFit.fill,
                                          width: width * 0.08,
                                        )),
                                    // SizedBox(
                                    //   width: width*0.027,
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
                        )
                      ],
                    )
                  ],
                ),
              )
            : GlassLogin());
  }

  TweenAnimationBuilder<double> getMobileRegisterWaveContent(
      double width, double height, BuildContext context) {
    return TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: val),
        duration: const Duration(seconds: 1),
        onEnd: () => setState(() {}),
        builder: (context, value, child) {
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(value),
            alignment: Alignment.bottomCenter,
            child: child,
          );
        },
        child: switchScreen
            ? Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(pi),
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: [
                    Positioned.fill(
                        child: Container(
                      decoration:
                          const BoxDecoration(color: AppColors.lightPurple1),
                    )),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            'Register here',
                            style: AppStyles.styleRufinaBold32(context)
                                .copyWith(
                                    fontSize: getResponsiveFontSizeText(context,
                                        fontSize:
                                            width < AppConstants.maxMobileWidth
                                                ? 40
                                                : 60)),
                          ),
                          SizedBox(
                            height: height * 0.0075,
                          ),
                          Text(
                            'Create Your Account On Divine Connection',
                            textAlign: TextAlign.center,
                            style: AppStyles.styleRufinaBold32(context)
                                .copyWith(
                                    fontSize: getResponsiveFontSizeText(context,
                                        fontSize:
                                            width < AppConstants.maxMobileWidth
                                                ? 18
                                                : 28)),
                          ),
                          SizedBox(
                            height: height * 0.0075,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: NormalTextField(
                                  controller: fnameController,
                                    labelText: "First Name",
                                    prefixIcon: Icon(
                                      Icons.account_circle,
                                      size: width < AppConstants.maxMobileWidth
                                          ? 30
                                          : 50,
                                    ),
                                    hintText: "Enter Your First Name"),
                              ),
                             
                              Expanded(
                                child: NormalTextField(
                                  controller: lnameController,
                                    labelText: "Last Name",
                                    prefixIcon: Icon(
                                      Icons.account_circle,
                                      size: width < AppConstants.maxMobileWidth
                                          ? 30
                                          : 50,
                                    ),
                                    hintText: "Enter Your Last Name"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.0075,
                          ),
                          NormalTextField(
                            controller: emailController,
                              labelText: 'Email',
                              prefixIcon: Icon(
                                Icons.email,
                                size: width < AppConstants.maxMobileWidth
                                    ? 30
                                    : 50,
                              ),
                              hintText: 'Enter Your Email'),
                          SizedBox(
                            height: height * 0.0075,
                          ),
                           NormalTextField(
                            controller:phoneController ,
                              labelText: 'Phone No.',
                              prefixIcon: Icon(
                                Icons.phone,size: width<AppConstants.maxMobileWidth?30:50,
                              ),
                              hintText: 'Enter Your Mobile Number'),
                          SizedBox(
                            height: height * 0.0075,
                          ),
                           PasswordTextField(
                            controller: passwordController,
                              labelText: 'Password',
                              hintText: "Enter Your Password"),
                                                     // SizedBox(
                                                     //   height: height * 0.0075,
                                                     // ),
                           PasswordTextField(
                            controller: confirmPassController,
                              labelText: "Confrim Password",
                              hintText: "ReEnter Your Password"),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          CustomHomePageButton(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Container()));
                            },
                            title: 'Register',
                          ),
                          CustomHomeTextButton(
                              questionText: 'Already have an account?',
                              buttonTitle: "Login",
                              onPressed: () {
                                setState(() {
                                  val = pi;
                                  registerTimer = Timer(
                                      const Duration(milliseconds: 500), () {
                                    setState(() {
                                      switchScreen = false;
                                    });
                                  });
                                });
                              }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Expanded(
                                  child: Divider(
                                color: AppColors.black,
                              )),
                              Text(
                                'or signup with',
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
                          Row(
                            children: [
                              const Spacer(),
                              IconButton(
                                  onPressed: () {
                                    // launch a new page with url on web
                                    //launchUrlString('https://www.google.com');
                                  },
                                  icon: Image.asset(
                                    AppImages.google,
                                    fit: BoxFit.fill,
                                    width: width * 0.08,
                                  )),
                              // SizedBox(
                              //   width: width*0.027,
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
                    Transform.translate(
                      offset: Offset(0, height<=670? 50:0),
                      child: const MyAnimationWidget())
                  ],
                ),
              )
            : const GlassLogin());
  }

  Widget getDesktopAnimatioRegister(
      double width, BuildContext context, double height) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Positioned(
            top: height * 0.1,
            left: 20,
            child: Text(
              'Register Here ...',
              style: AppStyles.styleRufinaBold32(context).copyWith(
                  fontSize: getResponsiveFontSizeText(context,
                      fontSize: width < AppConstants.maxMobileWidth ? 40 : 60)),
            ),
          ),
          Positioned(
            right: 10,
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.03, top: height * 0.03),
              child: Column(
                children: [
                  SizedBox(
                    width: width * 0.5,
                    child: Padding(
                      padding: EdgeInsets.only(right: width * 0.03),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              'Create Your Account On Divine Connection',
                              textAlign: TextAlign.center,
                              style: AppStyles.styleRufinaBold32(context),
                            ),
                            SizedBox(
                              height: height * 0.006,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: NormalTextField(
                                      controller: fnameController,
                                      labelText: "First Name",
                                      prefixIcon: const Icon(
                                        Icons.account_circle,
                                        size: 40,
                                      ),
                                      hintText: "Enter Your First Name"),
                                ),
                                Expanded(
                                  child: NormalTextField(
                                      controller: lnameController,
                                      labelText: "Last Name",
                                      prefixIcon: const Icon(
                                        Icons.account_circle,
                                        size: 40,
                                      ),
                                      hintText: "Enter Your Last Name"),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.014,
                            ),
                            NormalTextField(
                                controller: emailController,
                                labelText: "Email",
                                prefixIcon: const Icon(Icons.email, size: 40),
                                hintText: "Enter Your Email"),
                            SizedBox(
                              height: height * 0.014,
                            ),
                            NormalTextField(
                                controller: phoneController,
                                labelText: "Phon No.",
                                prefixIcon: const Icon(
                                  Icons.phone,
                                  size: 40,
                                  color: AppColors.darkPrimary,
                                ),
                                hintText: "Enter Your PhoneNumber"),
                            SizedBox(
                              height: height * 0.014,
                            ),
                            PasswordTextField(
                                controller: passwordController,
                                labelText: "Password",
                                hintText: "Enter Your Password"),
                            SizedBox(
                              height: height * 0.014,
                            ),
                            PasswordTextField(
                                controller: confirmPassController,
                                labelText: "ConfirmPassword",
                                hintText: "Enter Your Password"),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            CustomHomePageButton(
                              onTap: () {},
                              title: 'Register',
                            ),
                            CustomHomeTextButton(
                                questionText: 'Already have an account?',
                                buttonTitle: "Login",
                                onPressed: () {
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
                                  style: AppStyles.stylePoppinsRegular20(
                                          context)
                                      .copyWith(
                                          fontSize: getResponsiveFontSizeText(
                                              context,
                                              fontSize: width <
                                                      AppConstants
                                                          .maxMobileWidth
                                                  ? 18
                                                  : 24)),
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
                  )
                ],
              ),
            ),
          ),
          const MyAnimationWidget()
        ]),
      ),
    );
  }
}
