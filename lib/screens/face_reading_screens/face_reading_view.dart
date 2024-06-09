import 'package:divinecontrol/widgets/face_reading_widgets/scan_face_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class FaceReadingView extends StatefulWidget {
  const FaceReadingView({super.key});

  @override
  State<FaceReadingView> createState() => _FaceReadingViewState();
}

class _FaceReadingViewState extends State<FaceReadingView> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar:  AppBar(
        title: Text(
          'Face Reading',
          style: width < AppConstants.maxMobileWidth
              ? AppStyles.styleBold24(context)
                  .copyWith(color: AppColors.darkPrimary)
              : AppStyles.styleBold24(context).copyWith(
                  color: AppColors.darkPrimary,
                  fontSize: getResponsiveFontSizeText(context, fontSize: 40)),
        ),
        backgroundColor: AppColors.primary,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppImages.leftArrow),
        ),
      ),
      body:const Column(children: [
        Expanded(child: ScanFaceWidget())
      ],),
    );
  }
}