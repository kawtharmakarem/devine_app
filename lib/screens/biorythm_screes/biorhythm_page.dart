import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:divinecontrol/widgets/biorythm_widgets/custom_biorythm_contactbutton.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import '../../models/biorhythm_models/biorhythm_description_model.dart';
import '../../widgets/biorythm_widgets/biorhythm_chart.dart';
import '../../widgets/biorythm_widgets/biorhythm_description.dart';
import '../../widgets/biorythm_widgets/contact_us_dialog.dart';

class BiorhythmPage extends StatefulWidget {
  const BiorhythmPage({super.key});
 

  @override
  State<BiorhythmPage> createState() => _BiorhythmPageState();
   static _BiorhythmPageState? of(BuildContext context) =>
      context.findAncestorStateOfType<_BiorhythmPageState>();
  
}

class _BiorhythmPageState extends State<BiorhythmPage> {



   final List<BiorhythmDescriptionModel> descriptions = [
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
  String dob = "";
  int physicalValue=0;
  int emotionalValue=0;
  int intellectualValue=0;
  List<int> values=[];
//   int get physicalValue{
//   return ((sin((2 * pi * (widget.mydays + 0)) / 23) + 1) * 50).toInt();
// }  

// int get emotionalValue{
//   return ((sin((2 * pi * (widget.mydays + 0)) / 28) + 1) * 50).toInt();
// }

//  int get intellectualValue{
//   return ((sin((2 * pi * (widget.mydays + 0)) / 33) + 1) * 50).toInt();
// }

   int calculateBiorythm(DateTime? dob) {
  if (dob == null) return 0;
 const int millisecondsInDay = 1000 * 60 * 60 * 24;
  final int daysSinceBirth = (DateTime.now().millisecondsSinceEpoch - dob.millisecondsSinceEpoch);
  return daysSinceBirth~/millisecondsInDay;
   }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    dob = ModalRoute.of(context)?.settings.arguments as String;
    physicalValue=((sin((2 * pi * (calculateBiorythm(DateTime.parse(dob)) + 0)) / 23) + 1) * 50).toInt();
    emotionalValue=((sin((2 * pi * (calculateBiorythm(DateTime.parse(dob)) + 0)) / 28) + 1) * 50).toInt();
    intellectualValue=((sin((2 * pi * (calculateBiorythm(DateTime.parse(dob)) + 0)) / 33) + 1) * 50).toInt();
    values=[physicalValue,emotionalValue,intellectualValue,0];
    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
      appBar: CustomAppBar(title: "Biorhythm", leading: true),
      body: width < AppConstants.maxTabletWidth
          ? getMobileBiorhythmContent(context, width)
          : getDesktopBiorhythmContent(context, width),
    );
  }

  Widget getMobileBiorhythmContent(BuildContext context, double width) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: width<AppConstants.maxMobileWidth?5:10),
      child: Column(
        children: [
          BiorhythmChart(
         
            mydays: calculateBiorythm(DateTime.parse(dob)),
          ),
          const SizedBox(height: 20),
          //const BiorhythmIndicators(),
          //const SizedBox(height: 16),
          Expanded(
            
            child: ListView(
              // shrinkWrap: true,
              children: [
                // for (final descriptionModel in descriptions)
                //   Padding(
                //     padding: EdgeInsets.only(
                //         bottom: width < AppConstants.maxMobileWidth ? 10 : 30),
                //     child:
                //         BiorhythmDescription(descriptionModel: descriptionModel,),
                //   ),
                ...List.generate(descriptions.length,(index){
                 return  Padding(
                    padding: EdgeInsets.only(
                        bottom: width < AppConstants.maxMobileWidth ? 10 : 30),
                    child:
                        BiorhythmDescription(descriptionModel: descriptions[index],value: values[index],),
                  );
                }),
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
      ),
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
               
                mydays: calculateBiorythm(DateTime.parse(dob)),
              ),
              SizedBox(height: 16),
            //  BiorhythmIndicators(),
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
              // for (final descriptionModel in descriptions)
              //   Padding(
              //     padding: EdgeInsets.only(
              //         bottom: width < AppConstants.maxMobileWidth ? 10 : 30),
              //     child:
              //         BiorhythmDescription(descriptionModel: descriptionModel),
              //   ),
              ...List.generate(descriptions.length,(index){
                 return Padding(
                  padding: EdgeInsets.only(
                      bottom: width < AppConstants.maxMobileWidth ? 10 : 30),
                  child:
                      BiorhythmDescription(descriptionModel: descriptions[index],value: values[index],),
                );
              }),
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

