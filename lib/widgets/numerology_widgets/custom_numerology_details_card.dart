import 'package:divinecontrol/models/numerlogy_models/numerology_details_model.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class CustomNumerologyDetailsCard extends StatelessWidget {
  const CustomNumerologyDetailsCard({
    super.key,
    required this.detailsModel,
  });
  final NumerologyDetailsModel detailsModel;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return width < AppConstants.maxMobileWidth
        ? getMobileNumerologyDetailsCard(context, width)
        : width < AppConstants.maxTabletWidth
            ? getTabletNumerologyDetailsCard(context, width)
            : getDesktopNumerologyDetailsCard(context, width);
  }

  Widget getMobileNumerologyDetailsCard(BuildContext context, double width) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(detailsModel.title,
                            style: AppStyles.styleBold24(context).copyWith(
                                fontSize: getResponsiveFontSizeText(context,
                                    fontSize: 24))),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width: width / 10,
                      child: Image.asset(detailsModel.image),
                    )
                  ],
                ),
                const Divider(
                  color: AppColors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Text(detailsModel.details,
                          style: AppStyles.styleRegular20(context).copyWith(
                              fontSize: getResponsiveFontSizeText(context,
                                  fontSize: 18),
                              color: AppColors.black)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Padding getTabletNumerologyDetailsCard(BuildContext context, double width) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(detailsModel.title,
                        textAlign: TextAlign.center,
                        style: AppStyles.styleBold20(context).copyWith(
                            fontSize: getResponsiveFontSizeText(context,
                                fontSize: 30))),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: width / 10,
                    child: Image.asset(detailsModel.image),
                  )
                ],
              ),
              const Divider(
                color: AppColors.black,
                indent: 20,
                endIndent: 20,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Text(detailsModel.details,
                        style: AppStyles.styleRegular20(context).copyWith(
                            fontSize: getResponsiveFontSizeText(context,
                                fontSize: 28),
                            color: AppColors.black)),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ));
  }

  Padding getDesktopNumerologyDetailsCard(BuildContext context, double width) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(detailsModel.title,
                        textAlign: TextAlign.center,
                        style: AppStyles.styleBold20(context).copyWith(
                            fontSize: getResponsiveFontSizeText(context,
                                fontSize: 32))),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: width / 20,
                    child: Image.asset(detailsModel.image),
                  )
                ],
              ),
              const Divider(
                color: AppColors.black,
                indent: 20,
                endIndent: 20,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Text(detailsModel.details,
                        style: AppStyles.styleRegular20(context).copyWith(
                            fontSize: getResponsiveFontSizeText(context,
                                fontSize: 28),
                            color: AppColors.black)),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ));
  }
}
