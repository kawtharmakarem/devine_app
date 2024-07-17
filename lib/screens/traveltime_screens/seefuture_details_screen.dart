import 'package:divinecontrol/models/traveltime_models/traveltime_details_model.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:divinecontrol/widgets/traveltime_widgets/seefuture_card.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class SeeFutureDetailsScreen extends StatelessWidget {
  const SeeFutureDetailsScreen({super.key, this.dateTime});
  final DateTime? dateTime;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
      appBar: CustomAppBar(title:  'See Your Future', leading: true),
      body: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: SizedBox(
            height: height * 0.7,
            child: SeeFutureDetailsCard(
              travelTimeDetailsModel: TravelTimeDetailsModel(
                  title: "Results",
                  details:
                      "You are usually a very practical and down-to-Earth person, but today you may be more inclined than usual toward mysticism. Spiritual matters seem extremely appealing, and you could find yourself gravitating toward metaphysical bookstores or seeking discussions with people who are well versed in such matters. You also find your imagination working overtime. Indulge in a few flights of fancy, Gemini. We all need to escape from time to time!"),
            )),
      ),
    );
  }
}
