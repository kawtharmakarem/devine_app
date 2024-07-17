
import 'package:divinecontrol/screens/emotion_screens/emotion_details_screen.dart';
import 'package:divinecontrol/widgets/emotion_widgets/custom_emtion_card.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../models/emotion_models/emotion_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';

class EmotionScreen extends StatefulWidget {
  const EmotionScreen({super.key});

  @override
  State<EmotionScreen> createState() => _EmotionScreenState();
}

class _EmotionScreenState extends State<EmotionScreen> {
  double width=0;
  double height=0;

 
  @override
  Widget build(BuildContext context) {
     width=MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar:CustomAppBar(title: 'Emotional Support', leading: true),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: width/20,vertical: width/20),
      child: SingleChildScrollView(
        physics:const BouncingScrollPhysics(),
        child:width<AppConstants.maxMobileWidth? getMobileEmotionalContent():getTabletEmotionalContent(),),),
    );
  }

  Column getMobileEmotionalContent() {
    return Column(
        children: [
          GridView.builder(gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          ),
          shrinkWrap: true,
          itemCount: emotions.length,
          
           itemBuilder: (context,index){
          return CustomEmotionCard(index: index,emotionModel:emotions[index] ,onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EmotionDetailsPage(emotionModel: emotions[index])));
          },);
          })
        ],
      );
  }

   Widget getTabletEmotionalContent() {
    return Column(
      children: [
        const SizedBox(height: 20,),
        GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:width<AppConstants.maxTabletWidth? 3:4,mainAxisSpacing: 50,crossAxisSpacing: 30
        ),
        shrinkWrap: true,
        itemCount: emotions.length,
        
         itemBuilder: (context,index){
        return CustomEmotionCard(index: index,emotionModel:emotions[index] ,onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EmotionDetailsPage(emotionModel: emotions[index])));
        },);
        }),
      ],
    );
  }
  static final List<EmotionModel> emotions=[
    EmotionModel(title1: "Your Anger Management is conducted by one of our expert astrologer.",title2: "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",title3: "Waiting in queue for astrologer to get free.",title4: "Call completed",image: AppImages.anger, title: "Anger Management",detailsImage: AppImages.angerDetails,description: "Explore transformative anger management techniques with expert guidance from certified online psychologists and counselors at Divine Connection. Our affordable and confidential therapy sessions are designed to equip you with the tools needed to effectively manage anger and restore emotional balance. Trust in our secure online platform to safeguard your privacy as you embark on a journey towards greater inner peace and well-being."),
    EmotionModel(title1: "Your Obsession / OCD is conducted by one of our expert astrologer.",title2: "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",title3: "Waiting in queue for astrologer to get free.",title4: "Call completed",image: AppImages.obsession, title: "Obsession / OCD",detailsImage:AppImages.obsessiondetails,description: "Break free from the grip of obsession and OCD with Divine Connection's compassionate support. Our certified online psychologists and counselors provide confidential therapy sessions tailored to address the challenges of obsessive thoughts and compulsive behaviors. Whether you're struggling with intrusive thoughts, repetitive rituals, or overwhelming urges, we're here to help you regain control and find relief. Trust in our secure online platform to provide a safe space for exploration and healing, allowing you to cultivate healthier coping mechanisms and develop strategies to manage your symptoms. With Divine Connection, you can embark on a journey towards greater peace of mind and reclaim control over your life."),
    EmotionModel(title1: "Your Loneliness is conducted by one of our expert astrologer.",title2: "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",title3: "Waiting in queue for astrologer to get free.",title4: "Call completed", image: AppImages.loneliness, title: "Loneliness",detailsImage: AppImages.lonelinessdetails,description: "Navigating loneliness can feel overwhelming, but Divine Connection is here to offer you support and understanding. Our certified online psychologists and counselors provide confidential therapy sessions designed to address the root causes of loneliness and help you reconnect with yourself and others.Through empathetic guidance and personalized strategies, we empower you to build meaningful connections and find fulfillment in your relationships. Trust in our secure online platform to provide a safe space for exploration and growth as you embark on a journey towards greater connection and well-being. With Divine Connection, you don't have to face loneliness alone."),
    EmotionModel(title1: "Your Sexual Wellness is conducted by one of our expert astrologer.",title2: "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",title3: "Waiting in queue for astrologer to get free.",title4: "Call completed", image: AppImages.sexual, title: "Sexual Wellness",detailsImage: AppImages.sexdetails,description: "Embrace sexual wellness with Divine Connection's supportive guidance and expertise. Our certified online psychologists and counselors offer confidential therapy sessions tailored to address various aspects of sexual health and relationships.Whether you're navigating intimacy issues, exploring your sexual identity, or seeking to enhance your overall well-being in this area, we're here to help. Trust in our secure online platform to provide a safe and non-judgmental space for exploration and healing. With Divine Connection, you can embark on a journey towards greater sexual fulfillment, confidence, and empowerment."),
    EmotionModel(title1: "Your Family & Relationship is conducted by one of our expert astrologer.",title2: "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",title3: "Waiting in queue for astrologer to get free.",title4: "Call completed", image: AppImages.relationship, title: "Relationship",detailsImage: AppImages.relationshipdetails,description: "In the intricate tapestry of relationships and family dynamics, Divine Connection offers compassionate guidance and support. Our team of certified online psychologists and counselors provides confidential therapy sessions tailored to address the complexities of interpersonal connections.Whether you're navigating conflicts, seeking to strengthen bonds, or grappling with communication barriers, we're here to help. Trust in our secure online platform to provide a safe space for exploration and healing, allowing you to cultivate healthier, more fulfilling relationships with your loved ones. With Divine Connection, you can embark on a journey towards greater harmony, understanding, and connection within your family and beyond."),
    EmotionModel(title1: "Your Depression is conducted by one of our expert astrologer.",title2: "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",title3: "Waiting in queue for astrologer to get free.",title4: "Call completed", image: AppImages.depression, title: "Depression",detailsImage: AppImages.depressiondetails,description: "At Divine Connection, we understand the weight of depression, and we're here to walk with you through it. Our team of certified online psychologists and counselors offers confidential therapy sessions tailored specifically to address the multifaceted nature of depression.Through compassionate guidance and evidence-based techniques, we help you navigate the complexities of depression, fostering resilience and empowering growth. Rest assured, our secure online platform provides a safe haven for exploration and healing, offering you the support and tools you need to rediscover your sense of hope and vitality. With Divine Connection, brighter days are within reach."),
    EmotionModel(title1: "Your Sleeping Problem is conducted by one of our expert astrologer.",title2: "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",title3: "Waiting in queue for astrologer to get free.",title4: "Call completed", image: AppImages.sleepemtion, title: "Sleep",detailsImage: AppImages.sleepdetails,description: "Unlock the secrets of restorative sleep with Divine Connection's expert guidance. Our certified online psychologists and counselors offer confidential therapy sessions tailored to address sleep-related issues such as insomnia, nightmares, or restless nights.Whether you're struggling to fall asleep or experiencing disruptions in your sleep patterns, we're here to help you reclaim peaceful nights and rejuvenating rest. Trust in our secure online platform to provide a safe space for exploration and healing, allowing you to discover effective strategies for better sleep hygiene and overall well-being. With Divine Connection, you can embark on a journey towards restful sleep and waking up refreshed."),
    EmotionModel(title1: "Your Stress Management is conducted by one of our expert astrologer.",title2: "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",title3: "Waiting in queue for astrologer to get free.",title4: "Call completed",image: AppImages.stress, title: "Stress Management",detailsImage: AppImages.stressdetails,description: "Unlock the secrets of restorative sleep with Divine Connection's expert guidance. Our certified online psychologists and counselors offer confidential therapy sessions tailored to address sleep-related issues such as insomnia, nightmares, or restless nights.Whether you're struggling to fall asleep or experiencing disruptions in your sleep patterns, we're here to help you reclaim peaceful nights and rejuvenating rest. Trust in our secure online platform to provide a safe space for exploration and healing, allowing you to discover effective strategies for better sleep hygiene and overall well-being. With Divine Connection, you can embark on a journey towards restful sleep and waking up refreshed."),
    EmotionModel(title1: "Your Career Counseling is conducted by one of our expert astrologer.",title2: "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",title3: "Waiting in queue for astrologer to get free.",title4: "Call completed", image: AppImages.pastemotion, title: "Past Trauma",detailsImage: AppImages.pastdetails,description: "Healing from past trauma is possible with Divine Connection's dedicated support and expertise. Our certified online psychologists and counselors offer confidential therapy sessions tailored to address the deep-seated wounds of past trauma. Through compassionate guidance and evidence-based techniques, we help you navigate the complexities of your past experiences, fostering resilience and empowering growth. Trust in our secure online platform to provide a safe space for exploration and healing, as you embark on a journey towards emotional freedom and restoration."),
    EmotionModel(title1: "Your Women Health is conducted by one of our expert astrologer.",title2: "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",title3: "Waiting in queue for astrologer to get free.",title4: "Call completed", image: AppImages.self, title: "Self-Esteem issues",detailsImage: AppImages.selfdetails,description: "Elevate your self-esteem with Divine Connection's compassionate guidance and expertise. Our certified online psychologists and counselors provide confidential therapy sessions tailored to address the complexities of self-esteem issues. Whether you're grappling with feelings of inadequacy, self-doubt, or low confidence, we're here to help you rediscover your worth and inner strength.Trust in our secure online platform to provide a safe space for exploration and healing, allowing you to cultivate a positive self-image and embrace your unique qualities. With Divine Connection, you can embark on a journey towards greater self-acceptance, empowerment, and fulfillment."),
    EmotionModel(title1: "Your Work Life Balance is conducted by one of our expert astrologer.",title2: "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",title3: "Waiting in queue for astrologer to get free.",title4: "Call completed", image: AppImages.work, title: "Work Life Balance",detailsImage:AppImages.workdetails,description: "Find harmony between work and life with Divine Connection's supportive guidance. Our certified online psychologists and counselors offer confidential therapy sessions tailored to help you navigate the challenges of balancing professional responsibilities with personal well-being.Whether you're feeling overwhelmed by work demands, struggling to prioritize self-care, or seeking to establish healthier boundaries, we're here to help you find equilibrium. Trust in our secure online platform to provide a safe space for exploration and healing, allowing you to cultivate a fulfilling and sustainable lifestyle. With Divine Connection, you can achieve greater harmony, fulfillment, and resilience in both your professional and personal spheres."),
    EmotionModel(title1: "Your Grief/Loss is conducted by one of our expert astrologer.",title2: "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",title3: "Waiting in queue for astrologer to get free.",title4: "Call completed", image: AppImages.loss, title: "Grief / Loss",detailsImage: AppImages.lossdetails,description: "Amidst the profound pain of grief and loss, Divine Connection offers a compassionate refuge. Our certified online psychologists and counselors provide confidential therapy sessions tailored to support you through the grieving process.Whether you're grappling with the loss of a loved one, a job, or a significant life transition, we're here to help you navigate the waves of sorrow and find solace. Trust in our secure online platform to provide a safe space for expression and healing, allowing you to honor your emotions and journey towards acceptance and resilience. With Divine Connection, you don't have to face grief alone."),
  ];
}