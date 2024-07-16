import 'package:divinecontrol/animation/card_page_question.dart';
import 'package:divinecontrol/animation/card_page_tablet_question.dart';
import 'package:divinecontrol/models/tarotreading_models/gridview_item_model.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_images.dart';
import 'package:divinecontrol/widgets/tarotreading_widgets/custom_search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomSearchQuestionCard extends StatefulWidget {
  const CustomSearchQuestionCard({super.key,required this.itemModel,});
  final GridViewItemModel itemModel;
  

  @override
  State<CustomSearchQuestionCard> createState() => _CustomSearchQuestionCardState();
}

class _CustomSearchQuestionCardState extends State<CustomSearchQuestionCard> {
  TextEditingController searchController=TextEditingController();
// List<GridViewItemModel> searchList(
//       String query, List<GridViewItemModel> items) {
//     return items.where((element) {
//       final tarotTitle = element.title.toLowerCase();
//       // final tarotDescription=element.description.toLowerCase();
//       final input = query.toLowerCase();
//       return tarotTitle.contains(input);
//     }).toList();
//   }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return getNewMobileCustomSearchQuestionCard(context, width, height);
  }

  Widget getNewMobileCustomSearchQuestionCard(
      BuildContext context, double width, double height) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.hardEdge,
      child: Container(
        width: width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: width,
                  height:width<AppConstants.maxMobileWidth? height / 8:width<AppConstants.maxTabletWidth? height/10:height/5,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    AppColors.darkPrimary,
                    AppColors.primary,
                    AppColors.darkPrimary
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
                 child: Image.asset(AppImages.whereistarotBg,fit: BoxFit.fill,)
                ),
                Positioned(

                  // child: Image.asset(itemModel.image),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: SizedBox(
                        width:width<AppConstants.maxMobileWidth? width * 0.16:width<AppConstants.maxTabletWidth? width*0.1:width*0.065,
                        child: Image.asset(
                          AppImages.newcard,
                          fit: BoxFit.fill,
                        )),
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  Text("Think Deeply And Ask Your Qusetion",
                      textAlign: TextAlign.center,
                      style: AppStyles.styleRufinaBold32(context).copyWith(
                          color: AppColors.darkPrimary,
                          fontWeight: FontWeight.w900,
                          fontSize: getResponsiveFontSizeText(context,
                              fontSize: width < AppConstants.maxMobileWidth
                                  ? 20
                                  :width<AppConstants.maxTabletWidth? 24:28))),
                  Text(
                    "The Universe speaks in whispers.Tune in with the Tarot and hear its message.✨\nUncover your journey.Tune in to Know the secret of your fate !!",
                    // "The Universe speaks in whispers.\nTune in with the Tarot and hear its message.✨",textAlign: TextAlign.center,
                    style: AppStyles.styleRegular20(context).copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize:
                            getResponsiveFontSizeText(context, fontSize:width<AppConstants.maxMobileWidth? 18:width<AppConstants.maxTabletWidth? 20:24)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                
                ],
              ),
            ),
              Padding(
                    padding:width<AppConstants.maxMobileWidth?
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5):const EdgeInsets.symmetric(horizontal: 2,vertical: 5),
                    child: CustomSearchTextField(
                        labelText: "Ask Me",
                        controller:searchController ,
                        //maxLines:width<AppConstants.maxMobileWidth? 2:1,
                        prefixIcon: const Icon(FontAwesomeIcons.searchengin),
                        hintText: "What Do You Think",
                        onChanged: (value){
                          setState(() {
                            searchController.text=value;
                          });
                        },
                        onSubmitted: (value){
                          setState(() {
                            searchController.text=value;
                          });
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return width<AppConstants.maxMobileWidth? CardsPageQuestion(title: searchController.text,itemModel:widget.itemModel ,):CardsPageTabletQuestion(title: searchController.text,itemModel:widget.itemModel ,);
                          }));
                          
                        },
                        ),
                        
                  ),
          ],
        ),
      ),
    );
  }
}
