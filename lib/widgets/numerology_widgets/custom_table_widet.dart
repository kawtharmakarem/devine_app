import 'package:divinecontrol/models/numerlogy_models/numer_table_model.dart';
import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTableWidget extends StatelessWidget {
  const CustomTableWidget({super.key, required this.numerologyTableModel});
  final NumerologyTableModel numerologyTableModel;
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    return ListTile(
      leading: Image.asset(
        numerologyTableModel.image,
        fit: BoxFit.fill,
      ),
      title: Text(
        numerologyTableModel.title,
        style:width<AppConstants.maxMobileWidth? AppStyles.styleMedium16(context).copyWith(
            color: AppColors.black,
            fontSize: getResponsiveFontSizeText(context, fontSize: 24)):AppStyles.styleMedium16(context).copyWith(
                    color: AppColors.black,
                    fontSize: getResponsiveFontSizeText(context, fontSize: 32)),
      ),
      subtitle: Text(
        numerologyTableModel.subtitle,
        style:width<AppConstants.maxMobileWidth? AppStyles.styleBold20(context).copyWith(
            fontSize: getResponsiveFontSizeText(context, fontSize: 20)): AppStyles.styleBold20(context).copyWith(
            fontSize: getResponsiveFontSizeText(context, fontSize: 26)),
      ),
    );
  }
}
