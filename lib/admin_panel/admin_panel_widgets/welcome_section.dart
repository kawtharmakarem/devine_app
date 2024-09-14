import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../models/homepage_models/carousel_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class WelcomeSection extends StatefulWidget {
  const WelcomeSection({super.key});

  @override
  State<WelcomeSection> createState() => _WelcomeSectionState();
}

class _WelcomeSectionState extends State<WelcomeSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('👋 Welcome',style: AppStyles.styleRufinaBold32(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 28)),),
        getCarouselSection(sliders)
      ],
    );
  }

   Widget getCarouselSection(List<CarouselModel>? sliders) {
    if (sliders != null) {
      return CarouselSlider(
          items: sliders
              .map((carouselModel) => SizedBox(
                    width: double.infinity,
                    child: Text(carouselModel.title,style: AppStyles.styleRegular20(context).copyWith(color: AppColors.black,fontSize: getResponsiveFontSizeText(context, fontSize: 18)),textAlign: TextAlign.center,),
                  ))
              .toList(),
          options: CarouselOptions(
              height: 50,
              autoPlay: true,
              enableInfiniteScroll: true,
              enlargeCenterPage: true));
    } else {
      return Container();
    }
  }

  static final sliders=[
    CarouselModel(title: "Here you can put any text # 1", image: AppImages.carouselBaby),
    CarouselModel(title: "Here you can put any text # 2", image: AppImages.carouselRealtion),
    CarouselModel(title: "Here you can put any text # 3", image: AppImages.carouselPalmread),
    CarouselModel(title: "Here you can put any text # 4", image: AppImages.carouselFuture),
    CarouselModel(title: "Here you can put any text # 5", image: AppImages.carouselDream),
    CarouselModel(title: "Here you can put any text # 6", image: AppImages.carouselNumero),
    CarouselModel(title: "Here you can put any text # 7", image: AppImages.carouselAnger),
  ];
  
}