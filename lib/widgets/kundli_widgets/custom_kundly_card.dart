import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomKundliCard extends StatelessWidget {
  const CustomKundliCard(
      {super.key,
      required this.title,
      required this.image,
      required this.onTap});
  final String title;
  final String image;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child:width<AppConstants.maxTabletWidth? getMobileKundleCard(width, context):getDesktopKundleCard(width, context),
    );
  }

  Container getMobileKundleCard(double width, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin:width<AppConstants.maxMobileWidth? const EdgeInsets.all(5):const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(width: 1, color: AppColors.black)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
              width:width<AppConstants.maxMobileWidth? width * 0.35: width*0.3,
              height:width<AppConstants.maxMobileWidth? width * 0.35:width*0.3,
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              )),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: width < AppConstants.maxMobileWidth
                ? AppStyles.styleBold24(context)
                : AppStyles.styleBold24(context).copyWith(
                    fontSize:
                        getResponsiveFontSizeText(context, fontSize: 36)),
          )
        ],
      ),
    );
  }

   Container getDesktopKundleCard(double width, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin:width<AppConstants.maxMobileWidth? const EdgeInsets.all(5):const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(width: 1, color: AppColors.black)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              width: width*0.25,
              height:width*0.25,
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              )),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: width < AppConstants.maxMobileWidth
                ? AppStyles.styleBold24(context)
                : AppStyles.styleBold24(context).copyWith(
                    fontSize:
                        getResponsiveFontSizeText(context, fontSize: 36)),
          )
        ],
      ),
    );
  }
}
