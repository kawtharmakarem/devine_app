import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../utils/app_styles.dart';

class CustomShoppingLine extends StatelessWidget {
  const CustomShoppingLine({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Row(
      children: [
        Icon(
          Icons.assistant_direction_sharp,color: AppColors.darkPrimary,
          size: width < AppConstants.maxMobileWidth ? 20 : 30,
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: width * 0.8,
          child: Text(
            text,
            // softWrap: true,
            // overflow: TextOverflow.ellipsis,
            // maxLines: 3,
            style: width < AppConstants.maxMobileWidth
                ? AppStyles.styleRegular20(context)
                : width < AppConstants.maxTabletWidth
                    ? AppStyles.styleRegular20(context).copyWith(
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize: 28))
                    : AppStyles.styleRegular20(context).copyWith(
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize: 32)),
          ),
        )
      ],
    );
  }
}
