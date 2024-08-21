import 'dart:convert';

import 'package:divinecontrol/widgets/dream_meaning_widgets/history_button.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../models/dream_meaning.models/dream_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';
import '../../widgets/dream_meaning_widgets/custom_dropdown_list.dart';

class DreamMeaning extends StatefulWidget {
  const DreamMeaning({super.key});

  @override
  State<DreamMeaning> createState() => _DreamMeaningState();
  static _DreamMeaningState? of(BuildContext context)=>context.findAncestorStateOfType<_DreamMeaningState>();
}

class _DreamMeaningState extends State<DreamMeaning> {
  String? dreamDescription = "No Dreams";
  
  TextEditingController controller=TextEditingController();

 Future<List<Dream>> getDreams() async{
    String data=await DefaultAssetBundle.of(context).loadString("assets/jsonfiles/Query.json");
   List mapData=jsonDecode(data); 
   List<Dream> dreams=mapData.map((dream) =>Dream.fromJson(dream) ).toList();
   return dreams;
  }
  @override
  void dispose() {
  controller.dispose();
    super.dispose();
  }
  @override
  void initState() {
    getDreams();
    super.initState();
  }

  String _selected="";
  set string(String value){
    setState(() {
      _selected=value;
    });
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: const CustomAppBar(title: "Dream Meaning", leading: true),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.lightPurple1,
            borderRadius: BorderRadius.circular(5)),
        child: FutureBuilder<List<Dream>>(future: getDreams(), builder: (context,snapshot){
          if(snapshot.hasData){
            List<Dream> myDreams=snapshot.data!;
            return getDreamMeaning(width, height, context,myDreams);
        

          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        })
      ),
    );
  }

  

  Column getDreamMeaning(double width, double height, BuildContext context,List<Dream> myDreams) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          const SizedBox(
            height: 10,
          ),
          CustomDropdownList(
            callBack: (selectedValue){
              setState(() {
                _selected=selectedValue;
              });
            },
          dreamTitles: myDreams.map((e) => e.word!).toList(),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width:width<AppConstants.maxMobileWidth? width * 0.9:width,
            height:width<AppConstants.maxMobileWidth? height * 0.65:height*0.7,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: Colors.black54)),
            child: Column(
              children: [

                Row(
                  children: [
                    Text(
                      "YourDream :",
                      style: width < AppConstants.maxMobileWidth
                          ? AppStyles.styleBold24(context).copyWith(
                              fontSize: getResponsiveFontSizeText(context,
                                  fontSize: 20))
                          : AppStyles.styleBold32(context)
                              .copyWith(color: AppColors.black),
                    ),
                    const SizedBox(width: 2,),
                    SizedBox(
                      width: width*0.5,
                      child: Text(_selected,
                          style: width < AppConstants.maxMobileWidth
                              ? AppStyles.styleRegular20(context)
                              : AppStyles.styleRegular20(context).copyWith(
                                  fontSize: getResponsiveFontSizeText(context,
                                      fontSize: 28)),
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Meaning :',
                    style: width < AppConstants.maxMobileWidth
                        ? AppStyles.styleBold24(context).copyWith(
                            fontSize: getResponsiveFontSizeText(context,
                                fontSize: 20))
                        : AppStyles.styleBold32(context)
                            .copyWith(color: AppColors.black),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                  

                   Text(dreamDescription!,
                      
                        style: AppStyles.styleRegular20(context).copyWith(
                          fontSize: getResponsiveFontSizeText(context,
                              fontSize:
                                  width < AppConstants.maxMobileWidth ? 18 : 28),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Transform.scale(
                scale: 1.2,
                child: CustomButton(
                    onPressed: () {
                    for (var dream in myDreams) {
                      if(dream.word==_selected){
                        setState(() {
                          dreamDescription=dream.defParagraph;
                        });
                      }
                    }  
                    
                    
                    },
                    title: "Interpret"),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      );
  }
}
