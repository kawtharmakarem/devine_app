import 'dart:developer';

import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/widgets/auth_widgets/custom_homepage_button.dart';
import 'package:divinecontrol/widgets/settings_widgets/captcha_verfy.dart';
import 'package:divinecontrol/widgets/settings_widgets/custom_settings_dropdown.dart';
import 'package:divinecontrol/widgets/settings_widgets/custom_settingstextfield.dart';
import 'package:divinecontrol/widgets/settings_widgets/custom_verify_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/app_colors.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
  static _ContactUsScreenState? of(BuildContext context) =>
      context.findAncestorStateOfType<_ContactUsScreenState>();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController listController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  final items = ["Feedback/Suggestion", "Support", "General Inquiry"];
  bool _isChecked = false;
  bool test = false;
  set isChecked(bool value) {
    setState(() {
      _isChecked = value;
    });
  }

  bool get isChecked {
    return _isChecked;
  }

  @override
  Widget build(BuildContext context) {
    log("$isChecked");
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: width < AppConstants.maxTabletWidth
          ? getMobileContactUsContent(width, height, context)
          : getDesktopContactUsContent(width, height, context),
    );
  }

  SingleChildScrollView getMobileContactUsContent(
      double width, double height, BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: width < AppConstants.maxMobileWidth
              ? height * 0.015
              : height * 0.03,
        ),
        Icon(
          FontAwesomeIcons.phoneVolume,
          size: width < AppConstants.maxMobileWidth ? 70 : 120,
          color: AppColors.darkPrimary,
        ),
        SizedBox(
          height: width < AppConstants.maxMobileWidth
              ? height * 0.015
              : height * 0.03,
        ),
        CustomSettingsTextField(
          labelText: "Full Name *",
          hintText: "Enter Your Name",
          controller: nameController,
          maxLines: 1,
        ),
        SizedBox(
          height: width < AppConstants.maxMobileWidth
              ? height * 0.015
              : height * 0.03,
        ),

        CustomSettingsTextField(
          labelText: "Email *",
          hintText: "Enter your Email",
          controller: emailController,
          maxLines: 1,
        ),
        SizedBox(
          height: width < AppConstants.maxMobileWidth
              ? height * 0.015
              : height * 0.03,
        ),
        CustomSettingsDropdownList(
          items: items,
          controller: listController,
          label: "Subject *",
        ),
        SizedBox(
          height: width < AppConstants.maxMobileWidth
              ? height * 0.015
              : height * 0.03,
        ),
        CustomSettingsTextField(
          labelText: "Message *",
          hintText: "",
          controller: messageController,
          maxLines: 3,
        ),
        SizedBox(
          height: width < AppConstants.maxMobileWidth
              ? height * 0.015
              : height * 0.03,
        ),
        CustomVerifyButton(
            title: "I'm not a robot",
            icon: isChecked ? FontAwesomeIcons.check : FontAwesomeIcons.robot,
            onTap: () {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return AlertDialog(
                      content: CaptchaVerify(
                        callBack: (value) {
                          setState(() {
                            isChecked = value;
                          });
                          log("_isChecked $isChecked");
                          //return _isChecked;
                        },
                      ),
                    );
                  });
              setState(() {});
            }),
        //  CustomSettingsCheckBox(isChecked: isChecked),
        SizedBox(
          height: height * 0.02,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CustomHomePageButton(onTap: () {}, title: "Submit"),
        )
      ]),
    );
  }

  Widget getDesktopContactUsContent(
      double width, double height, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: height * 0.03,
          ),
          const Icon(
            FontAwesomeIcons.phoneVolume,
            size: 120,
            color: AppColors.darkPrimary,
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Row(
            children: [
              Expanded(
                  child: CustomSettingsTextField(
                labelText: "Full Name *",
                hintText: "Enter Your Name",
                controller: nameController,
                maxLines: 1,
              )),
              SizedBox(
                width: width * 0.025,
              ),
              Expanded(
                  child: CustomSettingsTextField(
                labelText: "Email *",
                hintText: "Enter your Email",
                controller: emailController,
                maxLines: 1,
              )),
            ],
          ),
          SizedBox(
            height: width < AppConstants.maxMobileWidth
                ? height * 0.015
                : height * 0.03,
          ),
          CustomSettingsDropdownList(
            items: items,
            controller: listController,
            label: "Subject *",
          ),
          SizedBox(
            height: height * 0.03,
          ),
          CustomSettingsTextField(
            labelText: "Message *",
            hintText: "",
            controller: messageController,
            maxLines: 3,
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Row(
            children: [
              CustomVerifyButton(
                  title: "I'm not a robot",
                  icon: isChecked
                      ? FontAwesomeIcons.check
                      : FontAwesomeIcons.robot,
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return AlertDialog(
                            content: CaptchaVerify(
                              callBack: (value) {
                                setState(() {
                                  isChecked = value;
                                });
                                log("_isChecked $isChecked");
                                //return _isChecked;
                              },
                            ),
                          );
                        });
                    setState(() {});
                  }),
              //  CustomSettingsCheckBox(isChecked: isChecked),
              //  SizedBox(
              //   height: height * 0.02,
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomHomePageButton(onTap: () {}, title: "Submit"),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
