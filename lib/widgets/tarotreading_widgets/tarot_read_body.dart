import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../models/tarotreading_models/gridview_item_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/tarot_constants.dart';
import 'see_more_widet.dart';
import 'tarot_read_body_gridview.dart';
import 'tarot_reading_title.dart';

class TarotReadViewBody extends StatefulWidget {
  const TarotReadViewBody({super.key});

  @override
  State<TarotReadViewBody> createState() => _TarotReadViewBodyState();
}

class _TarotReadViewBodyState extends State<TarotReadViewBody> {
  List<GridViewItemModel> items = [];
  @override
  void initState() {
    items = getItemsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return width < TarotAppConstants.mobileMaxWidth
        ? getMobileTarotWidget()
        : width < TarotAppConstants.tabletMaxWidth
            ? getTabletTarotBody()
            : getDesktopTarotBody();
  }

  Container getMobileTarotWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: AppColors.lightPurple1,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          const TarotReadingTitle(),
          const SizedBox(
            height: 45,
          ),
          TarotBodyGridView(items: items),
          const SizedBox(
            height: 20,
          ),
          const SeeMore(),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Container getTabletTarotBody() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      decoration: BoxDecoration(
          color: AppColors.lightPurple1,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          const TarotReadingTitle(),
          const SizedBox(
            height: 45,
          ),
          TarotBodyGridView(items: items),
          const SizedBox(
            height: 40,
          ),
          const SeeMore(),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }

  Container getDesktopTarotBody() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      decoration: BoxDecoration(
          color: AppColors.lightPurple1,
          borderRadius: BorderRadius.circular(20)),
      child:Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          const TarotReadingTitle(),
          const SizedBox(
            height: 45,
          ),
          TarotBodyGridView(items: items),
          const SizedBox(
            height: 40,
          ),
          const SeeMore(),
          
        ],
      ),
    );
  }

  List<GridViewItemModel> getItemsData() => [
        GridViewItemModel(
            image: AppImages.weekend,
            title: "Weekend Tarot Fortune",
            description:
                "[February 16th to 18th]\nShake off the week's stress with a soul-stirring Tarot reading this weekend! 🌟 🔮\nUnveil hidden possibilities and find clarity for the days ahead. ✨",
            likesNumber: 10,
            seeNumber: 15),
        GridViewItemModel(
            image: AppImages.weekly,
            title: "Weekly Tarot Fortune",
            description:
                "[February 12th to 16th]\nNavigate foggy weeks with Tarot's illuminating wisdom. 🌫️ 🔮\nDive into clarity and discover your best course of action! 💡",
            likesNumber: 621,
            seeNumber: 1.5),
        GridViewItemModel(
            image: AppImages.whereis,
            title: "Where Is My Destined Partner?",
            description:
                "Hold on tight! 💜 You’re about to uncover some juicy intel about your destined\n partner! 👀\nWant a hint? Let the wisdom of Tarot guide you, my friend. 🧭 🗺",
            likesNumber: 5.7,
            seeNumber: 14.5),
        GridViewItemModel(
            image: AppImages.firsthalf,
            title: "The First Half of 2024 Tarot Career Advice",
            description:
                "[February 12th to 16th]\nNavigate foggy weeks with Tarot's illuminating wisdom. 🌫️ 🔮\nDive into clarity and discover your best course of action! 💡\n",
            likesNumber: 621,
            seeNumber: 1.5),
        GridViewItemModel(
            image: AppImages.change,
            title: "How to Change My Luck?",
            description:
                "Hold on tight! 💜 You’re about to uncover some juicy intel about your destined\n partner! 👀\nWant a hint? Let the wisdom of Tarot guide you, my friend. 🧭 🗺",
            likesNumber: 5.7,
            seeNumber: 14.5),
        GridViewItemModel(
            image: AppImages.hidden,
            title: "My Hidden Charm",
            description:
                "[February 12th to 16th]\nNavigate foggy weeks with Tarot's illuminating wisdom. 🌫️ 🔮\nDive into clarity and discover your best course of action! 💡",
            likesNumber: 621,
            seeNumber: 1.5)
      ];
}
