/// Flutter package imports
import 'package:flutter/material.dart';

/// Gauge imports
import 'package:syncfusion_flutter_gauges/gauges.dart';

/// Local imports
//import '../models/sample_view.dart';

/// Renders the gauge text pointer sample
class riskLevelPointer extends StatelessWidget {
  final String riskLevel;
  var pointerAngle;
  riskLevelPointer(this.riskLevel);

  @override
  Widget build(BuildContext context) {
    if (riskLevel == "1") {
      pointerAngle = 12.00;
    } else if (riskLevel == "2") {
      pointerAngle = 36.00;
    } else if (riskLevel == "3") {
      pointerAngle = 60.00;
    } else if (riskLevel == "4") {
      pointerAngle = 84.00;
    } else if (riskLevel == "5") {
      pointerAngle = 108.00;
    } else {
      pointerAngle = 108.00;
    }

    // this.getJsonData(); // add this line
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
            showAxisLine: false,
            showLabels: false,
            showTicks: false,
            startAngle: 180,
            endAngle: 360,
            minimum: 0,
            maximum: 120,
            canScaleToFit: true,
            radiusFactor: 1,
            pointers: <GaugePointer>[
              NeedlePointer(
                  needleStartWidth: 0.5,
                  lengthUnit: GaugeSizeUnit.factor,
                  needleEndWidth: 2.5,
                  needleLength: 0.7,
                  value: pointerAngle,
                  knobStyle: KnobStyle(knobRadius: 0)),
            ],
            ranges: <GaugeRange>[
              GaugeRange(
                  startValue: 0,
                  endValue: 24,
                  startWidth: 0.45,
                  endWidth: 0.45,
                  sizeUnit: GaugeSizeUnit.factor,
                  color: const Color(0xFFDD3800)),
              GaugeRange(
                  startValue: 24,
                  endValue: 48,
                  startWidth: 0.45,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: 0.45,
                  color: const Color(0xFFFF4100)),
              GaugeRange(
                  startValue: 48,
                  endValue: 72,
                  startWidth: 0.45,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: 0.45,
                  color: const Color(0xFFFFBA00)),
              GaugeRange(
                  startValue: 72,
                  endValue: 96,
                  startWidth: 0.45,
                  sizeUnit: GaugeSizeUnit.factor,
                  endWidth: 0.45,
                  color: const Color(0xFFFFDF10)),
              GaugeRange(
                  startValue: 96,
                  endValue: 120,
                  sizeUnit: GaugeSizeUnit.factor,
                  startWidth: 0.45,
                  endWidth: 0.45,
                  color: const Color(0xFF8BE724)),
            ]),
        RadialAxis(
          showAxisLine: false,
          showLabels: false,
          showTicks: false,
          startAngle: 180,
          endAngle: 360,
          minimum: 0,
          maximum: 120,
          radiusFactor: 1,
          canScaleToFit: true,
          pointers: <GaugePointer>[
            MarkerPointer(
                markerType: MarkerType.text,
                text: "Risk: ${riskLevel}",
                value: 60,
                textStyle: GaugeTextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    fontFamily: 'Arial'),
                offsetUnit: GaugeSizeUnit.factor,
                markerOffset: -0.6),
          ],
        ),
      ],
    );
  }
}
