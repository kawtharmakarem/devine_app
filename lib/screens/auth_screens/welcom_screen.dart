import 'package:divinecontrol/screens/auth_screens/main_cards_page.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';
import '../../widgets/auth_widgets/custom_welcome_button.dart';
import '../../widgets/auth_widgets/phone_textField_home.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: AppColors.primary.withOpacity(0.3),
      body:width<AppConstants.maxTabletWidth? getMobileWelcomeContent(height, width, context):getDesktopWelcomeContent(height, width, context),
    );
  }

  Column getMobileWelcomeContent(double height, double width, BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          height: height / 1.7,
          decoration:
              BoxDecoration(color: AppColors.primary.withOpacity(0.3)),
          child: Transform.scale(
            scale: width < AppConstants.maxMobileWidth ? 1.5 : 3,
            child: Image.asset(
              AppImages.logoonly,
            ),
          ),
        ),
        Expanded(
          child: Material(
            elevation: 4,
            child: Container(
                width: double.maxFinite,
                transform: Matrix4.translationValues(0.0, -width * 0.08, 0.0),
                decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Welcome to \nWorld of Magic',
                        textAlign: TextAlign.center,
                        style: width < AppConstants.maxMobileWidth
                            ? AppStyles.styleRufinaBold32(context).copyWith(
                                color: AppColors.darkPrimary,
                                fontWeight: FontWeight.w900)
                            : AppStyles.styleRufinaBold32(context).copyWith(
                                color: AppColors.darkPrimary,
                                fontWeight: FontWeight.w900,
                                fontSize: getResponsiveFontSizeText(context,
                                    fontSize: 42)),
                      ),
                      const PhoneNumberTextField(),
                      CustomWelcomeButton(
                        title: "Let's Start",
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  //builder: (context) => const LoginScreen(),
                                  builder: (context) => const MainCardsPage(),
                                  ),
                                  );
                        },
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ],
    );
  }


  Widget getDesktopWelcomeContent(double height, double width, BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: SizedBox(
            width: double.maxFinite,
            height: double.infinity,
            
            child: Transform.scale(
              scale:  3,
              child: Image.asset(
                AppImages.logoonly,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Card(
            margin: EdgeInsets.all(width/40),
            elevation: 4,
            shadowColor: AppColors.black,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            child: Container(
                width: double.maxFinite,
               // transform: Matrix4.translationValues(0.0, -width * 0.08, 0.0),
                decoration:  BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(40)
                    
                    ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Welcome to \nWorld of Magic',
                        textAlign: TextAlign.center,
                        style:AppStyles.styleRufinaBold32(context).copyWith(
                                color: AppColors.darkPrimary,
                                fontWeight: FontWeight.w900,
                                fontSize: getResponsiveFontSizeText(context,
                                    fontSize: 50)),
                      ),
                      const PhoneNumberTextField(),
                      CustomWelcomeButton(
                        title: "Let's Start",
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  //builder: (context) => const LoginScreen(),
                                  builder: (context) => const MainCardsPage(),
                                  ),
                                  );
                        },
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
