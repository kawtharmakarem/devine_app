import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class MatchMarktingDetailsScreen extends StatelessWidget {
  const MatchMarktingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
      appBar: AppBar(
        title: Text(
          "Match Making",
          style: width < AppConstants.maxMobileWidth
              ? AppStyles.styleBold24(context)
                  .copyWith(color: AppColors.darkPrimary)
              : AppStyles.styleBold24(context).copyWith(
                  color: AppColors.darkPrimary,
                  fontSize: getResponsiveFontSizeText(context, fontSize: 32)),
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
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Divider(
                indent: 20,
                endIndent: 20,
                color: AppColors.black.withOpacity(0.7),
                thickness: 2,
              ),
              Text(
                "Compatibility Score",
                style: width < AppConstants.maxMobileWidth
                    ? AppStyles.styleBold24(context)
                    : AppStyles.styleBold24(context).copyWith(
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize: 32)),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(AppImages.score),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '1',
                    style: AppStyles.styleBold24(context).copyWith(
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize: 40)),
                  ),
                  Text(
                    '/',
                    style: width < AppConstants.maxMobileWidth
                        ? AppStyles.styleBold24(context)
                        : AppStyles.styleBold24(context).copyWith(
                            fontSize: getResponsiveFontSizeText(context,
                                fontSize: 36)),
                  ),
                  Text(
                    "36",
                    style: AppStyles.styleBold24(context),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Text(
                "Try Changing The Number Here:",
                style: width < AppConstants.maxMobileWidth
                    ? AppStyles.styleBold24(context)
                    : AppStyles.styleBold24(context).copyWith(
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize: 32)),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(color: AppColors.white),
                child: Text(
                  "1",
                  style: width < AppConstants.maxMobileWidth
                      ? AppStyles.styleBold24(context)
                      : AppStyles.styleBold24(context).copyWith(
                          fontSize:
                              getResponsiveFontSizeText(context, fontSize: 40)),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Divider(
                indent: 20,
                endIndent: 20,
                color: AppColors.black.withOpacity(0.7),
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Details',
                style: width < AppConstants.maxMobileWidth
                    ? AppStyles.styleBold24(context).copyWith(
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize: 32))
                    : AppStyles.styleBold24(context).copyWith(
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize: 40)),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Not A Good Match",
                style: AppStyles.styleRegular20(context).copyWith(
                    color: AppColors.darkPrimary,
                    fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 22:30)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
