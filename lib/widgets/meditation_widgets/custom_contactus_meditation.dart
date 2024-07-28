
import 'package:divinecontrol/utils/app_images.dart';
import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class CustomMeditationContactUsButton extends StatefulWidget {
  const CustomMeditationContactUsButton(
      {super.key,
      required this.onTap });
  final void Function() onTap;

  @override
  State<CustomMeditationContactUsButton> createState() => _CustomMeditationContactUsButtonState();
}

class _CustomMeditationContactUsButtonState extends State<CustomMeditationContactUsButton> {
  bool startAnimation = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return AnimatedContainer(
      width: width / 20,
      height: width / 15,
      duration: Duration(milliseconds: 300 + (10 * 150)),
      transform: Matrix4.translationValues(startAnimation ? 0 : width, 0, 0),
      curve: Curves.decelerate,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: width < AppConstants.maxMobileWidth
                    ? width / 4
                    : width < AppConstants.maxTabletWidth
                        ? width / 6.5
                        : width / 10,
                height: width < AppConstants.maxMobileWidth
                    ? width / 4
                    : width < AppConstants.maxTabletWidth
                        ? width / 6.5
                        : width / 10,
                child: Image.asset(
                  AppImages.meditationLogo,
                  fit: BoxFit.cover,
                )),
                const SizedBox(height: 5,),
            Text(
              'Book a Call',textAlign: TextAlign.center,
              style: width < AppConstants.maxMobileWidth
                  ? AppStyles.styleBold24(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 18))
                  : width < AppConstants.maxTabletWidth
                      ? AppStyles.styleBold24(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 22))
                      : AppStyles.styleBold24(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 32)),
            )
          ],
        ),
      ),
    );
  }
}