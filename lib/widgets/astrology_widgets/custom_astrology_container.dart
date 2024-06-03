import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomAstrologyContainer extends StatelessWidget {
  const CustomAstrologyContainer({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return width<AppConstants.maxMobileWidth?  getMobileContainer(width, context): getTabletContainer(width, context);
  }

   Container getMobileContainer(double width, BuildContext context) {
    return Container(
    padding: const EdgeInsets.symmetric(vertical: 5),
    decoration: const BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15))),
    child: Center(
        child: Text(title,
            style: 
AppStyles.styleSemiBold24(context)
                    .copyWith(color: AppColors.white,fontSize: getResponsiveFontSizeText(context, fontSize: 16))
                
                    )
                    ),
  );
  }

  Container getTabletContainer(double width, BuildContext context) {
    return Container(
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15))),
    child: Center(
        child: Text(title,
            style: width < AppConstants.maxTabletWidth
                ? AppStyles.styleBold24(context)
                    .copyWith(color: AppColors.white)
                : AppStyles.styleBold32(context)
                    .copyWith(color: AppColors.white))),
  );
  }
}
