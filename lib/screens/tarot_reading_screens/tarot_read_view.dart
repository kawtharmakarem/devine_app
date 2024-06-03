import 'package:divinecontrol/widgets/tarotreading_widgets/tarot_desktop_layout.dart';
import 'package:divinecontrol/widgets/tarotreading_widgets/tarot_mobile_layout.dart';
import 'package:divinecontrol/widgets/tarotreading_widgets/tarot_tablet_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';
import '../../utils/tarot_constants.dart';
import '../../utils/tarot_adaptive_layout.dart';
import '../../widgets/tarotreading_widgets/custom_drawer.dart';


class TarotReadView extends StatefulWidget {
  const TarotReadView({super.key});

  @override
  State<TarotReadView> createState() => _TarotReadViewState();
}

class _TarotReadViewState extends State<TarotReadView> {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        key: scaffoldState,
        appBar: width < TarotAppConstants.mobileMaxWidth ? getAppBar() : null,
        drawer:
            width < TarotAppConstants.mobileMaxWidth ? const CustomDrawer() : null,
        body: TarotAdaptiveLayout(
            mobileLayout: (context) => const TarotMobileLayout(),
            tabletLayout: (context) => const TarotTabletLayout(),
            desktopLayout: (context) => const TarotDesktopLayout()),
      ),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      title: Text(
        'TarotReading',
        style: AppStyles.styleBold24(context).copyWith(color: AppColors.purple),
      ),
      backgroundColor: AppColors.lightPurple2,
      leading: IconButton(
          onPressed: () {
            scaffoldState.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: AppColors.purple,
            size: 30,
          )),
      actions: [
        SvgPicture.asset(
          AppImages.bell,
        ),
        SvgPicture.asset(
          AppImages.profile,
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}
