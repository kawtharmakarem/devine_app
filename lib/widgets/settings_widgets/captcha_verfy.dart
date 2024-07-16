import 'dart:async';
import 'dart:math';

import 'package:divinecontrol/screens/settings/contactus_screen.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/widgets/auth_widgets/custom_homepage_button.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

typedef void BoolCallBack(bool value);

class CaptchaVerify extends StatefulWidget {
  const CaptchaVerify({
    super.key,
    required this.callBack,
  });
  final BoolCallBack callBack;

  @override
  State<CaptchaVerify> createState() => _CaptchaVerifyState();
}

class _CaptchaVerifyState extends State<CaptchaVerify> {
  TextEditingController controller = TextEditingController();
  String randomString = "";
  bool isVerified = false;

  void buildCaptcha() {
    const letters =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    const length = 6;
    final random = Random();
    randomString = String.fromCharCodes(List.generate(
        length, (index) => letters.codeUnitAt(random.nextInt(letters.length))));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    buildCaptcha();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            width: width * 0.15,
            height: height * 0.15,
            child: Image.asset(
              "assets/homepageimages/captcha.png",
              fit: BoxFit.fill,
              color: AppColors.darkPrimary,
            )),
        // SvgPicture.asset("assets/homepageimages/recaptcha-icon.svg"
        Text(
          "Enter Captcha Value",
          textAlign: TextAlign.center,
          style: AppStyles.styleBold24(context).copyWith(
              fontSize: getResponsiveFontSizeText(context,
                  fontSize: width < AppConstants.maxMobileWidth
                      ? 18
                      : width < AppConstants.maxTabletWidth
                          ? 24
                          : 28)),
        ),
        SizedBox(
          height: height * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //show captcha value to user
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                randomString,
                style: AppStyles.styleRegular20(context).copyWith(
                    fontSize: getResponsiveFontSizeText(context,
                        fontSize: width < AppConstants.maxMobileWidth
                            ? 18
                            : width < AppConstants.maxTabletWidth
                                ? 24
                                : 28)),
              ),
            ),
            SizedBox(
              width: height * 0.015,
            ),
            //generate captch value
            IconButton(
                onPressed: () {
                  buildCaptcha();
                },
                icon: Icon(
                  Icons.refresh,
                  size: width < AppConstants.maxMobileWidth ? 40 : 70,
                  color: AppColors.darkPrimary,
                )),
          ],
        ),

        SizedBox(
          height: height * 0.015,
        ),
        TextFormField(
          style: AppStyles.styleRegular20(context).copyWith(
              fontSize: getResponsiveFontSizeText(context,
                  fontSize: width < AppConstants.maxMobileWidth
                      ? 18
                      : width < AppConstants.maxTabletWidth
                          ? 28
                          : 32)),
          onChanged: (value) {
            setState(() {
              isVerified = false;
            });
          },
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              // hintText: "Enter captcha value",
              labelText: "Enter captcha value",
              labelStyle: AppStyles.styleRegular20(context).copyWith(
                  fontSize: getResponsiveFontSizeText(context,
                      fontSize: width < AppConstants.maxMobileWidth ? 18 : 28)),
              hintStyle: AppStyles.styleRegular20(context).copyWith(
                  fontSize: getResponsiveFontSizeText(context,
                      fontSize:
                          width < AppConstants.maxMobileWidth ? 16 : 24))),
          controller: controller,
        ),
        SizedBox(
          height: height * 0.03,
        ),
        Transform.scale(
          scale: 0.8,
          child: CustomHomePageButton(
              onTap: () async {
                isVerified = controller.text == randomString;
                widget.callBack(isVerified);
                ContactUsScreen.of(context)?.isChecked = isVerified;
                setState(() {});
                await Future.delayed(const Duration(seconds: 2));

                // Get.back();
                Navigator.of(context, rootNavigator: true).pop(isVerified);
              },
              title: "CheckValue"),
        ),

        const SizedBox(
          height: 10,
        ),
        if (isVerified)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.verified,
                color: AppColors.darkPrimary,
                size: width < AppConstants.maxMobileWidth ? 40 : 70,
              ),
              Text(
                "Verified",
                style: AppStyles.styleRegular20(context).copyWith(
                    fontSize: getResponsiveFontSizeText(context,
                        fontSize:
                            width < AppConstants.maxMobileWidth ? 20 : 28)),
              )
            ],
          )
        else
          Text(
            "Please enter value you see on screen",
            textAlign: TextAlign.center,
            style: AppStyles.styleRegular20(context).copyWith(
                color: AppColors.darkPrimary,
                fontSize: getResponsiveFontSizeText(context,
                    fontSize: width < AppConstants.maxMobileWidth ? 18 : 24)),
          )
      ],
    );
  }
}
