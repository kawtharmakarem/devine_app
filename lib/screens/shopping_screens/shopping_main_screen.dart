import 'package:divinecontrol/models/shopping_models/shopping_model.dart';
import 'package:divinecontrol/screens/main_screens/main_drawer.dart';
import 'package:divinecontrol/widgets/shopping_widgets/shopping_book.dart';
import 'package:divinecontrol/widgets/shopping_widgets/shopping_custom_card.dart';
import 'package:divinecontrol/widgets/shopping_widgets/shopping_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';
import '../../widgets/tarotreading_widgets/custom_drawer.dart';

class ShoppingMainPage extends StatefulWidget {
  const ShoppingMainPage({super.key});

  @override
  State<ShoppingMainPage> createState() => _ShoppingMainPageState();
  static _ShoppingMainPageState? of(BuildContext context) =>
      context.findAncestorStateOfType<_ShoppingMainPageState>();
}

class _ShoppingMainPageState extends State<ShoppingMainPage> {
  int _index = 0;
  set index(int index) => setState(() {
        _index = index;
      });

  final List<ShoppingDataModel> items = [
    ShoppingDataModel(
        image: AppImages.durga,
        title: "Durga Pooja",
        value: 5100,
        shoppingDetailsModel: details[0]),
    ShoppingDataModel(
        image: AppImages.shani,
        title: "Gopal Pooja",
        value: 5100,
        shoppingDetailsModel: details[1]),
    ShoppingDataModel(
        image: AppImages.krishna,
        title: "Vastu Pooja",
        value: 5100,
        shoppingDetailsModel: details[2]),
    ShoppingDataModel(
        image: AppImages.plant,
        title: "Chandra Pooja",
        value: 5100,
        shoppingDetailsModel: details[3]),
    ShoppingDataModel(
        image: AppImages.durga,
        title: "Mahalaxmhi Pooja",
        value: 5100,
        shoppingDetailsModel: details[4]),
    ShoppingDataModel(
        image: AppImages.shani,
        title: "Mrityunjay Pooja",
        value: 5100,
        shoppingDetailsModel: details[5]),
    ShoppingDataModel(
        image: AppImages.krishna,
        title: "Surya Pooja",
        value: 5100,
        shoppingDetailsModel: details[6]),
    ShoppingDataModel(
        image: AppImages.plant,
        title: "Saraswati Pooja",
        value: 5100,
        shoppingDetailsModel: details[7]),
    ShoppingDataModel(
        image: AppImages.durga,
        title: "Kaali Pooja",
        value: 5100,
        shoppingDetailsModel: details[8]),
    ShoppingDataModel(
        image: AppImages.shani,
        title: "Bhagwat Pooja",
        value: 5100,
        shoppingDetailsModel: details[9]),
    ShoppingDataModel(
        image: AppImages.krishna,
        title: "Navgrah Pooja",
        value: 5100,
        shoppingDetailsModel: details[10]),
    ShoppingDataModel(
        image: AppImages.plant,
        title: "Rahu Pooja",
        value: 5100,
        shoppingDetailsModel: details[11]),
    ShoppingDataModel(
        image: AppImages.durga,
        title: "Ketu Pooja",
        value: 5100,
        shoppingDetailsModel: details[12]),
    ShoppingDataModel(
        image: AppImages.shani,
        title: "Mangal Pooja",
        value: 5100,
        shoppingDetailsModel: details[13]),
    ShoppingDataModel(
        image: AppImages.krishna,
        title: "Rudrabhishek Pooja",
        value: 5100,
        shoppingDetailsModel: details[14]),
    ShoppingDataModel(
        image: AppImages.plant,
        title: "Gath Bandhan Pooja",
        value: 5100,
        shoppingDetailsModel: details[15]),
    ShoppingDataModel(
        image: AppImages.durga,
        title: "Satya Narayan Pooja",
        value: 5100,
        shoppingDetailsModel: details[16]),
    ShoppingDataModel(
        image: AppImages.shani,
        title: "Brihaspati Pooja",
        value: 5100,
        shoppingDetailsModel: details[17]),
    ShoppingDataModel(
        image: AppImages.krishna,
        title: "Nakshatra Pooja",
        value: 5100,
        shoppingDetailsModel: details[18]),
    ShoppingDataModel(
        image: AppImages.plant,
        title: "Pitra Dosh Pooja",
        value: 5100,
        shoppingDetailsModel: details[19]),
    ShoppingDataModel(
        image: AppImages.plant,
        title: "Manglik Pooja",
        value: 5100,
        shoppingDetailsModel: details[20]),
  ];

GlobalKey<ScaffoldState> key=GlobalKey();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        key: key,
          backgroundColor: AppColors.lightPurple1,
          appBar:width<AppConstants.maxTabletWidth? getAppBar(width, context):null,
          drawer: width<AppConstants.maxTabletWidth?const MainDrawer() :null,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: width < AppConstants.maxMobileWidth
                ? getMobileMainContent(width)
                : width < AppConstants.maxTabletWidth
                    ? getTabletMainContent(width)
                    : getDesktopMainContent(width),
          )),
    );
  }

  AppBar getAppBar(double width, BuildContext context) {
    return AppBar(
        title: Text(
          'Pooja',
          style: width < AppConstants.maxMobileWidth
              ? AppStyles.styleBold24(context)
                  .copyWith(color: AppColors.darkPrimary)
              : AppStyles.styleBold24(context).copyWith(
                  color: AppColors.darkPrimary,
                  fontSize: getResponsiveFontSizeText(context, fontSize: 40)),
        ),
        backgroundColor: AppColors.lightPurple1,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppImages.leftArrow),
        ),
      );
  }

  Container getMobileMainContent(double width) {
    return Container(
      padding: const EdgeInsets.only(top: 15, right: 5, left: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomShoppingToggleButton(callBack: (val) {
            setState(() {
              _index = val;
            });
            return _index;
          }),
          const SizedBox(
            height: 20,
          ),
          _index == 0
              ? Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.62,
                              crossAxisCount: 2,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5),
                      itemCount: items.length,
                      itemBuilder: (context, i) {
                        return ShoppingCustomCard(
                            onTap: () {}, shoppingModel: items[i]);
                      }),
                )
              : const ShoppingBookWidget()
        ],
      ),
    );
  }

  Container getTabletMainContent(double width) {
    return Container(
      padding: const EdgeInsets.only(top: 15, right: 5, left: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomShoppingToggleButton(callBack: (val) {
            setState(() {
              _index = val;
            });
            return _index;
          }),
          const SizedBox(
            height: 20,
          ),
          _index == 0
              ? Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.62,
                              crossAxisCount: 3,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15),
                      itemCount: items.length,
                      itemBuilder: (context, i) {
                        return ShoppingCustomCard(
                            onTap: () {}, shoppingModel: items[i]);
                      }),
                )
              : const ShoppingBookWidget()
        ],
      ),
    );
  }

  Widget getDesktopMainContent(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomDrawer(),
        const SizedBox(height: 20,),
        CustomShoppingToggleButton(callBack: (val) {
          setState(() {
            _index = val;
          });
          return _index;
        }),
        const SizedBox(
          height: 20,
        ),
        _index == 0
            ? Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.8,
                            crossAxisCount: 4,
                            mainAxisSpacing: 30,
                            crossAxisSpacing: 30),
                    itemCount: items.length,
                    itemBuilder: (context, i) {
                      return ShoppingCustomCard(
                          onTap: () {}, shoppingModel: items[i]);
                    }),
              )
            : const ShoppingBookWidget()
      ],
    );
  }
}

typedef int IntCallBack(int value);

class CustomShoppingToggleButton extends StatefulWidget {
  CustomShoppingToggleButton({super.key, required this.callBack});
  final IntCallBack callBack;

  @override
  State<CustomShoppingToggleButton> createState() =>
      _CustomShoppingToggleButtonState();
}

class _CustomShoppingToggleButtonState
    extends State<CustomShoppingToggleButton> {
  List<bool> isSelected = [true, false];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadiusDirectional.circular(15)),
      child: ToggleButtons(
        isSelected: isSelected,
        selectedColor: AppColors.white,

        color: Colors.black.withOpacity(0.7),
        //fillColor: AppColors.black,
        renderBorder: true,
        borderRadius: BorderRadius.circular(16),
        borderWidth: 3,
        //splashColor: AppColors.lightPurple2,

        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width / 40, vertical: width / 80),
            child: Text(
              'Pooga',
              style: isSelected[0]
                  ? TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                      fontSize: getResponsiveFontSizeText(context,
                          fontSize:
                              width < AppConstants.maxMobileWidth ? 20 : 32))
                  : TextStyle(
                      color: AppColors.black,
                      fontSize: getResponsiveFontSizeText(context,
                          fontSize:
                              width < AppConstants.maxMobileWidth ? 20 : 32)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width / 40, vertical: width / 80),
            child: Text(
              'Pooja Booked',
              style: isSelected[1]
                  ? TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                      fontSize: getResponsiveFontSizeText(context,
                          fontSize:
                              width < AppConstants.maxMobileWidth ? 20 : 32))
                  : TextStyle(
                      color: AppColors.black,
                      fontSize: getResponsiveFontSizeText(context,
                          fontSize:
                              width < AppConstants.maxMobileWidth ? 20 : 32)),
            ),
          ),
        ],
        onPressed: (newIndex) {
          setState(() {
            for (int i = 0; i < isSelected.length; i++) {
              if (i == newIndex) {
                isSelected[i] = true;
                index = i;
              } else {
                isSelected[i] = false;
              }

              widget.callBack(index);
              ShoppingMainPage.of(context)!.index = index;
            }
          });
        },
      ),
    );
  }
}




//  return SafeArea(
//       child: Scaffold(
//         key: scaffoldState,
//         appBar: width < TarotAppConstants.mobileMaxWidth ? getAppBar() : null,
//         drawer:
//             width < TarotAppConstants.mobileMaxWidth ? const CustomDrawer() : null,
//         body: TarotAdaptiveLayout(
//             mobileLayout: (context) => const TarotMobileLayout(),
//             tabletLayout: (context) => const TarotTabletLayout(),
//             desktopLayout: (context) => const TarotDesktopLayout()),
//       ),
//     );
//   }

//   AppBar getAppBar() {
//     return AppBar(
//       title: Text(
//         'TarotReading',
//         style: AppStyles.styleBold24(context).copyWith(color: AppColors.purple),
//       ),
//       backgroundColor: AppColors.lightPurple2,
//       leading: IconButton(
//           onPressed: () {
//             scaffoldState.currentState!.openDrawer();
//           },
//           icon: const Icon(
//             Icons.menu,
//             color: AppColors.purple,
//             size: 30,
//           )),
//       actions: [
//         SvgPicture.asset(
//           AppImages.bell,
//         ),
//         SvgPicture.asset(
//           AppImages.profile,
//         ),
//         const SizedBox(
//           width: 10,
//         )
//       ],
//     );
//   }
// }
