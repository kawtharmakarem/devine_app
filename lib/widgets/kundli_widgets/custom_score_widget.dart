import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CustomScore extends StatefulWidget {
  CustomScore({
    super.key,
    this.pointer,
  });
  double? pointer;

  @override
  State<CustomScore> createState() => _CustomScoreState();
}

class _CustomScoreState extends State<CustomScore> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width < AppConstants.maxTabletWidth ? width : width * 0.5,
      height: width < AppConstants.maxTabletWidth ? width * 0.85 : width * 0.4,
      child: SfRadialGauge(
        animationDuration: 2000,
        enableLoadingAnimation: true,
        axes: <RadialAxis>[
          RadialAxis(
            showLabels: false,
            showTicks: false,
            startAngle: 180,
            endAngle: 0,
            axisLineStyle: const AxisLineStyle(
              thickness: 0.12,
              cornerStyle: CornerStyle.bothCurve,
            ),
            maximum: 36,
            minimum: 0,
            interval: 2,
            labelsPosition: ElementsPosition.outside,
            ranges: <GaugeRange>[
              GaugeRange(
                startWidth: width < AppConstants.maxTabletWidth
                    ? width * 0.14
                    : width * 0.08, //50,
                endWidth: width < AppConstants.maxTabletWidth
                    ? width * 0.14
                    : width * 0.08,
                startValue: 0,
                endValue: 11,
                color: Colors.amber,
              ),
              GaugeRange(
                startWidth: width < AppConstants.maxTabletWidth
                    ? width * 0.14
                    : width * 0.08,
                endWidth: width < AppConstants.maxTabletWidth
                    ? width * 0.14
                    : width * 0.08,
                startValue: 12,
                endValue: 24,
                color: Colors.green,
              ),
              GaugeRange(
                startWidth: width < AppConstants.maxTabletWidth
                    ? width * 0.14
                    : width * 0.08,
                endWidth: width < AppConstants.maxTabletWidth
                    ? width * 0.14
                    : width * 0.08,
                startValue: 25,
                endValue: 36,
                color: Colors.red,
              ),
            ],
            pointers: <GaugePointer>[
              NeedlePointer(
                value: widget.pointer ?? 0,
                onValueChanged: (value) {
                  setState(() {
                    widget.pointer = value;
                  });
                },
                needleEndWidth: 5,
                enableAnimation: true,
              )
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${widget.pointer}",
                        style: AppStyles.styleBold24(context).copyWith(
                            fontSize: getResponsiveFontSizeText(context,
                                fontSize: width < AppConstants.maxTabletWidth
                                    ? 32
                                    : 45))),
                    Text(
                      '/36',
                      style: width < AppConstants.maxTabletWidth
                          ? AppStyles.styleBold24(context)
                          : AppStyles.styleBold24(context).copyWith(
                              fontSize: getResponsiveFontSizeText(context,
                                  fontSize: 32)),
                    )
                  ],
                ),
                angle: 90,
                positionFactor: 0.5,
              )
            ],
          )
        ],
      ),
    );
  }
}
