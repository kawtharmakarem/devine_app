import 'package:divinecontrol/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      required this.title,
      this.actionesFn,
      this.actions,
      required this.leading});
  final String title;
  final IconData? actions;
  final void Function()? actionesFn;
  final bool leading;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return AppBar(
      backgroundColor: AppColors.lightPurple1,
      centerTitle: true,
      title: Text(
        title,
        softWrap: true,
        textAlign: TextAlign.center,
        maxLines: 2,
        style: AppStyles.styleBold24(context).copyWith(
            color: AppColors.darkPrimary,
            fontSize: getResponsiveFontSizeText(context,
                fontSize: width < AppConstants.maxMobileWidth
                    ? 30
                    : width < AppConstants.maxTabletWidth
                        ? 40
                        : 46)),
      ),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: actionesFn,
          icon: Icon(
            actions,
            size: width < AppConstants.maxMobileWidth
                ? 30
                : width < AppConstants.maxTabletWidth
                    ? 50
                    : 60,
            color: AppColors.darkPrimary,
          ),
        ),
      ],
      leading: leading
          ? IconButton(
              onPressed: () {
                Get.back();
              },
              icon: SvgPicture.asset(
                AppImages.leftArrow,
                width: width < AppConstants.maxMobileWidth ? 30 : 50,
                height: width < AppConstants.maxMobileWidth ? 30 : 50,
              ))
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
