import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/tarotreading_models/drawer_title_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class MainCustomTitle extends StatelessWidget {
  const MainCustomTitle(
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(drawerTitle.title,softWrap: true,overflow: TextOverflow.ellipsis,maxLines: 2,
                      style:width<AppConstants.maxMobileWidth? AppStyles.styleRegular20(context):AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 28))),
                  SvgPicture.asset(drawerTitle.image)
                ],
              ),
          ),
        )
        : Row(
            children: [
              Text(drawerTitle.title,softWrap: true,maxLines: 2,overflow: TextOverflow.ellipsis,
                  style: width < AppConstants.maxMobileWidth
                      ? AppStyles.styleRegular20(context)
                      : AppStyles.styleRegular20(context).copyWith(
                          fontSize: getResponsiveFontSizeText(context,
                              fontSize: 28))),
              SvgPicture.asset(drawerTitle.image)
            ],
          );
  }
}
