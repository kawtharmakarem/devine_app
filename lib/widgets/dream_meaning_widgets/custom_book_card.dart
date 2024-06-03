import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class CustomBookCard extends StatelessWidget {
  const CustomBookCard(
      {super.key,
      required this.onTap,
      required this.title,
      required this.image});
  final void Function() onTap;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    // return width<AppConstants.maxMobileWidth? getMobileCard(height, width, context):getTabletCard(height, width, context);
    if(width<AppConstants.maxMobileWidth){
      return getMobileCard(height, width, context);
    }else if(width<AppConstants.maxTabletWidth){
      return getTabletCard(height, width, context);
    }else{
      return getDesktopCard(height, width, context);
    }
  }

  Card getMobileCard(double height, double width, BuildContext context) {
    return Card(
    elevation: 4,
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: InkWell(
      onTap: onTap,
      splashColor: AppColors.primary,
      child: Container(
        height: height * 0.278,
        width: width * 0.55,
        decoration: const BoxDecoration(color: AppColors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const Expanded(flex: 2, child: SizedBox()),
            Image.asset(image),
          const  Expanded(flex: 1, child: SizedBox()),
            Text(
              title,
              style: AppStyles.styleBold24(context),
            ),
           const Expanded(flex: 1, child: SizedBox())
          ],
        ),
      ),
    ),
  );
  }

   Card getTabletCard(double height, double width, BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 25),
    elevation: 4,
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: InkWell(
      onTap: onTap,
      splashColor: AppColors.primary,
      child: Container(
        height: height * 0.25,
        width: width * 0.5,
        decoration: const BoxDecoration(color: AppColors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const Expanded(flex: 2, child: SizedBox()),
            Container(
              width:  width*0.2, //250,
              height: height*0.15,
              child: Image.asset(image,fit: BoxFit.fill,)),
          const  Expanded(flex: 1, child: SizedBox()),
            Text(
              title,
              style: AppStyles.styleBold24(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 40)),
            ),
           const Expanded(flex: 1, child: SizedBox())
          ],
        ),
      ),
    ),
  );
  }

  Card getDesktopCard(double height, double width, BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 25),
    elevation: 4,
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: InkWell(
      onTap: onTap,
      splashColor: AppColors.primary,
      child: Container(
        height: height * 0.5,
        width: width * 0.25,
        decoration: const BoxDecoration(color: AppColors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const Expanded(flex: 2, child: SizedBox()),
            Container(
              width:  width*0.2, //250,
              height: height*0.4,
              child: Image.asset(image,fit: BoxFit.fill,)),
          const  Expanded(flex: 1, child: SizedBox()),
            Text(
              title,
              style: AppStyles.styleBold24(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 40)),
            ),
           const Expanded(flex: 1, child: SizedBox())
          ],
        ),
      ),
    ),
  );
  }
}
