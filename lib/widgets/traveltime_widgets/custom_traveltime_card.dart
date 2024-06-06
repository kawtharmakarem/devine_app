import 'package:divinecontrol/models/facereading_models/facereading_card_model.dart';
import 'package:divinecontrol/models/traveltime_models/traveltime_model.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class CustomTravelTimeCard extends StatelessWidget {
  const CustomTravelTimeCard(
      {super.key,
      required this.onTap, required this.travelTimeModel});
      final TravelTimeModel travelTimeModel;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Container(
                width: double.infinity,
                child: Image.asset(
                 travelTimeModel.image,
                  fit: BoxFit.fill,
                )),
            const SizedBox(
              height: 10,
            ),
            Text(
             travelTimeModel.title,
              style: width < AppConstants.maxMobileWidth
                  ? AppStyles.styleBold24(context).copyWith(
                      fontSize:
                          getResponsiveFontSizeText(context, fontSize: 22))
                  : AppStyles.styleBold24(context)
                      .copyWith(fontSize: getResponsiveFontSizeText(context, fontSize: 40)),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
