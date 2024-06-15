import 'package:divinecontrol/models/shopping_models/shopping_model.dart';
import 'package:divinecontrol/screens/shopping_screens/shopping_details_screen.dart';
import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:divinecontrol/widgets/shopping_widgets/shopping_custom_button.dart';
import 'package:flutter/material.dart';

class ShoppingCustomCard extends StatelessWidget {
  const ShoppingCustomCard(
      {super.key, required this.onTap, required this.shoppingModel});
  final void Function() onTap;
  final ShoppingDataModel shoppingModel;
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: onTap,
      child: Card(
        
        elevation: 2,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child:width<AppConstants.maxMobileWidth?
               getMobileCustomCard(context, width):width<AppConstants.maxTabletWidth? getTabletCustomCard(context, width):getDesktopCustomCard(context, width)
      ),
    );
  }

  Column getMobileCustomCard(BuildContext context, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.maxFinite,
            height: width / 2.5,
            color: AppColors.myGray,
          ),
          SizedBox(
            width: width/4,
            height: width/4,
            child: Image.asset(
              shoppingModel.image,fit: BoxFit.fill,
            ),
          ),
        ],
      ),
     const Expanded(child: SizedBox()),
      Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Text(
          shoppingModel.title,
          style: AppStyles.styleRegular20(context),
        ),
      ),
    const  Expanded(child: SizedBox()),
      Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Text(
          'Rs. / ${shoppingModel.value}',
          style: AppStyles.styleRegular20(context)
        ),
      ),
    const  Expanded(child: SizedBox()),
      CustomShoppingButton(title: 'Book Now', onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ShoppingDetailsScreen(shoppingDataModel: shoppingModel,)));
      })
    ]);
  }

   Column getTabletCustomCard(BuildContext context, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.maxFinite,
            height: width / 4,
            color: AppColors.myGray,
          ),
          SizedBox(
            width: width/5,
            height: width/5,
            child: Image.asset(
              shoppingModel.image,fit: BoxFit.fill,
            ),
          ),
        ],
      ),
     const Expanded(child: SizedBox()),
      Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Text(
          shoppingModel.title,
          style: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 26)),
        ),
      ),
    const  Expanded(child: SizedBox()),
      Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Text(
          'Rs. / ${shoppingModel.value}',
          style: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 26))
        ),
      ),
    const  Expanded(child: SizedBox()),
      CustomShoppingButton(title: 'Book Now', onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ShoppingDetailsScreen(shoppingDataModel: shoppingModel,)));
      })
    ]);
  }

Column getDesktopCustomCard(BuildContext context, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.maxFinite,
            height: width / 6,
            color: AppColors.myGray,
          ),
          SizedBox(
            width: width/8,
            height: width/8,
            child: Image.asset(
              shoppingModel.image,fit: BoxFit.fill,
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Text(
          shoppingModel.title,
          style: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 32)),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Text(
          'Rs. / ${shoppingModel.value}',
          style: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 32))
        ),
      ),
    const  Expanded(child: SizedBox()),
      CustomShoppingButton(title: 'Book Now', onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ShoppingDetailsScreen(shoppingDataModel: shoppingModel,)));
      })
    ]);
  }

  
}
