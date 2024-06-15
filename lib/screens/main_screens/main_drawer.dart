import 'package:divinecontrol/screens/dream_meaning_screens/dream_interpretation_view.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/widgets/main_widgets/main_custom_title.dart';
import 'package:divinecontrol/widgets/main_widgets/main_login_register.dart';
import 'package:divinecontrol/screens/shopping_screens/shopping_main_screen.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../models/tarotreading_models/drawer_title_model.dart';
import '../../widgets/tarotreading_widgets/choose_lang.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  List<DrawerTitleModel> titles = [];
  List<String> langs = ["English", "arabic"];
  TextEditingController listController = TextEditingController();
  int activeIndex = 2;
  @override
  void initState() {
    titles = getTitles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return width < AppConstants.maxMobileWidth
        ? getMobileDrawer(width, context)
        : 
             getTabletDrawer(width, context);
            
  }

  Drawer getMobileDrawer(double width, BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              child: SizedBox(
                  width: width * 0.9,
                  child: Image.asset(
                    AppImages.logo,
                    fit: BoxFit.fill,
                  ))),
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
                            left: 5, bottom: 10, top: 10, right: 5),
                        child: MainCustomTitle(
                          drawerTitle: titles[index],
                          isActive: activeIndex == index,
                        )),
                  )),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 5),
            child: MainLoginAndRegister(),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  'ChooseLanguage',
                  style: AppStyles.styleRegular20(context),
                ),
              ),
              SizedBox(
                  width: width * 0.25, height: 50, child: const ChooseLang()),
            ],
          )
        ],
      ),
    );
  }

  Drawer getTabletDrawer(double width, BuildContext context) {
    return Drawer(
      width: width*0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
              child: Image.asset(
                AppImages.logo,
                fit: BoxFit.fill,
              )),
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
                            left: 5, bottom: 10, top: 10, right: 5),
                        child: MainCustomTitle(
                          drawerTitle: titles[index],
                          isActive: activeIndex == index,
                        )),
                  )),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 5),
            child: MainLoginAndRegister(),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  'ChooseLanguage',
                  style:width<AppConstants.maxMobileWidth? AppStyles.styleRegular20(context):AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 28)),
                ),
              ),
              SizedBox(
                  width: width * 0.25, height: 50, child: const ChooseLang()),
            ],
          )
        ],
      ),
    );
  }

  

  List<DrawerTitleModel> getTitles() => [
        DrawerTitleModel(
            title: "Today's Luck",
            image: AppImages.todayluck,
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Container()));
            }),
        DrawerTitleModel(
            title: "Shopping",
            image: AppImages.cart,
            onTap: () {
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ShoppingMainPage()));
              });
            }),
        DrawerTitleModel(
            title: "Find Divine Connection",
            image: AppImages.search,
            onTap: () {
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DreamInterpretationView()));
              });
            }),
      ];
}
