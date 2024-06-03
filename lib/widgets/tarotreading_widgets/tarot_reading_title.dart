import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/tarot_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class TarotReadingTitle extends StatelessWidget {
  const TarotReadingTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              splashColor: AppColors.purple,
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(AppImages.leftarrow)),
          Text(
            'Tarot Reading',
            style: width < TarotAppConstants.tabletMaxWidth
                ? AppStyles.stylePoppinsSemiBold32(context)
                : AppStyles.stylePoppinsSemiBold32(context).copyWith(
                    fontSize:
                        getResponsiveFontSizeTextTarot(context, fontSize: 28)),
          ),
          const Opacity(opacity: 0, child: Icon(Icons.abc))
        ],
      ),
    );
  }
}
