import 'package:divinecontrol/models/shopping_models/shopping_model.dart';
import 'package:divinecontrol/screens/shopping_screens/shopping_details_screen.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:divinecontrol/widgets/shopping_widgets/shopping_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingCustomCard extends StatelessWidget {
  const ShoppingCustomCard(
      {super.key, required this.onTap, required this.shoppingModel});
  final void Function() onTap;
  final ShoppingDataModel shoppingModel;
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height=MediaQuery.of(context).size.height;
    return Card(
      
      elevation: 2,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child:width<AppConstants.maxMobileWidth?
             getMobileCustomCard(context, width,height):width<AppConstants.maxTabletWidth? getTabletCustomCard(context, width,height):
             getDesktopCustomCard(context, width,height)
    );
  }

  Widget getMobileCustomCard(BuildContext context, double width,double height) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>ShoppingDetailsScreen(shoppingDataModel: shoppingModel),transition: Transition.circularReveal,duration: const Duration(seconds: AppConstants.durationSecond));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
          width: width,
          height:height /5,
          child: FittedBox(
            child: Image.asset(
              shoppingModel.image,fit: BoxFit.fill,
            ),
          ),
        ),
       const Expanded(child: SizedBox()),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            shoppingModel.title,
            style: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 18)),
          ),
        ),
      const  Expanded(child: SizedBox()),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            'Rs.${shoppingModel.value.toStringAsFixed(0)}',
            style: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 18))
          ),
        ),
      const  Expanded(child: SizedBox()),
        CustomShoppingButton(title: 'Book Now', onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ShoppingDetailsScreen(shoppingDataModel: shoppingModel,)));
        })
      ]),
    );
  }

   Widget getTabletCustomCard(BuildContext context, double width,double height) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>ShoppingDetailsScreen(shoppingDataModel: shoppingModel),transition: Transition.zoom,duration: const Duration(seconds: AppConstants.durationSecond));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SizedBox(
           width: width,
          height:height /5.2,
          child: FittedBox(
            child: Image.asset(
              shoppingModel.image,fit: BoxFit.fill,
            ),
          ),
        ),
       const Expanded(child: SizedBox()),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            shoppingModel.title,
            style: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 22)),
          ),
        ),
      const  Expanded(child: SizedBox()),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            'Rs.${shoppingModel.value}',
            style: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 22))
          ),
        ),
      const  Expanded(child: SizedBox()),
        CustomShoppingButton(title: 'Book Now', onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ShoppingDetailsScreen(shoppingDataModel: shoppingModel,)));
        })
      ]),
    );
  }

Widget getDesktopCustomCard(BuildContext context, double width,double height) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>ShoppingDetailsScreen(shoppingDataModel: shoppingModel),transition: Transition.zoom,duration: const Duration(seconds: AppConstants.durationSecond));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SizedBox(
          width: width,
          height: width/6,
          child: FittedBox(
            child: Image.asset(
              shoppingModel.image,fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            shoppingModel.title,
            style: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 28)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            'Rs.${shoppingModel.value}',
            style: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 28))
          ),
        ),
      const  Expanded(child: SizedBox()),
        CustomShoppingButton(title: 'Book Now', onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ShoppingDetailsScreen(shoppingDataModel: shoppingModel,)));
        })
      ]),
    );
  }

  
}
