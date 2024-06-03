import 'package:flutter/material.dart';

import '../../animation/card_page.dart';
import '../../animation/card_page_tablet.dart';
import '../../models/tarotreading_models/gridview_item_model.dart';
import '../../utils/tarot_constants.dart';
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
    return width < TarotAppConstants.mobileMaxWidth
        ? getMobileTarotGridView()
        : width < TarotAppConstants.tabletMaxWidth
            ? getTabletTarotGridView(context)
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
              childAspectRatio: 1.75),
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

  Expanded getTabletTarotGridView(BuildContext context) {
    return Expanded(
      child: GridView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              childAspectRatio: 1.75),
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

  Expanded getMobileTarotGridView() {
    return Expanded(
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: GridViewItem(
                    itemModel: items[index],
                    onSlectedItem: (itemModel) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return CardsPage(itemModel: itemModel);
                      }));
                    },
                  ));
            }));
  }
}
