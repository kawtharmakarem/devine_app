import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import '../../models/settings_models/settings_card_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';
import '../../widgets/settings_widgets/custom_details_settings_card.dart';
import 'app_settings_page.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;
    return SimpleSettingsTile(
      
      title: "About Us",
        titleTextStyle: AppStyles.styleRegular20(context).copyWith(fontSize: getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 20:28)),
       showDivider: false,
       leading:const IconWidget(color: AppColors.darkPrimary, icon: Icons.info_outline),
       child: SettingsScreen(
             
        title: "About Us",
       // hasAppBar: false,
        
        children:[
         //const CustomSettingsTitle(title: "About Us",),
                  ...List.generate(cards.length, (index) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CustomDetailsSettingsCard(cardModel: cards[index]),
                  ),
                  ),
                
        ]),
    );
  }
  final List<SettingsCardModel> cards=[
    SettingsCardModel(title: "Who we Are ?", details: "Divine Connection is best astrology website for online Astrology predictions. With a gigantic pool of Vedic astrologers, Tarot readers, Numerologists, Vastu experts and more, Divine Connection lets you connect with these experts over call and chat and get answers to all your problems.\nFrom Kundli matching to Kundli predictions, on Divine Connection, the visitor is to get the best future predictions across aspects like Marriage, Love, Career or Health and more. \nWhen using Divine Connection, you can trust us for highly accurate, precise and well researched astrological content that would offset most of your worries."),
    SettingsCardModel(title: "What we Do ?", details: "Tired of the same old Astrology predictions?\nLet us be your guide on this extraordinary voyage of self-discovery.\nTogether, we'll unveil your cosmic fingerprint and a life overflowing with empowerment and limitless potential.\n")
   , SettingsCardModel(title: "With Divine Connection Decode Your Destiny:", details: "Unveiling the Symphony of Self with Astrology & Modern Psychology.\nWe provide all kinds of Astrology services like, Future Predictions, Horoscopes, Face Reading , Palm Reading, Biorythm , Dream Interpretation, Emotional Support, Time Travel, Meditation, Tarot Reading, Numerology, Birth chart and Compatibility Readings, Horoscopes, Financial Planning, Career Guidances, Psychology & Emotional Wellbeing services and many more !!!\nImagine this ....."),
   SettingsCardModel(title: "Astrology as a cosmic GPS:", details: "We chart the celestial influences shaping your personality, strengths, and potential. It's a map to your inner compass."),
   SettingsCardModel(title: "Counseling as your personal Al :", details: "We employ the power of modern psychology to analyze your thoughts, emotions, and behaviors. Think of it as an emotional intelligence coach, empowering you to master your inner world.\nWe translate the language of your thoughts, emotions, and behaviors, equipping you with tools to navigate life's complexities.\nThis is more than a service, it's an awakening."),
   SettingsCardModel(title: "With Us :", details: "• Crack the code of your cosmic blueprint, unlocking your hidden potential.\n• Craft a personalized roadmap for a life of fulfillment and purpose.\n• Become an architect of your emotional well-being, mastering your inner world.\n• Embrace challenges with the unwavering strength of a cosmic warrior.\nLet us be your guide on this extraordinary voyage of self-discovery. Together, we'll unveil your cosmic fingerprint and orchestrate a life overflowing with empowerment and limitless potential."),
   SettingsCardModel(title: "Vision :", details: "Our vision is to provide astrological solutions to the customers who are facing problems. We want to give direction to their life with the assistance of our trusted and certified astrologers."),
   SettingsCardModel(title: "Our Mission :", details: "We are working to build the world's largest community of people who seek, learn and share astrological, spiritual and well-being experiences on a single platform in a transparent, trustworthy and credible manner."),
   SettingsCardModel(title: "We Got Your Back :", details: "At Divine Connection, all of the astrologers, along with the support team, work in amalgamation as one family to ensure you the best astrology experience. Whether you are a teen stressing over what career field to choose or an adult facing compatibility issues in marriage, Divine Connection helps all find guidance, direction and happiness in life."),
   SettingsCardModel(title: "Our Story : ", details: "Divine Connection came into being with an aim to not only keep the ethos of traditional astrology intact but to also amalgamate in it the solutions to modern problems like mental health, stress, depression, etc.\nWith that being the first and foremost goal, Divine Connection's founder Disha Dhanrajani has not only worked to deliver the best of Vedic astrology on the platform but has touched every aspect of mental wellness through spiritual means. \nWith the grace of God, Divine Connection, over the years, has not only been able to achieve the aforementioned aim but also add-on to the list of ‘achieved goals’ and continues to do so.  Divine Connection besides allowing you to talk to the best astrologers, also provides numerous other services like Free live sessions, Free Kundli matching, Daily horoscope and much more.\nAs Divine Connection continues to grow with each passing day, so is growing our potential and urge to offer the best of astrology to our users. We are working to build the world's largest community of spiritual and wellbeing experts, and we hope you become a part of this journey one prediction at a time.")
  ];
}

