import 'dart:math';

import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class BiorhythmChart extends StatefulWidget {
  const BiorhythmChart({super.key, required this.mydays,});
  final int mydays;

  @override
  State<BiorhythmChart> createState() => _BiorhythmChartState();
}

class _BiorhythmChartState extends State<BiorhythmChart> {
 

  _bottomTitles(double width) {
    return SideTitles(
      showTitles: true,
      reservedSize:width<AppConstants.maxTabletWidth? 30:60,
      getTitlesWidget: (value,meta){
        return SideTitleWidget(child: Text(labels[value.toInt()],style: TextStyle(fontSize:width<AppConstants.maxMobileWidth? 14:width<AppConstants.maxTabletWidth? 18:22,fontWeight: FontWeight.bold),), axisSide: meta.axisSide);
      }
    );
  }

  List<String> get labels {
    return List.generate(7, (i) {
      final currentDate = DateTime.now().add(Duration(days: i));
        final options = DateFormat.MMMd();

      return options.format(currentDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    double width=MediaQuery.sizeOf(context).width;
    // widget.callBack(physicalValue);
    // BiorhythmPage.of(context)!.physicalValue=physicalValue;
    return width<AppConstants.maxTabletWidth?  getMobileChartWidget(height,width):getDesktopChartWidget(height, width);
  }

  Widget getMobileChartWidget(double height,double width) {
    return Container(
      width: double.maxFinite,
  height:width<AppConstants.maxMobileWidth?  height*0.3:width<AppConstants.maxTabletWidth? height*0.3:height*0.5,//200,
    child: LineChart(
      
      LineChartData(
         gridData: FlGridData(show: true,
        ),
          titlesData: FlTitlesData(
            show: true,
         
            bottomTitles: AxisTitles(
              
              sideTitles: _bottomTitles(width)
              
            ),
           
            
          ),
    
          borderData: FlBorderData(
            
                        show: true,border: Border(left: BorderSide(width: 2),bottom: BorderSide(width: 2)),
        ),
        
        lineBarsData: [
          LineChartBarData(
          
             spots: [
                for (double i = 0; i < 7; i++)
                  FlSpot(i, (sin((2 * pi * (widget.mydays + i)) / 23) + 1) * 50)
               ],
               
            isCurved: true,
            color:AppColors.red,
            barWidth: 2,
          ),
          LineChartBarData(
            spots: [
                for (double i = 0; i <7; i++)
                  FlSpot(i, (sin((2 * pi * (widget.mydays + i)) / 28) + 1) * 50)
                  
                
              ],
            isCurved: true,
            color: AppColors.blue,
            barWidth: 2,
          ),
          LineChartBarData(
            spots: [
                for (double i = 0; i <7; i++)
                  FlSpot(i, (sin((2 * pi * (widget.mydays + i)) / 33) + 1) * 50)
                
              ],
            isCurved: true,
            color: AppColors.green,
            barWidth: 2,
          ),
          //   LineChartBarData(
          //   spots: [
              
          //   ],
          //   isCurved: true,
          //   color: AppColors.yello,
          //   barWidth: 2,
          // ),
        ],
      ),
    ),
  );
  }

  SizedBox getDesktopChartWidget(double height,double width) {
    return SizedBox(
  height: height*0.5,
  width: width*0.5,
    child: LineChart(
    
      LineChartData(
        gridData: const FlGridData(show: true,),
      
        titlesData:  FlTitlesData(show: true,
        bottomTitles: AxisTitles(
              
              sideTitles: _bottomTitles(width)
              
            ),),
        borderData:  FlBorderData(show: true),
        
        
        lineBarsData: [
          LineChartBarData(
            spots: [
              for (double i = 0; i < 7; i++)
                  FlSpot(i, (sin((2 * pi * (widget.mydays + i)) / 23) + 1) * 50)
              
            ],
            isCurved: true,
            color:AppColors.red,
            barWidth: 2,
          ),
          LineChartBarData(
            spots: [
              for (double i = 0; i <7; i++)
                  FlSpot(i, (sin((2 * pi * (widget.mydays + i)) / 28) + 1) * 50)
              
            ],
            isCurved: true,
            color: AppColors.blue,
            barWidth: 2,
          ),
          LineChartBarData(
            spots: [
               for (double i = 0; i <= 6; i++)
                  FlSpot(i, (sin((2 * pi * (widget.mydays + i)) / 33) + 1) * 50)
              
            ],
            isCurved: true,
            color: AppColors.green,
            barWidth: 2,
          ),
          //   LineChartBarData(
          //   spots: [
              
          //     const FlSpot(0, 2),
          //     const FlSpot(1, 3),
          //     const FlSpot(2, 2),
          //     const FlSpot(3, 4),
          //     const FlSpot(4, 3),
          //   ],
          //   isCurved: true,
          //   color: AppColors.yello,
          //   barWidth: 2,
          // ),
    ]),
    ),
    );
  
  }
}