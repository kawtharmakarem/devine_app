import 'package:divinecontrol/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../animation/card_page.dart';
import '../../animation/card_page_tablet.dart';
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
            :width<AppConstants.maxTabletWidth?getTabletTarotGridView(context, width) :getDesktopTarotGridView(context);
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
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Expanded(
                              child: CardsPageTablet(itemModel: itemModel));
                        }));
                      },
                    ),
                    )
          ]),
    );
  }

  Expanded getTabletTarotGridView(BuildContext context,double width) {
    return Expanded(
      child: GridView(
          // padding: const EdgeInsets.symmetric(horizontal: 5),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.2
              ),
          children: [
            ...List.generate(
                items.length,
                (index) => GridViewItem(
                      itemModel: items[index],
                      onSlectedItem: (GridViewItemModel itemModel) {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Expanded(
                              child: CardsPageTablet(itemModel: itemModel));
                        }));
                      },
                    ))
          ]),
    );
  }

Widget getMobileTarotGridView(BuildContext context) {
    return Expanded(
      child: GridView(
        shrinkWrap: true,
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,childAspectRatio: 1.5),
        children: [
          ...List.generate(items.length, (index) =>Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GridViewItem(
                    itemModel: items[index],
                    onSlectedItem: (itemModel)
                     {
                    //  Navigator.of(context)
                    //      .push(MaterialPageRoute(builder: (context) {
                    //    return CardsPage(itemModel: itemModel);
                    //   }));
                    Get.to(()=>CardsPage(itemModel: itemModel),transition: Transition.fade,duration:const Duration(seconds: 3));
                    },
                  ),
          ),
                )
            
        ],
          
          ),
    );
  }
  
}
