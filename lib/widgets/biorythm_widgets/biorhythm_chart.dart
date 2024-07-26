import 'dart:math';

import 'package:divinecontrol/utils/app_colors.dart';
import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BiorhythmChart extends StatefulWidget {
  const BiorhythmChart({super.key, required this.mydays});
  final int mydays;

  @override
  State<BiorhythmChart> createState() => _BiorhythmChartState();
}

class _BiorhythmChartState extends State<BiorhythmChart> {

  
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    double width=MediaQuery.sizeOf(context).width;
    return width<AppConstants.maxTabletWidth?  getMobileChartWidget(height,width):getDesktopChartWidget(height, width);
  }

  Widget getMobileChartWidget(double height,double width) {
    return Container(
      width: double.maxFinite,
  height:  height*0.3,//200,
    child: LineChart(
      
      LineChartData(
         gridData: const FlGridData(show: true,),
          titlesData: FlTitlesData(
            show: true,

            bottomTitles: AxisTitles(
             // axisNameWidget: Text('Widget'),
              sideTitles: _bottomTitles()
              
            )
          ),
          borderData: FlBorderData(show: true,border: Border(left: BorderSide(width: 2),bottom: BorderSide(width: 2))),
        
        lineBarsData: [
          LineChartBarData(
            spots: [
              for (double i = 0; i <= 6; i++)
                  FlSpot(i, (sin((2 * pi * (widget.mydays + i)) / 23) + 1) * 50)
              // const FlSpot(0, 3),
              // const FlSpot(1, 1),
              // const FlSpot(2, 4),
              // const FlSpot(3, 2),
              // const FlSpot(4, 5),
            ],
            isCurved: true,
            color:AppColors.red,
            barWidth: 2,
          ),
          LineChartBarData(
            spots: [
              for (double i = 0; i <= 6; i++)
                  FlSpot(i, (sin((2 * pi * (widget.mydays + i)) / 28) + 1) * 50)
              // const FlSpot(0, 4),
              // const FlSpot(1, 3),
              // const FlSpot(2, 5),
              // const FlSpot(3, 3),
              // const FlSpot(4, 4),
            ],
            isCurved: true,
            color: AppColors.blue,
            barWidth: 2,
          ),
          LineChartBarData(
            spots: [
               for (double i = 0; i <= 6; i++)
                  FlSpot(i, (sin((2 * pi * (widget.mydays + i)) / 33) + 1) * 50)
              // const FlSpot(0, 2),
              // const FlSpot(1, 3),
              // const FlSpot(2, 2),
              // const FlSpot(3, 4),
              // const FlSpot(4, 3),
            ],
            isCurved: true,
            color: AppColors.green,
            barWidth: 2,
          ),
            LineChartBarData(
            spots: [
               for (double i = 0; i <= 6; i++)
                  FlSpot(i, (sin((2 * pi * (widget.mydays + i)) / 38) + 1) * 50)
              // const FlSpot(0, 2),
              // const FlSpot(1, 3),
              // const FlSpot(2, 2),
              // const FlSpot(3, 4),
              // const FlSpot(4, 3),
            ],
            isCurved: true,
            color: AppColors.yello,
            barWidth: 2,
          ),
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
        gridData: const FlGridData(show: true),
        titlesData: const FlTitlesData(show: true),
        borderData:  FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: [
              for (double i = 0; i <= 6; i++)
                  FlSpot(i, (sin((2 * pi * (widget.mydays + i)) / 23) + 1) * 50)
              // const FlSpot(0, 3),
              // const FlSpot(1, 1),
              // const FlSpot(2, 4),
              // const FlSpot(3, 2),
              // const FlSpot(4, 5),
            ],
            isCurved: true,
            color:AppColors.red,
            barWidth: 2,
          ),
          LineChartBarData(
            spots: [
              for (double i = 0; i <= 6; i++)
                  FlSpot(i, (sin((2 * pi * (widget.mydays + i)) / 28) + 1) * 50)
              // const FlSpot(0, 4),
              // const FlSpot(1, 3),
              // const FlSpot(2, 5),
              // const FlSpot(3, 3),
              // const FlSpot(4, 4),
            ],
            isCurved: true,
            color: AppColors.blue,
            barWidth: 2,
          ),
          LineChartBarData(
            spots: [
               for (double i = 0; i <= 6; i++)
                  FlSpot(i, (sin((2 * pi * (widget.mydays + i)) / 33) + 1) * 50)
              // const FlSpot(0, 2),
              // const FlSpot(1, 3),
              // const FlSpot(2, 2),
              // const FlSpot(3, 4),
              // const FlSpot(4, 3),
            ],
            isCurved: true,
            color: AppColors.green,
            barWidth: 2,
          ),
            LineChartBarData(
            spots: [
               for (double i = 0; i <= 6; i++)
                  FlSpot(i, (sin((2 * pi * (widget.mydays + i)) / 38) + 1) * 50)
              // const FlSpot(0, 2),
              // const FlSpot(1, 3),
              // const FlSpot(2, 2),
              // const FlSpot(3, 4),
              // const FlSpot(4, 3),
            ],
            isCurved: true,
            color: AppColors.yello,
            barWidth: 2,
          ),
    ]),
    ),
    );
  
  }
  _bottomTitles() {
    return SideTitles(
      showTitles: true,
      getTitlesWidget: (value,meta){
        return SideTitleWidget(
          space: 0,

          child: Container(
            child: Text('Jun',
                    style: AppStyles.styleRegular20(context).copyWith(fontWeight: FontWeight.w600,fontSize: getResponsiveFontSizeText(context, fontSize: 18)),),
          ), axisSide: meta.axisSide);
      }
    );
  }
}