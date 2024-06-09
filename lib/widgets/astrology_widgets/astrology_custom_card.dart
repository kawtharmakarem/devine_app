import 'package:divinecontrol/models/astrology_models/astrology_cardmodel.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:divinecontrol/widgets/astrology_widgets/custom_astrology_button.dart';
import 'package:divinecontrol/widgets/astrology_widgets/custom_astrology_container.dart';
import 'package:flutter/material.dart';

class AstrologyCustomCard extends StatelessWidget {
  const AstrologyCustomCard(
      {super.key, required this.onTap, required this.astrologyModel});
  final void Function() onTap;
  final AstrologyModel astrologyModel;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: width < AppConstants.maxMobileWidth
            ? getMobileCustomCard(context, width)
            : width < AppConstants.maxTabletWidth
                ? getTabletCustomCard(context, width)
                : getDesktopCustomCard(context, width),
      ),
    );
  }

  Column getMobileCustomCard(BuildContext context, double width) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
                width: double.maxFinite,
                child: Image.asset(
                  astrologyModel.image,
                  fit: BoxFit.fill,
                )),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: CustomAstrologyContainer(
                  title: astrologyModel.title,
                ))
          ],
        ),
        const Expanded(child: SizedBox()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Image.asset(AppImages.star),
                    Text(
                      '${astrologyModel.value}/msg',
                      style: width < AppConstants.maxMobileWidth
                          ? AppStyles.styleRegular20(context).copyWith(
                              fontSize: getResponsiveFontSizeText(context,
                                  fontSize: 16))
                          : AppStyles.styleRegular20(context),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: CustomAstrologyButton(title: 'Book Now', onTap: () {}))
            ],
          ),
        ),
       const Expanded(child: SizedBox())
      ],
    );
  }

  Column getTabletCustomCard(BuildContext context, double width) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
                width: double.maxFinite,
                child: Image.asset(
                  astrologyModel.image,
                  fit: BoxFit.fill,
                )),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: CustomAstrologyContainer(
                  title: astrologyModel.title,
                ))
          ],
        ),
        const Expanded(child: SizedBox()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Image.asset(AppImages.star),
                    Text(
                      '${astrologyModel.value}/msg',
                      style: AppStyles.styleRegular20(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 28)),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: CustomAstrologyButton(title: 'Book Now', onTap: () {}))
            ],
          ),
        ),
        const Expanded(child: SizedBox())
      ],
    );
  }

  Column getDesktopCustomCard(BuildContext context, double width) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
                width: double.maxFinite,
                child: Image.asset(
                  astrologyModel.image,
                  fit: BoxFit.fill,
                )),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: CustomAstrologyContainer(
                  title: astrologyModel.title,
                ))
          ],
        ),
        const Expanded(child: SizedBox()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Image.asset(
                      AppImages.star,
                    ),
                    Text(
                      '${astrologyModel.value}/msg',
                      style: AppStyles.styleRegular20(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 32)),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: CustomAstrologyButton(title: 'Book Now', onTap: () {}))
            ],
          ),
        ),
       const Expanded(child: SizedBox())
      ],
    );
  }
}
