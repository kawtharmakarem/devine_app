import 'package:animations/animations.dart';
import 'package:divinecontrol/models/astrology_models/astrology_cardmodel.dart';
import 'package:divinecontrol/screens/astrology_screens/astrology_details_screen.dart';
import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:divinecontrol/widgets/astrology_widgets/custom_astrology_button.dart';
import 'package:divinecontrol/widgets/astrology_widgets/custom_astrology_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AstrologyCustomCard extends StatelessWidget {
  const AstrologyCustomCard({super.key, required this.astrologyModel, required this.index});
  //final void Function() onTap;
  final AstrologyModel astrologyModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return OpenContainer(
      clipBehavior: Clip.hardEdge,
      closedShape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)) ,
        transitionDuration:
            const Duration(seconds: AppConstants.durationSecond),
        transitionType: ContainerTransitionType.fade,
        closedBuilder: (context, VoidCallback openContainer) {
          return GestureDetector(
            onTap: openContainer,
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
        },
        openBuilder: (context, _) =>
            AstrologyDetailsPage(astrologyModel: astrologyModel));
  }

  Column getMobileCustomCard(BuildContext context, double width) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
                ),
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
        Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                //Image.asset(AppImages.star,width: 15,height: 15,),
                Text(
                 index==1? '₹10/10msg':'₹20/10min',
                  style: width < AppConstants.maxMobileWidth
                      ? AppStyles.styleRegular20(context).copyWith(
                          fontSize: getResponsiveFontSizeText(context,
                              fontSize: 16))
                      : AppStyles.styleRegular20(context),
                )
              ],
            ),
            CustomAstrologyButton(color:AppColors.black,textColor: AppColors.white,
                title:index==0? 'Book a Call':'Book a Chat',
                iconData: index==0?FontAwesomeIcons.phone:Icons.message_rounded,
                onTap: () {
                  Get.to(
                      () => AstrologyDetailsPage(
                          astrologyModel: astrologyModel),
                      transition: Transition.circularReveal,
                      duration: const Duration(
                          seconds: AppConstants.durationSecond));
                })
          ],
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
                    index==1? '₹10/10msg':'₹20/10min',
                       style: AppStyles.styleRegular20(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 28)),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: CustomAstrologyButton(
                    iconData: Icons.message,
                      title: 'Book Now',
                      onTap: () {
                        Get.to(
                            () => AstrologyDetailsPage(
                                astrologyModel: astrologyModel),
                            transition: Transition.circularReveal,
                            duration: const Duration(
                                seconds: AppConstants.durationSecond));
                      }))
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
                      'msg',
                      style: AppStyles.styleRegular20(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 32)),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: CustomAstrologyButton(
                    iconData: Icons.message,
                      title: 'Book Now',
                      onTap: () {
                        Get.to(
                            () => AstrologyDetailsPage(
                                astrologyModel: astrologyModel),
                            transition: Transition.zoom,
                            duration: const Duration(
                                seconds: AppConstants.durationSecond));
                      }))
            ],
          ),
        ),
        const Expanded(child: SizedBox())
      ],
    );
  }
}
