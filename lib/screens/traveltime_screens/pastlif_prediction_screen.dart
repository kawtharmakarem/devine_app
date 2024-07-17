import 'package:divinecontrol/models/traveltime_models/traveltime_details_model.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:divinecontrol/widgets/traveltime_widgets/seefuture_card.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';

class PastLifePredictionScreen extends StatelessWidget {
  const PastLifePredictionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    return Scaffold(
       backgroundColor: AppColors.lightPurple1,
      appBar: CustomAppBar(title:  'Past Life Prediction', leading: true),
      body: ListView(
        children: [
          for(final item in items)
          SizedBox(
            height: height*0.6,
            child: SeeFutureDetailsCard(travelTimeDetailsModel: item))
        ],
      ),
    );
  }
  static final List<TravelTimeDetailsModel> items=[
    TravelTimeDetailsModel(title: "Marriage",image: AppImages.marriageTraveltime, details: "In a past life, you were deeply committed to a partner who embodied qualities of wisdom and compassion. Your union was characterized by mutual respect and a shared sense of purpose. Together, you may have experienced the joy of raising a family, nurturing strong bonds with your children, and creating a harmonious household filled with love and understanding."),
    TravelTimeDetailsModel(title: "Kids",image: AppImages.kidstraveltime, details: "In a previous incarnation, you were blessed with children who brought immense joy and fulfillment into your life. Your offspring were known for their intelligence, creativity, and independent spirits. As a parent, you provided guidance and support, fostering an environment where your children could flourish and pursue their passions with confidence."),
    TravelTimeDetailsModel(title: "Occuupation",image: AppImages.occupation, details: "In your past life, you pursued a career path that allowed you to express your natural talents and make a meaningful contribution to society. Whether as a skilled artisan, respected healer, or visionary leader, you embraced your role with passion and dedication. Your occupation brought you a sense of fulfillment and purpose, leaving a lasting legacy of accomplishment and inspiration."),
    TravelTimeDetailsModel(title: "Wealth",image: AppImages.wealthtime, details: "In your past life, you pursued a career path that allowed you to express your natural talents and make a meaningful contribution to society. Whether as a skilled artisan, respected healer, or visionary leader, you embraced your role with passion and dedication. Your occupation brought you a sense of fulfillment and purpose, leaving a lasting legacy of accomplishment and inspiration."),
  ];
}