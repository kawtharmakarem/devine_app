import 'dart:convert';

import 'package:divinecontrol/models/numerlogy_models/numer_table_model.dart';
import 'package:divinecontrol/models/numerlogy_models/numerology_model.dart';
import 'package:divinecontrol/screens/numerology_screens/numerology_details_screen.dart';
import 'package:divinecontrol/widgets/homepage_widgets/custom_appbar.dart';
import 'package:divinecontrol/widgets/numerology_widgets/custom_table_widet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_images.dart';
import '../../widgets/numerology_widgets/custom_numerlogy_card.dart';

class Numerology extends StatefulWidget {
  const Numerology({super.key});

  @override
  State<Numerology> createState() => _NumerologyState();

 
}

class _NumerologyState extends State<Numerology> {
  int? id;
  // List<NumerologyTableModel> items = [
  //   NumerologyTableModel(
  //       image: AppImages.luckyNumbers,
  //       title: 'Lucky Numbers',
  //       subtitle: "1, 3, 4, 10"),
  //   NumerologyTableModel(
  //       image: AppImages.color, title: 'Lucky Colors', subtitle: "Blue, Gray"),
  //   NumerologyTableModel(
  //       image: AppImages.day,
  //       title: 'Lucky Days',
  //       subtitle: "Sunday, Saturday"),
  //   NumerologyTableModel(
  //       image: AppImages.stone,
  //       title: 'Lucky Gemstones',
  //       subtitle: "Diamond, Coral, Pearl"),
  // ];

Future<List<Dob>> getNumerology() async{
  String data=await DefaultAssetBundle.of(context).loadString("assets/jsonfiles/data.json");
  Map mapData=jsonDecode(data);
  List<Dob> dobs=(mapData['dob'] as List).map((e) => Dob.fromJson(e),).toList();
  return dobs;
}

@override
void initState() {
  super.initState();
  getNumerology();
  
}
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
      String birthdate=ModalRoute.of(context)?.settings.arguments as String;
      int month=int.tryParse(birthdate) ?? 1;
      if(month>9 ){
        id=12-month+1;
        print("id= $id");
      }else{
       id=month; 
       print("id = $id");
      }

      

    return Scaffold(
      backgroundColor: AppColors.lightPurple1,
      appBar:CustomAppBar(title: 'Numerology', leading: true),
      body:FutureBuilder<List<Dob>>(future: getNumerology(), builder: (context,snapshot){
        if(snapshot.hasData && id!=null){
        return  width < AppConstants.maxMobileWidth
          ? getMobileNumerologyContent(context, width,snapshot.data!,id!)
          : width < AppConstants.maxTabletWidth
              ? getTabletNumerologyContent(context, width,snapshot.data!,id!)
              : getDeskTopNumerologyContent(context, width,snapshot.data!,id!);
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
      })
      
    );
  }

  Padding getMobileNumerologyContent(BuildContext context, double width,List<Dob> dobs,int id) {

    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomNumerlogyCard(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => NumerologyDetailsScreen(dob: dobs[id-1],)));
                Get.off(()=>NumerologyDetailsScreen(dob: dobs[id-1]),transition: Transition.circularReveal,duration: const Duration(seconds: AppConstants.durationSecond));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child:
                 Table(
                  border: const TableBorder(
                      horizontalInside: BorderSide(width: 1),
                      verticalInside: BorderSide(width: 1)),
                  children: [
                    // for (final item in items)
                    //   TableRow(children: [
                    //     CustomTableWidget(numerologyTableModel: item)
                    //   ])
                    TableRow(children: [CustomTableWidget(numerologyTableModel: NumerologyTableModel(image: AppImages.luckyNumbers, title: "Lucky Numbers", subtitle: dobs[id-1].luckyNumber.toString())),]),
                    TableRow(children: [CustomTableWidget(numerologyTableModel: NumerologyTableModel(image: AppImages.color, title: "Lucky Colors", subtitle: dobs[id-1].luckyColor.toString())),]),
                    TableRow(children: [CustomTableWidget(numerologyTableModel: NumerologyTableModel(image: AppImages.day, title: "Lucky Days", subtitle: dobs[id-1].luckyDays.toString())),]),
                    TableRow(children: [CustomTableWidget(numerologyTableModel: NumerologyTableModel(image: AppImages.stone, title: "Lucky Gemstones", subtitle: dobs[id-1].luckyGems.toString())),]),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding getTabletNumerologyContent(BuildContext context, double width,List<Dob> dobs,int id) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomNumerlogyCard(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) =>const NumerologyDetailsScreen()));
                                Get.off(()=>NumerologyDetailsScreen(dob: dobs[id-1]),transition: Transition.circularReveal,duration: const Duration(seconds: AppConstants.durationSecond));

              },
            ),
            const SizedBox(
              height: 40,
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Table(
                  border: const TableBorder(
                      horizontalInside: BorderSide(width: 1),
                      verticalInside: BorderSide(width: 1)),
                  children: [
                    // for (final item in items)
                    //   TableRow(children: [
                    //     CustomTableWidget(numerologyTableModel: item)
                    //   ])
                    TableRow(children: [CustomTableWidget(numerologyTableModel: NumerologyTableModel(image: AppImages.luckyNumbers, title: "Lucky Numbers", subtitle: dobs[id-1].luckyNumber.toString())),]),
                    TableRow(children: [CustomTableWidget(numerologyTableModel: NumerologyTableModel(image: AppImages.color, title: "Lucky Colors", subtitle: dobs[id-1].luckyColor.toString())),]),
                    TableRow(children: [CustomTableWidget(numerologyTableModel: NumerologyTableModel(image: AppImages.day, title: "Lucky Days", subtitle: dobs[id-1].luckyDays.toString())),]),
                    TableRow(children: [CustomTableWidget(numerologyTableModel: NumerologyTableModel(image: AppImages.stone, title: "Lucky Gemstones", subtitle: dobs[id-1].luckyGems.toString())),]),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding getDeskTopNumerologyContent(BuildContext context, double width,List<Dob> dobs,int id) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CustomNumerlogyCard(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) =>const NumerologyDetailsScreen()));
                                Get.off(()=>NumerologyDetailsScreen(dob: dobs[id-1]),transition: Transition.zoom,duration: const Duration(seconds: AppConstants.durationSecond));

              },
            ),
          ),
          const SizedBox(width: 20,),
          Expanded(
            child: Card(
              
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Table(
                border: const TableBorder(
                    horizontalInside: BorderSide(width: 1),
                    verticalInside: BorderSide(width: 1)),
                children: [
                  // for (final item in items)
                  //   TableRow(children: [
                  //     CustomTableWidget(numerologyTableModel: item)
                  //   ])
                  TableRow(children: [CustomTableWidget(numerologyTableModel: NumerologyTableModel(image: AppImages.luckyNumbers, title: "Lucky Numbers", subtitle: dobs[id-1].luckyNumber.toString())),]),
                    TableRow(children: [CustomTableWidget(numerologyTableModel: NumerologyTableModel(image: AppImages.color, title: "Lucky Colors", subtitle: dobs[id-1].luckyColor.toString())),]),
                    TableRow(children: [CustomTableWidget(numerologyTableModel: NumerologyTableModel(image: AppImages.day, title: "Lucky Days", subtitle: dobs[id-1].luckyDays.toString())),]),
                    TableRow(children: [CustomTableWidget(numerologyTableModel: NumerologyTableModel(image: AppImages.stone, title: "Lucky Gemstones", subtitle: dobs[id-1].luckyGems.toString())),]),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
