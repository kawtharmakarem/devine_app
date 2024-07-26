import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:divinecontrol/widgets/biorythm_widgets/custom_biorythm_contactbutton.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../models/biorhythm_models/biorhythm_description_model.dart';
import '../../widgets/biorythm_widgets/biorhythm_chart.dart';
import '../../widgets/biorythm_widgets/biorhythm_description.dart';
import '../../widgets/biorythm_widgets/biorhythm_indicators.dart';
import '../../widgets/biorythm_widgets/contact_us_dialog.dart';

class BiorhythmPage extends StatefulWidget {
  const BiorhythmPage({super.key});
  static List<BiorhythmDescriptionModel> descriptions = [
    BiorhythmDescriptionModel(
      title: 'Physical',
      description:
          'You are in a negative cycle for your physical attributes. Negative physical days find us needing more rest, and our immunity might not be at its best. Our desire usually takes a back seat, and we may be prone to overexertion and overexposure. Your strength, endurance, and energy may not be at their highest, so it is a good opportunity to work on them!',
      image: AppImages.physical,
    ),
    BiorhythmDescriptionModel(
      title: 'Emotional',
      description:
          'You are in a positive cycle for your emotional attributes. On positive emotional days, we are quick to adapt and easily get along with others. We may be supportive and forgiving, or our thoughts may be focused more on love and affection. Your balance of power, mood, receptivity, mood, creativity, awareness and perception while they are at their peak.',
      image: AppImages.emotional,
    ),
    BiorhythmDescriptionModel(
      title: 'Intellectual',
      description:
          'You are in a negative cycle for your intellectual attributes. On negative intellectual days, we might have trouble trying to stay motivated, concentrating, or getting tasks done. Our critical thinking may be at its lowest. Our logical analysis, analytical thinking, alertness, memory and concentration might not be at their highest, so it is a good opportunity to work on them!',
      image: AppImages.intellectual,
    ),
    BiorhythmDescriptionModel(
      title: 'Spiritual',
      description:
          'You are in a negative cycle for your intellectual attributes. On negative intellectual days, we might have trouble trying to stay motivated, concentrating, or getting tasks done. Our critical thinking may be at its lowest. Our logical analysis, analytical thinking, alertness, memory and concentration might not be at their highest, so it is a good opportunity to work on them!',
      image: AppImages.spiritual,
    ),
  ];

  @override
  State<BiorhythmPage> createState() => _BiorhythmPageState();
}

class _BiorhythmPageState extends State<BiorhythmPage> {
  String dob = "";
  int mydays = 0;
  int months = 0;
  int years = 0;
  int days = 0;
  int _calculateAge(DateTime birth) {
    DateTime now = DateTime.now();
    Duration age = now.difference(birth);
    //int years=age.inDays ~/365;
    // int months=(age.inDays%365)~/30;
    // int days=((age.inDays%365)%30);
    int mydays = age.inDays;
    return mydays;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    dob = ModalRoute.of(context)?.settings.arguments as String;
    mydays = _calculateAge(DateTime.parse(dob));
    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
      appBar: CustomAppBar(title: "Biorhythm", leading: true),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width < AppConstants.maxMobileWidth ? 10 : 30),
        child: width < AppConstants.maxTabletWidth
            ? getMobileBiorhythmContent(context, width)
            : getDesktopBiorhythmContent(context, width),
      ),
    );
  }

  Column getMobileBiorhythmContent(BuildContext context, double width) {
    return Column(
      children: [
        BiorhythmChart(
          mydays: mydays,
        ),
        const SizedBox(height: 16),
        const BiorhythmIndicators(),
        const SizedBox(height: 16),
        Expanded(
          child: ListView(
            // shrinkWrap: true,
            children: [
              for (final descriptionModel in BiorhythmPage.descriptions)
                Padding(
                  padding: EdgeInsets.only(
                      bottom: width < AppConstants.maxMobileWidth ? 10 : 30),
                  child:
                      BiorhythmDescription(descriptionModel: descriptionModel),
                ),
                 CustomBiorythmContactButton(
            title: "Book a Call",
            onTap: () {
              showDialog(
                  context: context,
                  
                  builder: (context) {
                    return AlertDialog(
                     
                      content: ContactUsDialog(),
                    );
                  });
            },
            icon: FontAwesomeIcons.heartCircleCheck)
            ],
          ),
        ),
       
      ],
    );
  }

  Widget getDesktopBiorhythmContent(BuildContext context, double width) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              BiorhythmChart(
                mydays: mydays,
              ),
              SizedBox(height: 16),
              BiorhythmIndicators(),
            ],
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              for (final descriptionModel in BiorhythmPage.descriptions)
                Padding(
                  padding: EdgeInsets.only(
                      bottom: width < AppConstants.maxMobileWidth ? 10 : 30),
                  child:
                      BiorhythmDescription(descriptionModel: descriptionModel),
                ),
                 CustomBiorythmContactButton(
            title: "Book a Call",
            onTap: () {
              showDialog(
                  context: context,
                  
                  builder: (context) {
                    return AlertDialog(
                     
                      content: ContactUsDialog(),
                    );
                  });
            },
            icon: FontAwesomeIcons.heartCircleCheck)
            ],
          ),
        ),
        
      ],
    );
  }
}

