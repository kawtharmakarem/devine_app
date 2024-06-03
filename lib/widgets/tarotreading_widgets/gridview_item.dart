import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/tarotreading_models/gridview_item_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';
import '../../utils/tarot_constants.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem(
      {super.key, required this.itemModel, required this.onSlectedItem});
  final GridViewItemModel itemModel;
  final void Function(GridViewItemModel itemModel) onSlectedItem;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: width < TarotAppConstants.tabletMaxWidth
          ? getMobileGridViewItem(context, width)
          : getDesktopGridViewItem(context, width),
    );
  }

  InkWell getMobileGridViewItem(BuildContext context, double width) {
    return InkWell(
      onTap: () => onSlectedItem(itemModel),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: Image.asset(
                    itemModel.image,
                    fit: BoxFit.fill,
                  ))),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(itemModel.title,
                style: AppStyles.styleSemiBold24(context)
                    .copyWith(color: AppColors.black)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(itemModel.description,
                style: AppStyles.styleRegular18(context)
                    .copyWith(color: AppColors.black)),
          ),
          width < TarotAppConstants.mobileMaxWidth
              ? Container()
              : const Expanded(child: SizedBox()),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(AppImages.hand),
                    Text(
                      '${itemModel.likesNumber}',
                      style: AppStyles.styleBold24(context).copyWith(
                          color: AppColors.black,
                          fontSize: getResponsiveFontSizeTextTarot(context,
                              fontSize: 22)),
                    )
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(AppImages.eye),
                    Text(
                      '${itemModel.seeNumber}k',
                      style: AppStyles.styleBold24(context).copyWith(
                          color: AppColors.black,
                          fontSize: getResponsiveFontSizeTextTarot(context,
                              fontSize: 22)),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  InkWell getDesktopGridViewItem(BuildContext context, double width) {
    return InkWell(
      onTap: () => onSlectedItem(itemModel),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: Image.asset(
                    itemModel.image,
                    fit: BoxFit.fill,
                  ))),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(itemModel.title,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.styleSemiBold24(context).copyWith(
                    color: AppColors.black,
                    fontSize:
                        getResponsiveFontSizeTextTarot(context, fontSize: 16))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(itemModel.description,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.styleRegular16(context).copyWith(
                    color: AppColors.black,
                    fontSize:
                        getResponsiveFontSizeTextTarot(context, fontSize: 14))),
          ),
          width < TarotAppConstants.mobileMaxWidth
              ? Container()
              : const Expanded(child: SizedBox()),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(AppImages.hand),
                    Text(
                      '${itemModel.likesNumber}',
                      style: AppStyles.styleBold24(context).copyWith(
                          color: AppColors.black,
                          fontSize: getResponsiveFontSizeTextTarot(context,
                              fontSize: 14)),
                    )
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(AppImages.eye),
                    Text(
                      '${itemModel.seeNumber}k',
                      style: AppStyles.styleBold24(context).copyWith(
                          color: AppColors.black,
                          fontSize: getResponsiveFontSizeTextTarot(context,
                              fontSize: 14)),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
