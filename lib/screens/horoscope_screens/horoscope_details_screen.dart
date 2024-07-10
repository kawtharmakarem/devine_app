import 'package:divinecontrol/models/horoscope_models/horoscope_model.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:divinecontrol/widgets/horoscope_widgets/custom_horoscope_details_card.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class HoroscopeDetailsScreen extends StatelessWidget {
  const HoroscopeDetailsScreen({super.key, required this.horoscopeModel});
  final HoroscopeModel horoscopeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 backgroundColor: AppColors.lightPurple1,
      appBar: CustomAppBar(title: horoscopeModel.title, leading: true),
        body: CustomHoroscopeDetailsCard(horoscopeModel: horoscopeModel),
      );
  }
}