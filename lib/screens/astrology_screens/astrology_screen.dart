import 'package:divinecontrol/models/astrology_models/astrology_cardmodel.dart';
import 'package:divinecontrol/widgets/astrology_widgets/astrology_custom_card.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';

class AstrologyMainPage extends StatefulWidget {
  const AstrologyMainPage({super.key});

  @override
  State<AstrologyMainPage> createState() => _AstrologyMainPageState();
  static _AstrologyMainPageState? of(BuildContext context) =>
      context.findAncestorStateOfType<_AstrologyMainPageState>();

  static const List<AstrologyModel> items = [
    AstrologyModel(
        title1:
            'Your Marriage Consultation is conducted by one of our expert astrologer.',
        title2:
            "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",
        title3: "Waiting in queue for astrologer to get free.",
        title4: "Call completed",
        image: AppImages.marriage,
        title: 'Marriage Consultation',
        //value: 1,
        description:
            "Divine Connection's Marriage consultation involves professional guidance and support provided to couples seeking to enhance their relationship or resolve conflicts. Through open communication and empathetic listening, consultants help identify underlying issues, improve understanding, and develop effective communication and conflict resolution skills.They may offer techniques for managing stress, rebuilding trust, and fostering intimacy. Marriage consultants create a safe and supportive environment for couples to express themselves freely, explore emotions, and work collaboratively towards strengthening their bond."),
    AstrologyModel(
        title1:
            "Your Health Healing is conducted by one of our expert astrologer.",
        title2:
            "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",
        title3: "Waiting in queue for astrologer to get free.",
        title4: "Call completed",
        image: AppImages.health,
        title: 'Health Healing',
        //value: 1,
        description:
            "Divine Connection's Health healing involves restoring balance and vitality to the body, mind, and spirit. It encompasses holistic approaches to address physical ailments, mental health issues, and emotional well-being. Healing practices may include conventional medicine, alternative therapies, lifestyle changes, and spiritual practices.By addressing root causes rather than just symptoms, health healing promotes overall wellness and resilience. It emphasizes the body's innate ability to heal itself when supported with proper nutrition, exercise, rest, and stress management."),
    AstrologyModel(
        title1:
            "Your Wealth Management is conducted by one of our expert astrologer.",
        title2:
            "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",
        title3: "Waiting in queue for astrologer to get free.",
        title4: "Call completed",
        image: AppImages.wealth,
        title: 'Wealth Management',
        //value: 1,
        description:
            "Divine Connection's Wealth management involves the professional management of an individual's or family's financial assets and investments. It encompasses a holistic approach to financial planning, considering factors such as risk tolerance, financial goals, tax considerations, and estate planning.Wealth managers offer personalized advice and services tailored to each client's unique needs, aiming to grow and preserve wealth over the long term. Services may include investment management, retirement planning, estate planning, tax optimization, and philanthropic giving."),
    AstrologyModel(
        title1:
            "Your Love Insights is conducted by one of our expert astrologer.",
        title2:
            "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",
        title3: "Waiting in queue for astrologer to get free.",
        title4: "Call completed",
        image: AppImages.love,
        title: 'Love Insights',
        //value: 1,
        description:
            "Divine Connection's Love insights delve into understanding romantic relationships, emotions, and connections. They explore the dynamics of affection, compatibility, and intimacy between individuals. Through introspection and communication, love insights illuminate aspects such as communication styles, emotional needs, and relationship patterns.They help navigate challenges, foster deeper connections, and cultivate mutual understanding and respect. By recognizing personal values, desires, and boundaries, individuals can forge meaningful and fulfilling partnerships."),
    AstrologyModel(
        title1: "Your Educational Guidance is conducted by one of our expert astrologer.",
        title2:
            "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",
        title3: "Waiting in queue for astrologer to get free.",
        title4: "Call completed",
        image: AppImages.education,
        title: 'Educational Guidance',
        //value: 1,
        description: "Divine Connection's Educational guidance involves providing support and direction to individuals in their academic pursuits and personal development. It encompasses helping students make informed decisions about their educational pathways, career goals, and skill development.\nGuidance may include academic advising, career counseling, goal setting, and identifying learning opportunities tailored to individual needs and interests. Effective educational guidance fosters self-awareness, confidence, and motivation, empowering individuals to maximize their potential and achieve academic success."),
    AstrologyModel(
        title1:
            "Your Career Path is conducted by one of our expert astrologer.",
        title2:
            "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",
        title3: "Waiting in queue for astrologer to get free.",
        title4: "Call completed",
        image: AppImages.career,
        title: 'Career Path',
        //value: 1,
        description:
            "Using Divine Connection's career path is the journey an individual undertakes throughout their professional life, comprising their employment experiences, skill development, and advancement opportunities. It involves a series of steps and decisions, such as education, training, job changes, and promotions, aimed at achieving personal and professional goals.A well-defined career path aligns with one's interests, strengths, and aspirations, guiding progression towards fulfilling and rewarding roles. It may include lateral moves, upward mobility, or transitions between industries, all contributing to skill enhancement and expertise"),
    AstrologyModel(
        title1:
            "Your Business Strategies is conducted by one of our expert astrologer.",
        title2:
            "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",
        title3: "Waiting in queue for astrologer to get free.",
        title4: "Call completed",
        image: AppImages.business,
        title: 'Business Strategies',
        //value: 1,
        description:
            "Using Divine Connection's Business strategies are purposeful maneuvers and plans adopted by a company to attain its goals and outperform competitors in the market. They encompass decisions on product development, pricing, marketing, distribution, and resource allocation, all geared toward enhancing profitability and ensuring sustained growth over the long term.Effective strategies align with the company's mission and market dynamics, leveraging strengths while addressing weaknesses. By strategically positioning products or services, optimizing pricing strategies, and allocating resources efficiently, businesses aim to gain a competitive edge, capture market share."),
    AstrologyModel(
        title1:
            "Your Finance Planning is conducted by one of our expert astrologer.",
        title2:
            "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",
        title3: "Waiting in queue for astrologer to get free.",
        title4: "Call completed",
        image: AppImages.finance,
        title: 'Finance Planning',
       // value: 1,
        description:
            "Divine Connection's Financial planning involves the systematic process of assessing an individual's or organization's financial situation, goals, and resources to develop strategies for achieving desired outcomes. It encompasses budgeting, saving, investing, retirement planning, risk management, and estate planning.By analyzing income, expenses, assets, and liabilities, financial planners tailor strategies to optimize wealth accumulation, minimize financial risks, and ensure long-term financial security. Effective financial planning considers short-term needs while also addressing long-term objectives, such as funding education, buying a home, or retiring comfortably."),
    AstrologyModel(
        title1:
            "Your Legal Advice is conducted by one of our expert astrologer.",
        title2:
            "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",
        title3: "Waiting in queue for astrologer to get free.",
        title4: "Call completed",
        image: AppImages.legal,
        title: 'Legal Advice',
        //value: 1,
        description:
            "Divine Connection's Legal advice refers to professional guidance provided by qualified attorneys or legal experts regarding legal rights, responsibilities, and potential courses of action in specific situations. It involves interpreting laws, regulations, and precedents to offer informed recommendations tailored to individual circumstances.Legal advice covers various areas such as contracts, business transactions, family law, criminal defense, and more. It assists individuals, businesses, or organizations in understanding their legal standing, risks, and available options to make informed decisions."),
    AstrologyModel(
        title1:
            "Your Remedies Solution is conducted by one of our expert astrologer.",
        title2:
            "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",
        title3: "Waiting in queue for astrologer to get free.",
        title4: "Call completed",
        image: AppImages.remedies,
        title: 'Remedies & Solutions',
        //value: 1,
        description:
            "Divine Connection's Remedies are solutions or actions taken to address problems, resolve conflicts, or alleviate difficulties encountered in various situations. They can range from simple fixes to complex interventions tailored to specific issues.In legal contexts, remedies refer to measures taken to rectify breaches of contract or infringements of rights, such as compensation or injunctive relief. In healthcare, remedies may include medications, therapies, or lifestyle changes to treat illnesses or promote well-being."),
    AstrologyModel(
        title1:
            "Your Kids Fortune Prediction is conducted by one of our expert astrologer",
        title2:
            "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",
        title3: "Waiting in queue for astrologer to get free.",
        title4: "Call completed",
        image: AppImages.kids,
        title: 'Kids Fortune Prediction',
        //value: 1,
        description:
            "Divine Connection's Kids' fortune prediction involves forecasting a child's potential future based on astrological principles, examining celestial configurations at birth. It aims to provide insights into their personality traits, talents, challenges, and life paths.While not deterministic, it offers guidance for parents in nurturing their child's development and understanding their unique inclinations. This practice often considers factors like the child's sun sign, rising sign, and planetary placements to offer personalized guidance."),
    AstrologyModel(
        title1:
            "Your Parenting Tips is conducted by one of our expert astrologer.",
        title2:
            "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",
        title3: "Waiting in queue for astrologer to get free.",
        title4: "Call completed",
        image: AppImages.parent,
        title: 'Parenting Tips',
        //value: 1,
        description:
            "Divine Connection's Parenting involves nurturing and guiding children towards healthy development. Encourage open communication, fostering trust and understanding. Set clear boundaries while allowing independence and autonomy within age-appropriate limits. Practice positive reinforcement to reinforce desired behaviors and provide constructive feedback.Prioritize quality time together, engaging in activities that promote bonding and mutual respect. Lead by example, demonstrating kindness, empathy, and resilience. Stay attuned to your child's emotions and needs, offering support and validation."),
    AstrologyModel(
        title1:
            "Your Panchang Analysis is conducted by one of our expert astrologer.",
        title2:
            "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",
        title3: "Waiting in queue for astrologer to get free.",
        title4: "Call completed",
        image: AppImages.panchang,
        title: 'Panchang Analysis',
        //value: 1,
        description:
            "Divine Connection's Panchang analysis is a traditional Hindu practice involving the study of the Panchang, a comprehensive astrological calendar. It includes detailed information on planetary positions, lunar phases, auspicious and inauspicious timings, and religious events. Through this analysis, individuals and communities assess favorable moments for important activities like weddings, housewarming ceremonies, and business ventures.It also guides in observing religious festivals and conducting rituals at auspicious times. Panchang analysis aids in aligning actions with cosmic energies, promoting harmony, success, and spiritual well-being."),
    AstrologyModel(
        title1:
            "Your Birth Chart Interpretation is conducted by one of our expert astrologer.",
        title2:
            "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",
        title3: "Waiting in queue for astrologer to get free.",
        title4: "Call completed",
        image: AppImages.birthchart,
        title: 'Birth Chart Interpretation',
        //value: 1,
        description:
            "Using Divine Connection's Birth chart interpretation is a deep analysis of celestial bodies' positions at an individual's birth, including the Sun, Moon, planets, and astrological points. It unveils personality traits, strengths, weaknesses, and potential life experiences. This profound understanding of one's cosmic blueprint enables effective navigation through life's challenges and opportunities.By decoding the unique alignment of the stars and planets, individuals gain insight into their purpose, relationships, career paths, and personal development. It serves as a guiding tool for self-discovery, growth, and making informed decisions aligned with one's inherent nature and destiny, fostering a fulfilling and harmonious life journey."),
    AstrologyModel(
        title1:
            "Your Shubh Muhurat is conducted by one of our expert astrologer.",
        title2:
            "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",
        title3: "Waiting in queue for astrologer to get free.",
        title4: "Call completed",
        image: AppImages.shubh,
        title: 'Shubh Muhurat',
        //value: 1,
        description:
            "Divine Connection's Shubh Muhurat, in Hindu tradition, signifies auspicious timings or moments aligned with planetary positions deemed favorable for various activities like weddings, inaugurations, or religious ceremonies. These timings are determined by Vedic astrological calculations, considering factors like planetary alignments, lunar phases, and other astrological parameters.Observing Shubh Muhurat is believed to bring blessings, harmony, and success to endeavors, ensuring they commence under auspicious cosmic influences."),
    AstrologyModel(
        title1:
            "Your Personalized Pooja is conducted by one of our expert astrologer.",
        title2:
            "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",
        title3: "Waiting in queue for astrologer to get free.",
        title4: "Call completed",
        image: AppImages.personalized,
        title: 'Personalized Pooja',
       // value: 1,
        description:
            "Divine Connection's Personalized pooja involves tailoring traditional Hindu rituals and prayers to an individual's specific needs, desires, or circumstances. It could include selecting particular deities, mantras, offerings, and rituals based on one's spiritual goals, challenges, or blessings sought.This customization allows for a more intimate and meaningful connection with the divine, fostering a deeper sense of devotion, gratitude, and spiritual growth. Whether performed for seeking blessings, resolving obstacles, or expressing gratitude."),
    AstrologyModel(
        title1:
            "Your Theta Healing is conducted by one of our expert astrologer.",
        title2:
            "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",
        title3: "Waiting in queue for astrologer to get free.",
        title4: "Call completed",
        image: AppImages.theta,
        title: 'Theta Healing',
        //value: 1,
        description:
            "Divine Connection's Theta Healing is a holistic healing technique rooted in accessing the theta brainwave state to facilitate profound emotional, physical, and spiritual transformations. Practitioners use focused intention and visualization to identify and release limiting beliefs stored in the subconscious mind, replacing them with empowering beliefs.By harnessing the theta brainwave frequency, individuals can address deeply rooted issues, heal past traumas, and manifest desired outcomes."),
    AstrologyModel(
        title1:
            "Your Reiki Healing is conducted by one of our expert astrologer.",
        title2:
            "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",
        title3: "Waiting in queue for astrologer to get free.",
        title4: "Call completed",
        image: AppImages.reki,
        title: 'Reiki Healing',
        //value: 1,
        description:
            "Divine Connection's Reiki Healing is a holistic practice that channels universal life force energy to promote physical, emotional, and spiritual well-being. Practitioners use gentle touch or hands hovering over the body to transfer this energy, stimulating the body's natural healing processes.Reiki aims to balance the energy centers (chakras) within the body, releasing blockages and restoring harmony. It can alleviate stress, reduce pain, accelerate recovery from illness or injury, and enhance overall vitality."),
    AstrologyModel(
        title1:
            "Your Chakra Healing is conducted by one of our expert astrologer.",
        title2:
            "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",
        title3: "Waiting in queue for astrologer to get free.",
        title4: "Call completed",
        image: AppImages.chakra,
        title: 'Chakra Healing',
        //value: 1,
        description:
            "Divine Connection's Chakra healing is a holistic practice rooted in Eastern philosophy, aiming to balance the body's energy centers or chakras. These seven energy points, aligned along the spine, are believed to correspond to physical, emotional, and spiritual aspects of life. Through various techniques like meditation, yoga, Reiki, and crystal therapy, practitioners seek to remove blockages and restore harmony within the chakras.Chakra healing acknowledges the interconnectedness of mind, body, and spirit, offering a pathway to holistic health and self-awareness."),
    AstrologyModel(
        title1:
            "Your Crystal Healing is conducted by one of our expert astrologer.",
        title2:
            "You'll recieve comprehensive insights and guidance tailored to your specific questions and concerns.",
        title3: "Waiting in queue for astrologer to get free.",
        title4: "Call completed",
        image: AppImages.crystal,
        title: 'Crystal Healing',
        //value: 1,
        description:
            "Our Divine Connection's Crystal healing is a holistic practice that utilizes the energetic properties of crystals to promote healing and balance in the mind, body, and spirit. Believers assert that each crystal emits a unique vibration that can interact with the body's energy fields, facilitating physical, emotional, and spiritual well-being.Practitioners may place crystals on or around the body, incorporate them into meditation or rituals, or wear them as jewelry. While scientific evidence supporting crystal healing's efficacy is limited, many find it beneficial for relaxation, stress relief, and enhancing mindfulness."),
  ];
}

class _AstrologyMainPageState extends State<AstrologyMainPage> {
  int _index = 0;
  set index(int index) => setState(() {
        _index = index;
      });
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
      appBar: const CustomAppBar(title: "Astrology", leading: true),
      body: Column(
        children: [
         // const CustomToggleButton(),
         CustomAstrologyToggleButton(index: _index, callBack: (value){
          setState(() {
            _index=value;
          });
         
         }),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: width < AppConstants.maxMobileWidth
                        ? 2
                        : width < AppConstants.maxTabletWidth
                            ? 2
                            : 3,
                    mainAxisSpacing:
                        width < AppConstants.maxMobileWidth ? 5 : 15,
                    crossAxisSpacing:
                        width < AppConstants.maxMobileWidth ? 5 : 15),
                itemCount: AstrologyMainPage.items.length,
                itemBuilder: (context, index) {
                  return AstrologyCustomCard(index: _index,
                    astrologyModel: AstrologyMainPage.items[index],
                   
                  );
                }),
          )
        ],
      ),
    );
  }
}



typedef void IntCallBack(int value);

class CustomAstrologyToggleButton extends StatefulWidget {
  CustomAstrologyToggleButton(
      {super.key, required this.index, required this.callBack});
  int index;
  final IntCallBack callBack;

  @override
  State<CustomAstrologyToggleButton> createState() =>
      _CustomAstrologyToggleButtonState();
}

class _CustomAstrologyToggleButtonState
    extends State<CustomAstrologyToggleButton> {
  List<bool> isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadiusDirectional.circular(15)),
      child: ToggleButtons(
        isSelected: isSelected,
        selectedColor: AppColors.white,

        color: Colors.black.withOpacity(0.7),
        //fillColor: AppColors.black,
        renderBorder: true,
        borderRadius: BorderRadius.circular(16),
        borderWidth: 3,
        //splashColor: AppColors.lightPurple2,

         children: [
          Padding(
            padding: width<AppConstants.maxTabletWidth?const EdgeInsets.symmetric(horizontal: 10, vertical: 5):const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
            child: Row(
              children: [
                 const Icon(
                  Icons.phone,
                  color: Colors.blue,
                  size: 32,
                ),
                Text(
                  'call',
                  style:width<AppConstants.maxTabletWidth? AppStyles.styleBold24(context)
                      .copyWith(color: AppColors.black):AppStyles.styleBold32(context).copyWith(color: AppColors.black),
                )
              ],
            ),
          ),
          Padding(
              padding: width<AppConstants.maxTabletWidth?const EdgeInsets.symmetric(horizontal: 10, vertical: 5):const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
            child: Row(
              children: [
                               Image.asset(AppImages.chat),

                Text(
                  'chat',
                  style:width<AppConstants.maxTabletWidth? AppStyles.styleBold24(context)
                      .copyWith(color: AppColors.black):AppStyles.styleBold32(context).copyWith(color: AppColors.black),
                )
              ],
            ),
          )
        ],
        onPressed: (newIndex) {
          setState(() {
            for (int i = 0; i < isSelected.length; i++) {
              if (i == newIndex) {
                isSelected[i] = true;
                widget.index = i;
              } else {
                isSelected[i] = false;
              }
              
              widget.callBack(widget.index);
              AstrologyMainPage.of(context)!.index = widget.index;
            }
          });
        },
      ),
    );
  }
}
