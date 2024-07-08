import 'package:divinecontrol/screens/kundli_screens/match_markting_details_screen.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:divinecontrol/widgets/kundli_widgets/custom_kundle_details_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../widgets/kundli_widgets/custom_kundle_button.dart';

class MatchMarktingScreen extends StatelessWidget {
  const MatchMarktingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
      appBar:const CustomAppBar(title: "Match Making", leading: true),
      body: width < AppConstants.maxTabletWidth
          ? getMobileMatchContent(context)
          : getDesktopMatchContent(context),
    );
  }

  Padding getMobileMatchContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 20,
            ),
            const CustomKundleDetailsCard(
              cardTitle: "Boy's Detail",
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomKundleDetailsCard(cardTitle: "Girl's detail"),
            const SizedBox(
              height: 40,
            ),
            CustomKundleButton(
              title: 'Match Kundli',
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const MatchMarktingDetailsScreen()));
                Get.to(()=>const MatchMarktingDetailsScreen(),transition: Transition.circularReveal,duration: const Duration(seconds: AppConstants.durationSecond));
              },
            ),
          ],
        ),
      ),
    );
  }

  Padding getDesktopMatchContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 15,
              ),
              Expanded(
                  child: CustomKundleDetailsCard(
                cardTitle: "Boy's Detail",
              )),
              SizedBox(
                width: 40,
              ),
              Expanded(
                  child: CustomKundleDetailsCard(cardTitle: "Girl's detail")),
              SizedBox(
                width: 15,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          CustomKundleButton(
            title: 'Match Kundli',
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => const MatchMarktingDetailsScreen()));
              Get.to(()=>const MatchMarktingDetailsScreen(),transition: Transition.zoom,duration: const Duration(seconds: AppConstants.durationSecond));
            },
          ),
        ],
      ),
    );
  }
}
