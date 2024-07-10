import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:divinecontrol/widgets/kundli_widgets/custom_kundli_result_card.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class RemediesDetailsScreen extends StatelessWidget {
  const RemediesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.lightPurple1,
    appBar: CustomAppBar(title: "Results", leading: true),
          body:  Padding(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              children: [
                Expanded(child: CustomKundleResultCard(title: "Sadesati", details: "Remedies details")),
              ],
            ),
          ),
          );  }
}