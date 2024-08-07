import 'package:divinecontrol/screens/homepage_screens/main_view_screen.dart';
import 'package:divinecontrol/screens/meditation_screens/meditation_details_screen.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:divinecontrol/widgets/meditation_widgets/contact_us_medititationdialog.dart';
import 'package:divinecontrol/widgets/meditation_widgets/custom_contactus_meditation.dart';
import 'package:divinecontrol/widgets/meditation_widgets/custom_meditation_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/meditation_models/meditation_models.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../widgets/emotion_widgets/contact_us_emotiondialog.dart';
import '../../widgets/emotion_widgets/custom_contactus_button.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({super.key});

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  double width = 0;
  double height = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
      appBar: CustomAppBar(title: "Meditation", leading: false,actions: Icons.close,actionesFn: (){
        Get.offAll(()=>MainViewScreen());
      },),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width / 20, vertical: width / 20),
        child: width < AppConstants.maxMobileWidth
            ? getMobileMeditationContentWithContact()
            : getTabletMeditationContent(),
      ),
    );
  }

  // Column getMobileMeditationContent() {
  //   return Column(
  //       children: [
  //         GridView.builder(gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
  //         ),
  //         shrinkWrap: true,
  //         itemCount:items.length,

  //          itemBuilder: (context,index){
  //         return CustomMeditationCard(index: index,meditationModel:items[index] ,onTap: (){
  //           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MeditationDetailsScreen(meditationModel: items[index])));
  //         },);
  //         })
  //       ],
  //     );
  // }

  Widget getMobileMeditationContentWithContact() {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      shrinkWrap: true,
      children: [
        ...List.generate(items1.length, (index) {
          return CustomMeditationCard(
              index: index,
              onTap: () {
                Get.to(
                    () =>
                        MeditationDetailsScreen(meditationModel: items1[index]),
                    transition: Transition.circularReveal,
                    duration:
                        const Duration(seconds: AppConstants.durationSecond));
              },
              meditationModel: items1[index]);
        }),
        CustomMeditationContactUsButton(
          onTap: () {
           showDialog(context: context, builder: (context)=>AlertDialog(content: CustomMeditationContactUsDialog(),));

          },
        ),

      ],
    );
  }

  Widget getTabletMeditationContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView(
            physics: NeverScrollableScrollPhysics(),
            
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: width < AppConstants.maxTabletWidth ? 3 : 4,
                  mainAxisSpacing: 50,
                  crossAxisSpacing: 30),
              shrinkWrap: true,
              children: [
                ...List.generate(items1.length, (index){
                  return CustomMeditationCard(index: index, onTap: (){
                    Get.to(()=>MeditationDetailsScreen(meditationModel: items1[index]),transition: Transition.zoom,duration: const Duration(seconds: AppConstants.durationSecond));
                  }, meditationModel:items1[index]);
                }),
               
              ],
             
              ),
             SizedBox(height:width<AppConstants.maxTabletWidth? 100:50,),

               CustomContactUsEmotionButton(title: "Get Help",image: AppImages.meditationLogo,onTap: (){
                                         showDialog(context: context, builder: (context)=>AlertDialog(content: CustomEmotionContactUsDialog(description: "Let's do Meditation to Manifest with Low of Attraction and Affirmations.",image: AppImages.meditationLogo,),));
          
                }
                ),

        ],
      ),
    );
  }

  static List<String>? dailyVideos = [
    "DdUm9U9w9W0",
    "IvLViZeC60c",
    "mMw9Q8CIPuY",
    "1gs6qOZxzy4",
    "LJQOoAw0BjY",
    "42uKBAHQMMo",
    "pZ410ATHqG4",
    "442wt8KJeNs"
  ];
  static List<String>? dailyTitles = [
    "Powerful 6-phase Morning Meditation",
    "Feel Amazing For The Day Ahead",
    "Morning Meditation for Positive Energy",
    "Increase your Vibrational",
    "The Perfect Mindfulness",
    "Morning Meditation for Health Wealth &",
    "A Powerful Morning Meditation to Start",
    "Productive Morning Guided Meditation"
  ];

  static List<String>? chakraVideos = [
    "ersZEW9ucA4",
    "6juYDQvORDw",
    "jQZdZ9kzKBc",
    "RPCr5uZWRd0",
    "EVsuqUKrx-I",
    "dgTx58ejJ_w",
    "thjrAfpeJ7A",
    "RbVbo9BkuiA",
    "wXkSXbntKwU",
    "vlLwR2x9ekY"
  ];
  static List<String>? chakraTitles = [
    "10 Minute Root Chakra Guided Meditation",
    "Boost Creativity, Desire & Confidence",
    "Unconditional Love 10 Minute Meditation",
    "Throat Chakra Meditation",
    "Third Eye Chakra Guided Meditation",
    "Crown Chakra Guided Meditation",
    "Chakra Balancing and Cleansing",
    "Positive Energy Chakra Meditation",
    "Full Body 7 Chakra Healing Guided",
    "Sacral Chakra Guided Meditation"
  ];

  static List<String>? sleepVideos = [
    "2K4T9HmEhWE",
    "BuOYJ2s_XJw",
    "a5XSe_pORQ0",
    "_wenjJ6jUYE",
    "xeS6vHrPwNI",
    "YdDv_0kwsb8",
    "hANbTU_YsQg",
    "W4ujD0NI0m8",
    "wXkSXbntKwU"
  ];
  static List<String>? sleepTitles = [
    "5 Minute Meditation Before Sleep",
    "Receive Messages In Your Sleep Guided",
    "Floating With The Stars Guided",
    "Sleep Story for Grown Ups",
    "Positive Energy Before You Sleep",
    "Sleep in Ten Minutes",
    "Feeling Grateful Before You Sleep",
    "A Healing Sleep Guided Meditation",
    "Yoga Nidra Sleep Meditation Guided"
  ];

  static List<String>? minutesVideos = [
    "jttcWa7tS38",
    "zyUy9w953L0",
    "xCi0MRxaaCE",
    "HNab2YqCCiM",
    "2K4T9HmEhWE",
    "ssss7V1_eyA",
    "psx_NGVO4JQ",
    "uqGTphrGHi4",
    "zSkFFW--Ma0"
  ];
  static List<String>? minutesTitles = [
    "5 Minute Meditation Anyone Can Do",
    "5 Minute Meditation for Gratitude",
    "5 Minute Meditation for Increasing Focus",
    "5 Minute Morning Meditation",
    "5 Minute Meditation Before Sleep",
    "5 Minute Mindfulness",
    "5 Minute Manifestation",
    "5 Minute Meditation for Anxiety",
    "5 minute meditation for focus"
  ];

  static List<String>? mindfulVideo = [
    "LJQOoAw0BjY",
    "ETXwO9ssXqQ",
    "cVeyjwnxlIA",
    "a-cNQDhP87w",
    "kEicc-b4HGo",
    "aexnRWrqxLI",
    "xr_H18UcQCo",
    "zHBnEWJAAOc",
    "Thnh2P4CECc"
  ];
  static List<String>? mindfulTitles = [
    "The Perfect Mindfulness",
    "Become Amazing at Meditation",
    "Feeling Fully Present in The Moment",
    "Morning Mindfulness Meditation",
    "You Feel The Difference After",
    "Entering into a Perfect State of",
    "Let the Sounds Bring You Into the Present",
    "A Powerful 3-phase Guided Meditation",
    "Trust in Life ~ Guided Meditation"
  ];

  static List<String>? positiveVideos = [
    "mMw9Q8CIPuY",
    "RbVbo9BkuiA",
    "1gs6qOZxzy4",
    "a-cNQDhP87w",
    "P0gwE0eGRKk",
    "cECMemgO0fw",
    "f4VI7tIhEJM",
    "Td96vE38oI8",
    "3mRGG8_Gf38"
  ];
  static List<String>? positiveTitles = [
    "Morning Meditation for Positive Energy",
    "Positive Energy Chakra Meditation",
    "Increase your Vibrational Frequency With Positive Energy",
    "Morning Mindfulness Meditation",
    "Feel the powerful Self Healing Energy Within",
    "Entering Into Higher Consciousness",
    "Feeling Full of Energy",
    "Full of Positive Feelings with this Gratitude Guided Meditation",
    "You Are Radiant, Awake & Alive ~ Morning Positive Energy"
  ];

  static List<String>? beginnersVideos = [
    "moag-iZ8XRA",
    "_0xVd2KfRak",
    "6m-_esNwnnk",
    "0DwV711ULvo",
    "s8QhA0wAnIk",
    "mjG6Jytto6o",
    "OBysZAgthoI",
    "zHBnEWJAAOc",
    "nqGe4wq5y6s",
    "6L3UcW1rtSQ"
  ];
  static List<String>? beginnersTitles = [
    "Day 1 - First Meditation",
    "Day 2 - Mindfulness Meditation",
    "Day 3 - Vipassana",
    "Day 4 - Non-judgement",
    "Day 5 - Mindful living",
    "Day 6 - Science of meditation",
    "Day 7 - The present moment",
    "Day 8 - Negative emotions",
    "Day 9 - Sounds",
    "Day 10 - Conclusion"
  ];

  static List<String>? mentalVideos = [
    "EPWpV064K24",
    "2nV-v8zXpH0",
    "o94tvFUttco",
    "8_jcEpwKQXc",
    "5I_gj-eMefU",
    "NIjKfenNStA",
    "QMv64migYjY",
    "-_dTtHriNlk",
    "pk0Jeqcv5Q8",
    "3IUaHeedb98"
  ];
  static List<String>? mentalTitles = [
    "Clearing Negativity",
    "Banishing Depression",
    "MEDITATION for Stress Relief",
    "Meditation for Anxiety Relief",
    "MEDITATION for Self-Esteem",
    "Pain Relief & Healing GUIDED MEDITATION",
    "MEDITATION for Total Body Relaxation",
    "MEDITATION for Heal Your Inner Child",
    "MEDITATION for Releasing Anger",
    "MEDITATION for Overcoming Shyness"
  ];

  static List<String>? powerVideos = [
    "tV6swIkrFBk",
    "qXXeN49sQZA",
    "dpqX3Fthw_E",
    "5Bo942_Gdtw",
    "pk0Jeqcv5Q8",
    "JhNwHC-wbCo",
    "HOfBYvh8MfA",
    "hGmEQjNp7Ck",
    "9LrGIZKpoJ0"
  ];
  static List<String>? powerTitles = [
    "Universal Light Energy Healing",
    "White Light Protection: Warrior of Light (Epic Power-Meditation)",
    "Earth Grounding (self-empowering visualisation)",
    "A Gift From Your Guardian Spirit. An Uplifting Visualisation",
    "GUIDED MEDITATION - Releasing Anger",
    "MEDITATION STORY: Running With Wolves - Epic Meditation",
    "PRAYER FOR WORLD PEACE",
    "Meditation: Journey into the West. Story Visualization",
    "A Fire Cleansing Epic Power Guided Meditation for Healing"
  ];

  // static final List<MeditationModel> items = [
  //   MeditationModel(
  //       image: AppImages.daily,
  //       title: "Daily Meditation",
  //       videos: dailyVideos,
  //       videoTitles: dailyTitles),
  //   MeditationModel(
  //       image: AppImages.chakram,
  //       title: "Chakra Meditation",
  //       videos: chakraVideos,
  //       videoTitles: chakraTitles),
  //   MeditationModel(
  //       image: AppImages.sleep,
  //       title: "Meditation for sleep",
  //       videos: sleepVideos,
  //       videoTitles: sleepTitles),
  //   MeditationModel(
  //       image: AppImages.minutes,
  //       title: "5 minute Meditation",
  //       videos: minutesVideos,
  //       videoTitles: minutesTitles),
  //   MeditationModel(
  //       image: AppImages.mindfullness,
  //       title: "Mindfullness Meditation",
  //       videos: mindfulVideo,
  //       videoTitles: mindfulTitles),
  //   MeditationModel(
  //       image: AppImages.positive,
  //       title: "Meditation for Positive Energy",
  //       videos: positiveVideos,
  //       videoTitles: positiveTitles),
  //   MeditationModel(
  //       image: AppImages.beginners,
  //       title: "Meditation for beginners",
  //       videos: beginnersVideos,
  //       videoTitles: beginnersTitles),
  //   MeditationModel(
  //       image: AppImages.mental,
  //       title: "Meditation for Mental Health",
  //       videos: mentalVideos,
  //       videoTitles: mentalTitles),
  //   MeditationModel(
  //     image: AppImages.power,
  //     title: "Epic Power Meditation",
  //     videos: powerVideos,
  //     videoTitles: powerTitles,
  //   ),
  // ];


  static final List<MeditationModel> items1 = [
    MeditationModel(
        image:"https://images.unsplash.com/photo-1536623975707-c4b3b2af565d?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",

        title: "Daily Meditation",
        videos: dailyVideos,
        videoTitles: dailyTitles),
    MeditationModel(
        image: "https://images.unsplash.com/photo-1474418397713-7ede21d49118?q=80&w=1753&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",

        title: "Chakra Meditation",
        videos: chakraVideos,
        videoTitles: chakraTitles),
    MeditationModel(
        image: "https://images.unsplash.com/photo-1512438248247-f0f2a5a8b7f0?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",

        title: "Meditation for sleep",
        videos: sleepVideos,
        videoTitles: sleepTitles),
    MeditationModel(
        image:     "https://images.unsplash.com/photo-1602192509154-0b900ee1f851?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",

        title: "5 minute Meditation",
        videos: minutesVideos,
        videoTitles: minutesTitles),
    MeditationModel(
        image:     "https://images.unsplash.com/photo-1506126613408-eca07ce68773?q=80&w=1999&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",

        title: "Mindfullness Meditation",
        videos: mindfulVideo,
        videoTitles: mindfulTitles),
    MeditationModel(
        image:     "https://images.unsplash.com/photo-1592895792095-85fa785192a9?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",

        title: "Meditation for Positive Energy",
        videos: positiveVideos,
        videoTitles: positiveTitles),
    MeditationModel(
        image:     "https://images.unsplash.com/photo-1489659639091-8b687bc4386e?q=80&w=1773&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",

        title: "Meditation for beginners",
        videos: beginnersVideos,
        videoTitles: beginnersTitles),
    MeditationModel(
        image:     "https://images.unsplash.com/photo-1559595500-e15296bdbb48?q=80&w=1931&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",

        title: "Meditation for Mental Health",
        videos: mentalVideos,
        videoTitles: mentalTitles),
    MeditationModel(
      image:     "https://images.unsplash.com/photo-1554067559-269708c83fb6?q=80&w=1994&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",

      title: "Epic Power Meditation",
      videos: powerVideos,
      videoTitles: powerTitles,
    ),
  ];
}


 