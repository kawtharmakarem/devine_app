import 'package:divinecontrol/screens/horoscope_screens/horoscope_details_screen.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:divinecontrol/widgets/horoscope_widgets/horoscope_item.dart';
import 'package:divinecontrol/widgets/horoscope_widgets/horoscope_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

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
      appBar: AppBar(
        title: Text('Horoscope',
            style: AppStyles.styleBold24(context).copyWith(
                color: AppColors.darkPrimary,
                fontSize: getResponsiveFontSizeText(context,
                    fontSize: width < AppConstants.maxMobileWidth ? 32 : 40))),
        backgroundColor: AppColors.lightPurple1,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppImages.leftArrow),
        ),
      ),
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HoroscopeDetailsScreen(
                          horoscopeModel: horoscopes[index])));
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HoroscopeDetailsScreen(
                          horoscopeModel: horoscopes[index])));
                },
              );
            }),
      ],
    );
  }
}
