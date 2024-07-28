import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:divinecontrol/widgets/auth_widgets/custom_contactus_card.dart';
import 'package:divinecontrol/widgets/dream_meaning_widgets/custom_sleep_card.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';

class SleepMusicScreen extends StatefulWidget {
  const SleepMusicScreen({super.key});

  @override
  State<SleepMusicScreen> createState() => _SleepMusicScreenState();
}

class _SleepMusicScreenState extends State<SleepMusicScreen> {
  List<String> videoIds = [
    "3zmMWUUijMo",
    "lh4JdZTJe7k",
    "2OEL4P1Rz04",
    "EQ205a0P10Y",
    "4oY3v0jAWr4",
    "Jum_lYvW3q4",
    "rU5lm-4vGyE",
    "oKTj0bfn0oc",
    "SaRjRbkW6K4"
  ];
  List<String> titles = [
    'Ocean Waves Relaxing Music',
    'Stress Relief Sleeping Music',
    'Wind Waves Sleeping Music',
    'Soft Piano Music',
    'Deep Space Ambient Music',
    'Deep Relaxation and Rest',
    'Snowfall Symphony Music',
    'Moonlight Stress Relief Music',
    'Ultra Calm Sound Sleep Music'
  ];
  //final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
      appBar:const CustomAppBar(title: "Sleep Music", leading: true),
      body: width < AppConstants.maxTabletWidth
          ? getMobileSleepMusicWithContact()
          : getDesktopSleepMusic(),
    );
  }

  // Column getMobileSleepMusic() {
  //   return Column(
  //     children: [
  //       Expanded(
  //         child: ListView.builder(
  //             controller: _controller,
  //             itemCount: videoIds.length,
  //             itemBuilder: (context, index) {
  //               return SleepMusic(
  //                 videoId: videoIds[index],
  //                 title: titles[index],
  //               );
  //             }),
  //       ),

  //     ],
  //   );
  // }

  Column getMobileSleepMusicWithContact() {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              ...List.generate(videoIds.length, (index){
                 return SleepMusic(
                  videoId: videoIds[index],
                  title: titles[index],
                );
              }),
              CustomContactUsCard(image: AppImages.head, description: "Do you have Sleep Disorders ?\nBook personalised call Now!!")
              
               
              ]),
        ),
        
      ],
    );
  }

  Widget getDesktopSleepMusic() {
    
    return GridView.builder(
      itemCount: videoIds.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
        itemBuilder: (context, index) {
          return SleepMusic(videoId: videoIds[index], title: titles[index]);
        });
  }
}
