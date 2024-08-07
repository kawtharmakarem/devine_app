import 'package:divinecontrol/models/shopping_models/shopping_model.dart';
import 'package:divinecontrol/widgets/shopping_widgets/shopping_book.dart';
import 'package:divinecontrol/widgets/shopping_widgets/shopping_custom_card.dart';
import 'package:divinecontrol/widgets/shopping_widgets/shopping_lists.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

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
        value: 500,
        shoppingDetailsModel: details[0]),
    ShoppingDataModel(
        image: AppImages.gopal,
        title: "Gopal Pooja",
        value: 500,
        shoppingDetailsModel: details[1]),
    ShoppingDataModel(
        image: AppImages.vastu,
        title: "Vastu Pooja",
        value: 500,
        shoppingDetailsModel: details[2]),
    ShoppingDataModel(
        image: AppImages.chandra,
        title: "Chandra Pooja",
        value: 500,
        shoppingDetailsModel: details[3]),
    ShoppingDataModel(
        image: AppImages.mahalakshmi,
        title: "Mahalaxmhi Pooja",
        value: 500,
        shoppingDetailsModel: details[4]),
    ShoppingDataModel(
        image: AppImages.mritynjaya,
        title: "Mrityunjay Pooja",
        value: 500,
        shoppingDetailsModel: details[5]),
    ShoppingDataModel(
        image: AppImages.surya,
        title: "Surya Pooja",
        value: 500,
        shoppingDetailsModel: details[6]),
    ShoppingDataModel(
        image: AppImages.saraswati,
        title: "Saraswati Pooja",
        value: 500,
        shoppingDetailsModel: details[7]),
    ShoppingDataModel(
        image: AppImages.kaali,
        title: "Kaali Pooja",
        value: 500,
        shoppingDetailsModel: details[8]),
    ShoppingDataModel(
        image: AppImages.bhaghwatGeeta,
        title: "Bhagwat Pooja",
        value: 500,
        shoppingDetailsModel: details[9]),
    ShoppingDataModel(
        image: AppImages.navgrah,
        title: "Navgrah Pooja",
        value: 500,
        shoppingDetailsModel: details[10]),
    ShoppingDataModel(
        image: AppImages.rahu,
        title: "Rahu Pooja",
        value: 500,
        shoppingDetailsModel: details[11]),
    ShoppingDataModel(
        image: AppImages.ketu,
        title: "Ketu Pooja",
        value: 500,
        shoppingDetailsModel: details[12]),
    ShoppingDataModel(
        image: AppImages.mangal,
        title: "Mangal Pooja",
        value: 500,
        shoppingDetailsModel: details[13]),
    ShoppingDataModel(
        image: AppImages.rudraAbhishek,
        title: "Rudrabhishek Pooja",
        value: 500,
        shoppingDetailsModel: details[14]),
    ShoppingDataModel(
        image: AppImages.gathBandhan,
        title: "Gath Bandhan Pooja",
        value: 500,
        shoppingDetailsModel: details[15]),
    ShoppingDataModel(
        image: AppImages.satyaNarayan,
        title: "Satya Narayan Pooja",
        value: 500,
        shoppingDetailsModel: details[16]),
    ShoppingDataModel(
        image: AppImages.brihaspati,
        title: "Brihaspati Pooja",
        value: 500,
        shoppingDetailsModel: details[17]),
    ShoppingDataModel(
        image: AppImages.nakshatra,
        title: "Nakshatra Pooja",
        value: 500,
        shoppingDetailsModel: details[18]),
    ShoppingDataModel(
        image: AppImages.pitraDosh,
        title: "Pitra Dosh Pooja",
        value: 500,
        shoppingDetailsModel: details[19]),
    ShoppingDataModel(
        image: AppImages.mangalDosh,
        title: "Manglik Pooja",
        value: 500,
        shoppingDetailsModel: details[20]),
         ShoppingDataModel(
        image: AppImages.finalImage,
        title: "Learn Astrology",
        value: 2000,
        shoppingDetailsModel:details[21]),
         
        
  ];
  final List<ShoppingDataModel> learn=[
    ShoppingDataModel(
        image: AppImages.finalImage,
        title: "Learn Astrology",
        value: 2000,
        shoppingDetailsModel:learnDetails[0]),
  ];

GlobalKey<ScaffoldState> key=GlobalKey();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        key: key,
          backgroundColor: AppColors.lightPurple1,
         
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

  

  Container getMobileMainContent(double width) {
    return Container(
      padding: const EdgeInsets.only(top: 15, right: 5, left: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: CustomShoppingToggleButton(callBack: (val) {
              setState(() {
                _index = val;
              });
              return _index;
            }),
          ),
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
          Center(
            child: CustomShoppingToggleButton(callBack: (val) {
              setState(() {
                _index = val;
              });
              return _index;
            }),
          ),
          const SizedBox(
            height: 20,
          ),
          _index == 0
              ? Expanded(
                  child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.58,
                              crossAxisCount: 3,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15),
                              children: [
                                ...List.generate(items.length, (index) => ShoppingCustomCard(onTap: (){}, shoppingModel: items[index])),
                                
                              ],
                    
                      ),
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
        const SizedBox(height: 20,),
        Center(
          child: CustomShoppingToggleButton(callBack: (val) {
            setState(() {
              _index = val;
            });
            return _index;
          }),
        ),
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




