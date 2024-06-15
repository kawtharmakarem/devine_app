import 'package:divinecontrol/models/shopping_models/shopping_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';
import '../../widgets/shopping_widgets/custom_showdetails_card.dart';

class ShoppingDetailsScreen extends StatelessWidget {
  const ShoppingDetailsScreen({
    super.key,
    required this.shoppingDataModel,
  });
  final ShoppingDataModel shoppingDataModel;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
      appBar: AppBar(
        title: Text(
          shoppingDataModel.title,
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        Text(shoppingDataModel.shoppingDetailsModel.description,
                            style: width < AppConstants.maxMobileWidth
                                ? AppStyles.styleRegular20(context)
                                : width < AppConstants.maxTabletWidth
                                    ? AppStyles.styleRegular20(context)
                                        .copyWith(
                                            fontSize: getResponsiveFontSizeText(
                                                context,
                                                fontSize: 28))
                                    : AppStyles.styleRegular20(context)
                                        .copyWith(
                                            fontSize: getResponsiveFontSizeText(
                                                context,
                                                fontSize: 32))),
                                                const SizedBox(height: 20,),
                        ElevatedButton(onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.black,
                          foregroundColor: AppColors.white,
                          padding: EdgeInsets.symmetric(horizontal: width/20,vertical:width<AppConstants.maxTabletWidth? width/30:width/50 ),
                          textStyle: AppStyles.styleBold24(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 20 :28))
                        ),
                         child: Text('Book Now'))
                      ],
                    ),
                  ),
                ],
              ),
              CustomShowDetailsCard(
                mainTitle: "What are the Benefits?",
                text0: shoppingDataModel.shoppingDetailsModel.benefits[0],
                text2: shoppingDataModel.shoppingDetailsModel.benefits[1],
                text3: shoppingDataModel.shoppingDetailsModel.benefits[2],
              ),
              const Divider(
                endIndent: 20,
                indent: 20,
                thickness: 2,
              ),
              CustomShowDetailsCard(
                  text0: shoppingDataModel.shoppingDetailsModel.howHappen[0],
                  text2: shoppingDataModel.shoppingDetailsModel.howHappen[1],
                  text3: shoppingDataModel.shoppingDetailsModel.howHappen[2],
                  mainTitle: "How will it happen?"),
              const Divider(
                endIndent: 20,
                indent: 20,
                thickness: 2,
              ),
              CustomShowDetailsCard(
                  text0: shoppingDataModel.shoppingDetailsModel.about[0],
                  text2: shoppingDataModel.shoppingDetailsModel.about[1],
                  text3: shoppingDataModel.shoppingDetailsModel.about[2],
                  mainTitle: "About Lord ${shoppingDataModel.title}"),
              const Divider(
                endIndent: 20,
                indent: 20,
                thickness: 2,
              ),
              CustomShowDetailsCard(
                  text0: shoppingDataModel
                      .shoppingDetailsModel.getMaximumBenefits[0],
                  text2: shoppingDataModel
                      .shoppingDetailsModel.getMaximumBenefits[1],
                  text3: shoppingDataModel
                      .shoppingDetailsModel.getMaximumBenefits[2],
                  mainTitle:
                      "What should you do after pooja to get maximum benefits?"),
              const Divider(
                endIndent: 20,
                indent: 20,
                thickness: 2,
              ),
              const CustomShowDetailsCard(
                  text0:
                      "Convenience, authenticity, and personalized guidance.",
                  text2: "Access to experienced priests and experts.",
                  text3: "Seamless access to authentic rituals.",
                  text4:
                      "Ensures desired outcomes with personalized assistance.",
                  mainTitle: "Why book with divine connection?")
            ],
          ),
        ),
      ),
    );
  }
}
