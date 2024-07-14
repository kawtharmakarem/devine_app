import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:divinecontrol/widgets/tarotreading_widgets/tarot_desktop_layout.dart';
import 'package:divinecontrol/widgets/tarotreading_widgets/tarot_mobile_layout.dart';
import 'package:divinecontrol/widgets/tarotreading_widgets/tarot_tablet_layout.dart';
import 'package:divinecontrol/widgets/tarotreading_widgets/tarotreading_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_styles.dart';

class MainTarotReadView extends StatefulWidget {
  const MainTarotReadView({super.key});

  @override
  State<MainTarotReadView> createState() => _MainTarotReadViewState();
}

class _MainTarotReadViewState extends State<MainTarotReadView> {
  // TextEditingController searchController = TextEditingController();
  // String textFieldValue = "";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
      appBar:const CustomAppBar(title: "Tarot Reading", leading: true),
      body: width < AppConstants.maxTabletWidth
          ? getMobileMainContent(width, height, context)
          : getDesktopMainContent(width, height, context),
    );
  }

  Container getMobileMainContent(
      double width, double height, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(width / 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
              width: width * 0.4,
              height: height * 0.28,
              child: Image.asset(
                // 'assets/tarotimages/card.png',
                AppImages.newcard,
                fit: BoxFit.fill,
              )),
          Container(
              decoration: const BoxDecoration(),
              child: Text(
                "Reveal the answers to All of your Questions about Business, Love, Finance, Career, Relationships and much more !!!",
                style: width < AppConstants.maxMobileWidth
                    ? AppStyles.styleRegular20(context)
                    : AppStyles.styleRegular20(context).copyWith(
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize:28)),
                textAlign: TextAlign.center,
              )),
          // CustomSearchTextField(
          //     onChanged: (value) {
          //       setState(() {
          //         textFieldValue = value;
          //         searchController.text = value;
          //       });
          //     },
          //     controller: searchController,
          //     labelText: 'Enter Your Question',
          //     prefixIcon:  Icon(
          //       Icons.search,
          //       color: AppColors.darkPrimary,
          //       size: width<AppConstants.maxMobileWidth? 30:50,
          //     ),
          //     hintText: 'your question'),
          CustomTarotButton(
            title: 'Next',
            onPressed: () {
              Get.to(
                  () => width < AppConstants.maxMobileWidth
                      ? const TarotMobileLayout()
                      : const TarotTabletLayout(),
                  // arguments: searchController.text,
                  transition: Transition.circularReveal,
                  fullscreenDialog: false,
                  duration: const Duration(seconds: 1));
            },
          )
        ],
      ),
    );
  }

  Container getDesktopMainContent(
      double width, double height, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(width / 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: width * 0.2,
              height: height * 0.5,
              child: Image.asset(
                // 'assets/tarotimages/card.png',
                AppImages.newcard,
                fit: BoxFit.fill,
              )),
          SizedBox(
            width: width * 0.2,
          ),
          SizedBox(
            width: width * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    decoration: const BoxDecoration(),
                    child: Text(
                      'This one card prediction will reveal the answers to all of your underlying questions about business, love, finance, and relationships.',
                      style: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 40)),
                         
                      textAlign: TextAlign.center,
                    )),
                
                CustomTarotButton(
                  title: 'Next',
                  onPressed: () {
                    Get.to(() => const TarotDesktopLayout(),
                        transition: Transition.fade,
                        fullscreenDialog: false,
                        duration: const Duration(seconds: 1));
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
