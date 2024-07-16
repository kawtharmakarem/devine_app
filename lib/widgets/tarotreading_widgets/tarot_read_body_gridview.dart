import 'package:divinecontrol/animation/card_page_question.dart';
import 'package:divinecontrol/animation/card_page_tablet_question.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/widgets/tarotreading_widgets/custom_tarot_searchcard.dart';
import 'package:divinecontrol/widgets/tarotreading_widgets/result_cards_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/tarotreading_models/gridview_item_model.dart';
import 'gridview_item.dart';

class TarotBodyGridView extends StatelessWidget {
  const TarotBodyGridView({
    super.key,
    required this.items,
  });

  final List<GridViewItemModel> items;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return width < AppConstants.maxMobileWidth
        ? getMobileTarotGridView(context)
        : width < AppConstants.maxTabletWidth
            ? getTabletTarotGridView(context, width)
            : getDesktopTarotGridView(context);
  }

  Expanded getDesktopTarotGridView(BuildContext context) {
    return Expanded(
      child: GridView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
            childAspectRatio: 1.2),
        children: [
          ...List.generate(
            items.length,
            (index) => GridViewItem(
              itemModel: items[index],
              onSlectedItem: (GridViewItemModel itemModel) {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) {
                //   return Expanded(
                //       child: CardsPageTablet(itemModel: itemModel));
                // }));
                Get.to(
                    () => Expanded(
                        child: CardsPageTabletQuestion(
                            title: itemModel.title, itemModel: itemModel)),
                    transition: Transition.size,
                    duration:
                        const Duration(seconds: AppConstants.durationSecond));
              },
            ),
          ),
           CustomSearchQuestionCard(
            itemModel: GridViewItemModel(
                image: "",
                imageBg: "",
                title: "",
                description: "",
                subTitle: "",
                results: resultCards),
          )
        ],
      ),
    );
  }

  Expanded getTabletTarotGridView(BuildContext context, double width) {
    return Expanded(
      child: GridView(
        // padding: const EdgeInsets.symmetric(horizontal: 5),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 1.1),
        children: [
          ...List.generate(
              items.length,
              (index) => GridViewItem(
                    itemModel: items[index],
                    onSlectedItem: (GridViewItemModel itemModel) {
                      // Navigator.of(context)
                      //     .push(MaterialPageRoute(builder: (context) {
                      //   return Expanded(
                      //       child: CardsPageTablet(itemModel: itemModel));
                      // }));
                      Get.to(
                          () => Expanded(
                              child: CardsPageTabletQuestion(
                                  title: itemModel.title,
                                  itemModel: itemModel)),
                          transition: Transition.size,
                          duration: const Duration(
                              seconds: AppConstants.durationSecond));
                    },
                  )),
           CustomSearchQuestionCard(
            itemModel: GridViewItemModel(
                image: "",
                imageBg: "",
                title: "",
                description: "",
                subTitle: "",
                results: resultCards),
          )
        ],
      ),
    );
  }

  Widget getMobileTarotGridView(BuildContext context) {
    return Expanded(
      child: GridView(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 1.2),
        children: [
          ...List.generate(
            items.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: GridViewItem(
                itemModel: items[index],
                onSlectedItem: (itemModel) {
                  // Get.to(()=>CardsPage(itemModel: itemModel),transition: Transition.fade,duration:const Duration(seconds: AppConstants.durationSecond));
                  Get.to(
                      () => CardsPageQuestion(
                          title: itemModel.title, itemModel: itemModel),
                      transition: Transition.circularReveal,
                      duration:
                          const Duration(seconds: AppConstants.durationSecond));
                },
              ),
            ),
          ),
          CustomSearchQuestionCard(
            itemModel: GridViewItemModel(
                image: "",
                imageBg: "",
                title: "",
                description: "",
                subTitle: "",
                results: resultCards),
          )
        ],
      ),
    );
  }
}
