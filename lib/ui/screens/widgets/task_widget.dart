import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../constants.dart';
import '../../../models/ctasks.dart';
import '../detail_page.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    Key? key,
    required this.index,
    required this.cTaskList,
  }) : super(key: key);

  final int index;
  final List<Ctasks> cTaskList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double progressValue = 50;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            child: DetailPage(
              taskId: cTaskList[index].ctaskId,
            ),
            type: PageTransitionType.bottomToTop,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff455A64),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 140.0,
        padding: const EdgeInsets.only(left: 10, top: 10),
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cTaskList[index].title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    'Due on: ${cTaskList[index].duedate}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Container(
                width: 80,
                height: 80,
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 0,
                      maximum: 100,
                      showLabels: false,
                      showTicks: false,
                      startAngle: 270,
                      endAngle: 270,
                      axisLineStyle: AxisLineStyle(
                        thickness: 1,
                        color: Color(0xff455A64),
                        thicknessUnit: GaugeSizeUnit.factor,
                      ),
                      pointers: <GaugePointer>[
                        RangePointer(
                          value: progressValue,
                          width: 0.1,
                          color: Color(0xffFED36A),
                          pointerOffset: 0.1,
                          cornerStyle: CornerStyle.bothCurve,
                          sizeUnit: GaugeSizeUnit.factor,
                        )
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          positionFactor: 0.5,
                          angle: 90,
                          widget: Text(
                            progressValue.toStringAsFixed(0) + '%',
                            style: TextStyle(fontSize: 15,color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
