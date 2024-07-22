import 'package:divinecontrol/screens/settings/app_settings_page.dart';
import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import '../../utils/app_constants.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});
  static const keyNews = 'key-news';
  static const keyActivity = 'key-activity';
  static const keyLetter = "key-letter";
  static const keyUpdates = 'key-updates';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return SimpleSettingsTile(
      title: 'Notifications',
      titleTextStyle: AppStyles.styleRegular20(context).copyWith(
          fontSize: getResponsiveFontSizeText(context,
              fontSize: width < AppConstants.maxMobileWidth ? 20 : 28)),
      subtitle: 'NewsLetter,AppUpdates',
      subtitleTextStyle: AppStyles.styleRegular20(context).copyWith(
          fontSize: getResponsiveFontSizeText(context,
              fontSize: width < AppConstants.maxMobileWidth ? 14 : 20)),
      showDivider: false,
      leading: const IconWidget(
          color: Colors.redAccent, icon: Icons.notification_add),
      child:
          SettingsScreen(
            title: "Notifications", hasAppBar: false, children: [
        const CustomBackButton(
          title: 'Notifications',
        ),
        const SizedBox(
          height: 32,
        ),
        buildNews(context, width),
        SizedBox(
          height: width < AppConstants.maxMobileWidth
              ? height * 0.012
              : height * 0.025,
        ),
        buildActivity(context, width),
        SizedBox(
          height: width < AppConstants.maxMobileWidth
              ? height * 0.012
              : height * 0.025,
        ),
        buildNewsLetter(context, width),
        SizedBox(
          height: width < AppConstants.maxMobileWidth
              ? height * 0.012
              : height * 0.025,
        ),
        buildAppUpdates(context, width),
      ]),
    );
  }

  Widget buildNews(BuildContext context, double width) => SwitchSettingsTile(
    
        title: 'News For you',
        settingKey: keyNews,
        subtitle: '',
        titleTextStyle: AppStyles.styleRegular20(context).copyWith(
            fontSize: getResponsiveFontSizeText(context,
                fontSize: width < AppConstants.maxMobileWidth ? 20 : 28)),
        showDivider: false,
        leading: const IconWidget(color: Colors.blue, icon: Icons.message),
        onChange: (val) {},
      );

  Widget buildActivity(BuildContext context, double width) =>
      SwitchSettingsTile(
        title: 'Account Activity',
        settingKey: keyActivity,
        titleTextStyle: AppStyles.styleRegular20(context).copyWith(
            fontSize: getResponsiveFontSizeText(context,
                fontSize: width < AppConstants.maxMobileWidth ? 20 : 28)),
        showDivider: false,
        leading: const IconWidget(color: Colors.orange, icon: Icons.person),
      );

  Widget buildAppUpdates(BuildContext context, double width) =>
      SwitchSettingsTile(
        title: 'NewsLetter',
        settingKey: keyLetter,
        showDivider: false,
        titleTextStyle: AppStyles.styleRegular20(context).copyWith(
            fontSize: getResponsiveFontSizeText(context,
                fontSize: width < AppConstants.maxMobileWidth ? 20 : 28)),
        leading:
            const IconWidget(color: Colors.redAccent, icon: Icons.text_snippet),
      );

  Widget buildNewsLetter(BuildContext context, double width) =>
      SwitchSettingsTile(
        title: 'AppUpdates',
        settingKey: keyUpdates,
        showDivider: false,
        titleTextStyle: AppStyles.styleRegular20(context).copyWith(
            fontSize: getResponsiveFontSizeText(context,
                fontSize: width < AppConstants.maxMobileWidth ? 20 : 28)),
        leading:
            const IconWidget(color: Colors.greenAccent, icon: Icons.update),
      );
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              size: width < AppConstants.maxMobileWidth ? 40 : 60,
            )),
        Text(
          title,
          style: width < AppConstants.maxTabletWidth
              ? AppStyles.styleBold24(context)
                  .copyWith(color: AppColors.darkPrimary)
              : AppStyles.styleBold24(context).copyWith(
                  color: AppColors.darkPrimary,
                  fontSize: getResponsiveFontSizeText(context, fontSize: 32)),
        ),
        const SizedBox()
      ],
    );
  }
}
