import 'package:divinecontrol/utils/tarot_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/tarotreading_models/drawer_title_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class DrawerCustomTitle extends StatelessWidget {
  const DrawerCustomTitle(
      {super.key, required this.drawerTitle, this.isActive = false});
  final DrawerTitleModel drawerTitle;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return isActive
        ? GestureDetector(
          onTap: drawerTitle.onTap,
          child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: AppColors.lightPurple2,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 0.5, color: AppColors.purple)),
              child: Row(
                children: [
                  Text(drawerTitle.title,
                      style: AppStyles.styleRegular18(context)),
                  SvgPicture.asset(drawerTitle.image)
                ],
              ),
            ),
        )
        : Row(
            children: [
              Text(drawerTitle.title,
                  style: width < TarotAppConstants.tabletMaxWidth
                      ? AppStyles.styleRegular28(context)
                      : AppStyles.styleRegular28(context).copyWith(
                          fontSize: getResponsiveFontSizeTextTarot(context,
                              fontSize: 22))),
              SvgPicture.asset(drawerTitle.image)
            ],
          );
  }
}
