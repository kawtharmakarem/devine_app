import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/tarotreading_models/drawer_title_model.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';
import '../../utils/tarot_constants.dart';
import 'choose_lang.dart';
import 'drawer_custom_title.dart';
import 'login_register_widet.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  List<DrawerTitleModel> titles = [];
  int activeIndex = 0;
  @override
  void initState() {
    titles = getTitles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return width < TarotAppConstants.mobileMaxWidth
        ? getMobileCard(width)
        : width < TarotAppConstants.tabletMaxWidth
            ? getTabletCard()
            : getDesktopCard();
  }

  Card getDesktopCard() {
    return Card(
      elevation: 4,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Row(
        children: [
          Image.asset(
            AppImages.logo,
            // width: 117,
            // height: 50,
          ), //todo
          ...List.generate(
              titles.length,
              (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                    child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: DrawerCustomTitle(
                          drawerTitle: titles[index],
                          isActive: activeIndex == index,
                        )),
                  )),

          const LoginAndRegister(),
          const SizedBox(
            width: 5,
          ),
          const Expanded(child: FittedBox(child: ChooseLang())),
          SvgPicture.asset(
            AppImages.bell,
            width: 30,
          ),
          SvgPicture.asset(
            AppImages.profile,
            height: 30,
          ),
        ],
      ),
    );
  }

  Card getTabletCard() {
    return Card(
      elevation: 4,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Row(
        children: [
          Image.asset(
            AppImages.logo,
            // width: 117,
            // height: 50,
          ), //todo
          ...List.generate(
              titles.length,
              (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                    child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: DrawerCustomTitle(
                          drawerTitle: titles[index],
                          isActive: activeIndex == index,
                        )),
                  )),

          const LoginAndRegister(),
          const SizedBox(
            width: 5,
          ),
          const Expanded(child: FittedBox(child: ChooseLang())),
          SvgPicture.asset(
            AppImages.bell,
            width: 18,
          ),
          SvgPicture.asset(
            AppImages.profile,
            height: 18,
          ),
        ],
      ),
    );
  }

  Card getMobileCard(double width) {
    return Card(
      elevation: 4,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AppImages.logo),
          SizedBox(
            width: width * 0.8,
            child: ListView(
              shrinkWrap: true,
              children: [
                ...List.generate(
                    titles.length,
                    (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              activeIndex = index;
                            });
                          },
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, bottom: 20, top: 20, right: 5),
                              child: DrawerCustomTitle(
                                drawerTitle: titles[index],
                                isActive: activeIndex == index,
                              )),
                        )),
              ],
            ),
          ),
          Container(
              width: width * 0.8,
              padding: const EdgeInsets.only(left: 10),
              child: const LoginAndRegister()),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: width * 0.8,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'ChooseLanguage',
                    style: AppStyles.styleRegular28(context),
                  ),
                ),
                SizedBox(
                    width: width * 0.25, height: 50, child: const ChooseLang()),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<DrawerTitleModel> getTitles() => [
        DrawerTitleModel(title: "Today's Luck", image: AppImages.todayluck),
        DrawerTitleModel(title: "Shopping", image: AppImages.cart),
        DrawerTitleModel(
            title: "Find Your Divine Connection..", image: AppImages.search),
      ];
}
