import 'dart:developer';

import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/widgets/tarotreading_widgets/custom_search_textfield.dart';
import 'package:divinecontrol/widgets/tarotreading_widgets/result_cards_data.dart';
import 'package:flutter/material.dart';

import '../../models/tarotreading_models/gridview_item_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import 'tarot_read_body_gridview.dart';

class TarotReadViewBody extends StatefulWidget {
  const TarotReadViewBody({super.key});

  @override
  State<TarotReadViewBody> createState() => _TarotReadViewBodyState();
}

class _TarotReadViewBodyState extends State<TarotReadViewBody> {
  TextEditingController searchController = TextEditingController();

 List<GridViewItemModel>  searchList(String query,List<GridViewItemModel> items){
  return items.where((element){
      final tarotTitle=element.title.toLowerCase();
      // final tarotDescription=element.description.toLowerCase();
      final input=query.toLowerCase();
      return tarotTitle.contains(input);
    }).toList();
   
   
  }

  @override
  Widget build(BuildContext context) {
    log(searchController.text);
   
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return width < AppConstants.maxTabletWidth
        ? getMobileTarotWidget(width, height)
        : getDesktopTarotBody(height, width);
  }

  Container getMobileTarotWidget(double width, double height) {
    return Container(
      padding: width < AppConstants.maxMobileWidth
          ? EdgeInsets.symmetric(horizontal: width / 20, vertical: height / 40)
          : const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.lightPurple1,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          // SizedBox(height: 5),
          CustomSearchTextField(
              onChanged: (value) {
                setState(() {
                  searchController.text = value;
                });
              },
              controller: searchController,
              labelText: 'Enter Your Question',
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.darkPrimary,
                size: width < AppConstants.maxMobileWidth ? 30 : 50,
              ),
              hintText: 'your question'),
          const SizedBox(
            height: 10,
          ),
         
          TarotBodyGridView(items: searchList(searchController.text, items)),

          
        ],
      ),
    );
  }

  
  Container getDesktopTarotBody(double height, double width) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      decoration: BoxDecoration(
          color: AppColors.lightPurple1,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height / 40),
          Container(
            width: width * 0.5,
            margin: const EdgeInsets.only(left: 10),
            child: CustomSearchTextField(
                onChanged: (value) {
                  setState(() {
                    searchController.text = value;
                  });
                },
                controller: searchController,
                labelText: 'Enter Your Question',
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.darkPrimary,
                  size: width < AppConstants.maxMobileWidth ? 30 : 50,
                ),
                hintText: 'your question'),
          ),
          const SizedBox(
            height: 35,
          ),
          // const SizedBox(
          //   height: 35,
          // ),
          // const TarotReadingTitle(),
          const SizedBox(
            height: 45,
          ),
          TarotBodyGridView(items: searchList(searchController.text, items),),
          // const SizedBox(
          //   height: 40,
          // ),
          // const SeeMore(),
        ],
      ),
    );
  }

  List<GridViewItemModel> items = [
    GridViewItemModel(
        image: AppImages.dailytarot,
        imageBg: AppImages.dailytarotBg,
        title: "Daily tarot",
        subTitle: "Your Daily Tarot: Insight and Direction",
        description:
            "Find out what energies will shape your day. Let the tarot guide you to a successful and fulfilling day.",
        // likesNumber: 15,
        // seeNumber: 10,
        results: resultCards,
        // cardTitle: "The Hermit",
        // details:
        //     "The Hermit embodies introspection, solitude, and a time for seeking knowledge and self-discovery. He signifies a period of withdrawal from the external world to delve into your inner landscape. This card encourages you to embrace quiet reflection, explore your thoughts and feelings, and gain wisdom through personal exploration.Positive Interpretations: Taking time for introspection and self-reflection, finding wisdom through solitude, seeking knowledge and understanding, connecting with your inner guidance, enjoying a period of peace and quiet contemplation.Shadow Meanings: Isolation leading to loneliness or depression, avoiding your problems or responsibilities, difficulty connecting with others, clinging to the past or outdated beliefs, fear of intimacy or vulnerability.",
        // detailsTitle: "Introspection, Solitude, and Seeking Knowledge"
        ),
    GridViewItemModel(
        image: AppImages.loveReadingCard,
        imageBg: AppImages.weekendtarotBg,
        title: "Love Reading",
        subTitle: "Reveal Your Romantic Future with Tarot",
        description:
            "Discover the steps to a fulfilling romantic journey. Let tarot reveal the way to lasting love and happiness.",
        // likesNumber: 15,
        // seeNumber: 10,
                results: resultCards,

        // cardTitle: "The Hermit",
        // details:
        //     "On a deeper level, the Hermit signifies a time of seeking spiritual guidance and illumination. He represents a journey of self-discovery that leads to a deeper understanding of yourself and your place in the world. This card encourages you to connect with your higher self, seek spiritual knowledge, and find meaning on a deeper level.Positive Interpretations: Seeking spiritual guidance and enlightenment, experiencing a period of spiritual growth, connecting with your higher self, finding meaning and purpose in life, gaining wisdom through introspection.Shadow Meanings: Feeling lost or lacking direction spiritually, searching for answers externally, disconnection from your intuition or spiritual path, clinging to dogma or outdated religious beliefs, feeling disillusioned with your spiritual journey.",
        // detailsTitle: "Spiritual Guidance and Illumination"
        ),
    GridViewItemModel(
        image: AppImages.yoga,
        imageBg: AppImages.weeklytarotBg,
        title: "Wellness fortune",
        subTitle: "Nurture Your Well-Being with Tarot Insights",
        description:
            "Unveil the influences shaping your health and well-being. Use tarot to achieve a healthier, more fulfilling life.",
        // likesNumber: 15,
        // seeNumber: 10,
                results: resultCards,

        // cardTitle: "The Temperance",
        // details:
        //     "Temperance can also represent healing, patience, and finding harmony within yourself and with others. It signifies a time to approach situations with calmness and understanding, allowing yourself time to heal, and fostering peace in your relationships. This card encourages you to be patient, trust the healing process, and find a sense of inner peace.Positive Interpretations: Experiencing emotional or physical healing, practicing patience and allowing time for things to unfold, finding harmony and peaceful resolutions in relationships, approaching challenges with a calm and collected demeanor, finding balance and peace within yourself.Shadow Meanings: Rushing the healing process or forcing solutions, impatience leading to frustration or mistakes, struggling to forgive yourself or others, difficulty finding common ground or resolving conflict, feeling inner turmoil or disharmony.",
        // detailsTitle: "Healing, Patience, and Finding Harmony"
        ),
    GridViewItemModel(
        image: AppImages.whereistarot,
        imageBg: AppImages.whereistarotBg,
        title: "Where is my destined partner?",
        subTitle:
            "Hold on tight. You're about to uncover some juicy intel about your destined partner!",
        description:
            "Want a hint? Let the wisdom of Tarot guide you, my friend.",
        // likesNumber: 15,
        // seeNumber: 10,
                results: resultCards,

        // cardTitle: "The Hanged Man",
        // details:
        //     "On a deeper level, the Hanged Man signifies finding inner peace, trusting your intuition, and connecting with your spiritual side. It represents a time of quiet contemplation, receiving inspiration through a state of receptivity, and aligning yourself with a higher purpose. This card encourages you to tap into your intuition, listen to your inner voice, and find peace within yourself.Positive Interpretations: Finding inner peace and acceptance, connecting with your intuition and inner wisdom, receiving guidance and inspiration from a higher source, experiencing a period of spiritual awakening, aligning yourself with your true purpose.Shadow Meanings: Disconnection from your intuition or spiritual side, overthinking or relying solely on logic, difficulty quieting your mind and achieving inner peace, feeling lost or lacking direction spiritually, resistance to letting go and trusting your intuition.",
        // detailsTitle: "Inner Peace, Intuition, and Connection to the Divine"
        ),
    GridViewItemModel(
        image: AppImages.careertarot,
        imageBg: AppImages.careertarotBg,
        title: "Career",
        subTitle: "Discover the Path to Career Success",
        description:
            "Explore the influences impacting your career. Let the tarot provide insights for your professional growth and success.",
        // likesNumber: 15,
        // seeNumber: 10,
                results: resultCards,

        // cardTitle: "The Wheel of Fortune",
        // details:
        //     "The Wheel of Fortune reminds you that life is full of opportunities, some planned and some unexpected. It signifies a time to embrace change as a catalyst for growth, take calculated risks, and step outside your comfort zone. Trust that even setbacks can lead to positive outcomes if you approach them with an open mind.Positive Interpretations: Taking calculated risks to achieve your goals, seeing change as an opportunity for growth, embracing new experiences with an open mind, trusting your intuition and taking a leap of faith, letting go of the need for control.Shadow Meanings: Fear of taking risks and holding back on opportunities, clinging to stability and security, missing out on opportunities due to hesitation, gambling recklessly without considering the consequences, trying to force outcomes instead of going with the flow.",
        // detailsTitle: "Taking Risks and Embracing New Opportunities"
        ),
    GridViewItemModel(
        image: AppImages.financestarot,
        imageBg: AppImages.financestarotBg,
        title: "Finances",
        subTitle: "Chart Your Financial Future with Tarot",
        description:
            "See what the cards say about your monetary journey. Prepare for financial success with tarot guidance.",
        // likesNumber: 15,
        // seeNumber: 10,
                results: resultCards,

        // cardTitle: "The High Priestess",
        // details:
        //     "The High Priestess embodies the power of intuition, the mysteries of the subconscious, and the secrets that lie hidden within us. She signifies a time to tap into your inner wisdom, trust your gut feelings, and explore the depths of your psyche. This card encourages you to pay attention to your dreams, synchronicities, and intuitive nudges.Positive Interpretations: Connecting with your inner wisdom, following your intuition, having a strong gut feeling, unearthing hidden knowledge, exploring the mysteries of life.Shadow Meanings: Ignoring your intuition, rationalizing your feelings, feeling lost or disconnected from your inner self, dwelling on the unknown, fear of the subconscious.",
        // detailsTitle: "Intuition, Secrets, and the Subconscious"
        ),
    GridViewItemModel(
        image: AppImages.changetarot,
        imageBg: AppImages.changetarotBg,
        title: "How to change my luck?",
        subTitle: "Harness Tarot Wisdom to Change Your Luck",
        description:
            "Explore the tarot's guidance to attract better luck. Empower yourself with the knowledge to alter your destiny.",
        // likesNumber: 15,
        // seeNumber: 10,
                results: resultCards,

        // cardTitle: "The Hierophant",
        // details:
        //     "The Hierophant also emphasizes making choices based on your core values and beliefs. He signifies a time to stand up for what you believe in, even if it goes against the crowd. This card encourages you to examine your moral compass, act with integrity, and stay true to your convictions.Positive Interpretations: Living authentically according to your values, having strong moral principles, making decisions based on what's right, standing up for what you believe in, being a force for positive change.Shadow Meanings: Being overly judgmental or self-righteous, forcing your beliefs on others, conformity to avoid conflict, hypocrisy (saying one thing but doing another), making decisions out of fear of judgment.",
        // detailsTitle: "Making Choices Based on Values and Beliefs"
        ),
    GridViewItemModel(
        image: AppImages.hiddentarot,
        imageBg: AppImages.hiddentarotBg,
        title: "My hidden charm",
        subTitle: "Discover the Magic of Your Hidden Charms",
        description:
            "Find out what makes you uniquely captivating. Allow tarot to illuminate the charm you hold beneath the surface.",
        // likesNumber: 15,
        // seeNumber: 10,
                results: resultCards,

        // cardTitle: "The Wheel of Fortune",
        // details:
        //     "The Wheel of Fortune reminds you that life is full of opportunities, some planned and some unexpected. It signifies a time to embrace change as a catalyst for growth, take calculated risks, and step outside your comfort zone. Trust that even setbacks can lead to positive outcomes if you approach them with an open mind.Positive Interpretations: Taking calculated risks to achieve your goals, seeing change as an opportunity for growth, embracing new experiences with an open mind, trusting your intuition and taking a leap of faith, letting go of the need for control.Shadow Meanings: Fear of taking risks and holding back on opportunities, clinging to stability and security, missing out on opportunities due to hesitation, gambling recklessly without considering the consequences, trying to force outcomes instead of going with the flow.",
        // detailsTitle: "The Wheel of Fortune"
        ),
    GridViewItemModel(
        image: AppImages.lifeclaritytarot,
        imageBg: AppImages.lifeclaritytarotBg,
        title: "Life clarity",
        subTitle: "See Through the Fog with Life Clarity Tarot",
        description:
            "Let tarot dispel confusion and reveal the way forward. Embrace a clearer vision for your life's journey.",
        // likesNumber: 15,
        // seeNumber: 10,
                results: resultCards,

        // cardTitle: "The Hermit",
        // details:
        //     "On a deeper level, the Hermit signifies a time of seeking spiritual guidance and illumination. He represents a journey of self-discovery that leads to a deeper understanding of yourself and your place in the world. This card encourages you to connect with your higher self, seek spiritual knowledge, and find meaning on a deeper level.Positive Interpretations: Seeking spiritual guidance and enlightenment, experiencing a period of spiritual growth, connecting with your higher self, finding meaning and purpose in life, gaining wisdom through introspection.Shadow Meanings: Feeling lost or lacking direction spiritually, searching for answers externally, disconnection from your intuition or spiritual path, clinging to dogma or outdated religious beliefs, feeling disillusioned with your spiritual journey.",
        // detailsTitle: "Spiritual Guidance and Illumination"
        ),
    GridViewItemModel(
        image: AppImages.wellness,
        imageBg: AppImages.lifelessonsBg,
        title: "Spiritual Learning",
        subTitle: "Tarot Wisdom for Spiritual Enlightenment",
        description:
            "Dive into the depths of your spiritual journey. Let tarot guide you towards enlightenment and growth.",
        // likesNumber: 15,
        // seeNumber: 10,
                results: resultCards,

        // cardTitle: "The Empress",
        // details:
        //     "The Empress embodies the essence of abundance, creativity, and nurturing energy. She signifies a time of growth, prosperity, and expressing your talents freely. This card encourages you to cultivate your creativity, enjoy the fruits of your labor, and share your abundance with others.Positive Interpretations: Feeling a sense of abundance and security, experiencing a creative flow, expressing yourself creatively, nurturing yourself and others, finding joy in the simple things.Shadow Meanings: Overindulgence or materialism, creativity block or lack of inspiration, smothering others with your care, neglecting your own needs, difficulty letting go and allowing others to grow.",
        // detailsTitle: "Abundance, Creativity, and Nurturing"
        ),
    GridViewItemModel(
        image: AppImages.breakupAdviceCard,
        imageBg: AppImages.feeltarotBg,
        title: "Break-up Advice",
        subTitle: "Healing Heartbreak with Tarot Wisdom",
        description:
            "Seek guidance and healing through tarot after a relationship ends. Find the wisdom to mend your heart.",
        // likesNumber: 15,
        // seeNumber: 10,
                results: resultCards,

        // cardTitle: "The Wheel of Fortune",
        // details:
        //     "The Wheel of Fortune also reflects the law of karma and the principle of 'what goes around comes around.' It signifies that your actions and choices have consequences, both positive and negative. This card encourages you to take responsibility for your choices, cultivate positive intentions, and trust that you will reap what you sow.Positive Interpretations: Experiencing the results of your past actions, positive karma leading to good fortune, learning from mistakes and growing through challenges, taking responsibility for your life path, planting good seeds for future happiness.Shadow Meanings: Reaping the consequences of negative actions, feeling like a victim of circumstance, blaming others for your problems, ignoring the law of attraction, making choices without considering the consequences.",
        // detailsTitle: "Karma and the Law of Attraction"
        ),
    GridViewItemModel(
        image: AppImages.reservedtarot,
        imageBg: AppImages.reservedtarotBg,
        title: "Reversed tarot card",
        subTitle: "Reversed Tarot: Flipping Perspectives",
        description:
            "Explore unexpected twists and revelations in tarot readings. Embrace the lessons and opportunities of reversed cards.",
        // likesNumber: 15,
        // seeNumber: 10,
                results: resultCards,

        // cardTitle: "The Lovers",
        // details:
        //     "On a deeper level, The Lovers represents a spiritual connection or meeting your soul mate. It signifies a time of deep love, shared values, and a sense of destiny. This card can also symbolize a profound connection with yourself, a sense of wholeness, and coming into alignment with your true purpose.Positive Interpretations: Experiencing a soul mate connection, finding deep love and understanding with another, feeling a sense of destiny or synchronicity, developing a strong spiritual connection with yourself or others, living a life true to your authentic self.Shadow Meanings: Mistaking infatuation for true love, clinging to a fantasy relationship, unrealistic expectations in love, seeking fulfillment solely from external sources, feeling disconnected from your soul purpose.",
        // detailsTitle: "Spiritual Connection and Soul Mates"
        ),
  ];
}
