import 'package:divinecontrol/utils/app_constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BiorhythmChart extends StatelessWidget {
  const BiorhythmChart({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    double width=MediaQuery.sizeOf(context).width;
    return width<AppConstants.maxTabletWidth?  getMobileChartWidget(height,width):getDesktopChartWidget(height, width);
  }

  SizedBox getMobileChartWidget(double height,double width) {
    return SizedBox(
  height:  height*0.3,//200,
    child: LineChart(
      LineChartData(
        gridData: const FlGridData(show: true),
        titlesData: const FlTitlesData(show: true),
        borderData:  FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: [
              const FlSpot(0, 3),
              const FlSpot(1, 1),
              const FlSpot(2, 4),
              const FlSpot(3, 2),
              const FlSpot(4, 5),
            ],
            isCurved: true,
            color: Colors.red,
            barWidth: 2,
          ),
          LineChartBarData(
            spots: [
              const FlSpot(0, 4),
              const FlSpot(1, 3),
              const FlSpot(2, 5),
              const FlSpot(3, 3),
              const FlSpot(4, 4),
            ],
            isCurved: true,
            color: Colors.green,
            barWidth: 2,
          ),
          LineChartBarData(
            spots: [
              const FlSpot(0, 2),
              const FlSpot(1, 3),
              const FlSpot(2, 2),
              const FlSpot(3, 4),
              const FlSpot(4, 3),
            ],
            isCurved: true,
            color: Colors.blue,
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
              const FlSpot(0, 3),
              const FlSpot(1, 1),
              const FlSpot(2, 4),
              const FlSpot(3, 2),
              const FlSpot(4, 5),
            ],
            isCurved: true,
            color: Colors.red,
            barWidth: 2,
          ),
          LineChartBarData(
            spots: [
              const FlSpot(0, 4),
              const FlSpot(1, 3),
              const FlSpot(2, 5),
              const FlSpot(3, 3),
              const FlSpot(4, 4),
            ],
            isCurved: true,
            color: Colors.green,
            barWidth: 2,
          ),
          LineChartBarData(
            spots: [
              const FlSpot(0, 2),
              const FlSpot(1, 3),
              const FlSpot(2, 2),
              const FlSpot(3, 4),
              const FlSpot(4, 3),
            ],
            isCurved: true,
            color: Colors.blue,
            barWidth: 2,
          ),
        ],
      ),
    ),
  );
  }
}