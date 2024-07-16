import 'package:divinecontrol/models/numerlogy_models/numerology_details_model.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:divinecontrol/widgets/numerology_widgets/custom_numerology_details_card.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';

class NumerologyDetailsScreen extends StatelessWidget {
  const NumerologyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
      appBar: CustomAppBar(title: 'Life Path Number', leading: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
                decoration: const ShapeDecoration(
                    shape: CircleBorder(
                        side: BorderSide(width: 1, color: AppColors.black))),
                child: CircleAvatar(
                  radius: width < AppConstants.maxMobileWidth ? 40 : 60,
                  child: Text(
                    '7',
                    style: width < AppConstants.maxMobileWidth
                        ? AppStyles.styleBold20(context).copyWith(
                            fontSize: getResponsiveFontSizeText(context,
                                fontSize: 32))
                        : AppStyles.styleBold20(context).copyWith(
                            fontSize: getResponsiveFontSizeText(context,
                                fontSize: 40)),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: width < AppConstants.maxTabletWidth ? 1 : 2,
                ),
                children: [
                  for (final detail in details)
                    CustomNumerologyDetailsCard(detailsModel: detail)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  static final List<NumerologyDetailsModel> details = [
    NumerologyDetailsModel(
        title: 'Description',
        details:
            "In a past life, you were deeply committed to a partner who embodied qualities of wisdom and compassion. Your union was characterized by mutual respect and a shared sense of purpose. Together, you may have experienced the joy of raising a family, nurturing strong bonds with your children, and creating a harmonious household filled with love and understanding.a shared sense of purpose. Together, you may have experienced the joy of raising a family, nurturing strong bonds with your children, and creating a harmonious household filled with love and understanding."),
    NumerologyDetailsModel(
        title: "Positive Sides",
        details:
            "In a previous incarnation, you were blessed with children who brought immense joy and fulfillment into your life. Your offspring were known for their intelligence, creativity, and independent spirits. As a parent, you provided guidance and support, fostering an environment where your children could flourish and pursue their passions with confidence.As a parent, you provided guidance and support, fostering an environment where your children could flourish and pursue their passions with confidence."),
    NumerologyDetailsModel(
        title: "Negative Sides",
        details:
            "In your past life, you pursued a career path that allowed you to express your natural talents and make a meaningful contribution to society. Whether as a skilled artisan, respected healer, or visionary leader, you embraced your role with passion and dedication. Your occupation brought you a sense of fulfillment and purpose, leaving a lasting legacy of accomplishment and inspiration."),
    NumerologyDetailsModel(
        title: "Profession",
        details:
            "In your past life, you pursued a career path that allowed you to express your natural talents and make a meaningful contribution to society. Whether as a skilled artisan, respected healer, or visionary leader, you embraced your role with passion and dedication. Your occupation brought you a sense of fulfillment and purpose, leaving a lasting legacy of accomplishment and inspiration."),
    NumerologyDetailsModel(
        title: "Finance",
        details:
            "In a previous incarnation, you were blessed with children who broughtimmense joy and fulfillment into your life. Your offspring were known for their intelligence, creativity, and independent spirits. As a parent, you provided guidance and support, fostering an environment where your children could flourish and pursue their passions with confidence.As a parent, you provided guidance and support, fostering an environment where your children could flourish and pursue their passions with confidence."),
    NumerologyDetailsModel(
        title: "Relationship",
        details:
            "In your past life, you pursued a career path that allowed you to express your natural talents and make a meaningful contribution to society. Whether as a skilled artisan, respected healer, or visionary leader, you embraced your role with passion and dedication. Your occupation brought you a sense of fulfillment and purpose, leaving a lasting legacy of accomplishment and inspiration."),
    NumerologyDetailsModel(
        title: "Health",
        details:
            "In your past life, you pursued a career path that allowed you to express your natural talents and make a meaningful contribution to society. Whether as a skilled artisan, respected healer, or visionary leader, you embraced your role with passion and dedication. Your occupation brought you a sense of fulfillment and purpose, leaving a lasting legacy of accomplishment and inspiration.")
  ];
}
