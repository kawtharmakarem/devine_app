import 'package:divinecontrol/screens/horoscope_screens/horoscope_details_screen.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:divinecontrol/widgets/horoscope_widgets/horoscope_item.dart';
import 'package:divinecontrol/widgets/horoscope_widgets/horoscope_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';

class HoroscopeScreen extends StatefulWidget {
  const HoroscopeScreen({super.key});

  @override
  State<HoroscopeScreen> createState() => _HoroscopeScreenState();
}

class _HoroscopeScreenState extends State<HoroscopeScreen> {
  double width = 0;
  double height = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
      appBar:const CustomAppBar(title: "Horoscope", leading:true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: width < AppConstants.maxMobileWidth
              ? getMobileHoroscopeContent()
              : getTabletHoroscopeContent(),
        ),
      ),
    );
  }

  Column getMobileHoroscopeContent() {
    return Column(
      children: [
        GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            shrinkWrap: true,
            itemCount: horoscopes.length,
            itemBuilder: (context, index) {
              return HoroscopeItem(
                index: index,
                horoscopeModel: horoscopes[index],
                onTap: () {
                  
                  Get.to(()=>HoroscopeDetailsScreen(horoscopeModel: horoscopes[index]),transition: Transition.circularReveal,duration:const Duration(seconds: 2));
                },
              );
            })
      ],
    );
  }

  Widget getTabletHoroscopeContent() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width < AppConstants.maxTabletWidth ? 3 : 4,
                mainAxisSpacing: 50,
                crossAxisSpacing: 30),
            shrinkWrap: true,
            itemCount: horoscopes.length,
            itemBuilder: (context, index) {
              return HoroscopeItem(
                index: index,
                horoscopeModel: horoscopes[index],
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => HoroscopeDetailsScreen(
                  //         horoscopeModel: horoscopes[index]),
                  //         ),
                  //         );
                                    Get.to(()=>HoroscopeDetailsScreen(horoscopeModel: horoscopes[index]),transition: Transition.zoom,duration:const Duration(seconds: 2));

                },
              );
            }),
      ],
    );
  }
}
