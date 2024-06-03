import 'package:flutter/material.dart';

List cardValues = [
  for(int i =0 ; i<22 ; i++)...{
    CardDetails(pageNumber: i.toString(),)
  }
];

class CardDetails extends StatelessWidget {
  String pageNumber;
  CardDetails({super.key , required this.pageNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text( 'page number $pageNumber' , style: const TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
      ),
    );
  }
}
