import 'package:flutter/material.dart';
import 'package:goaltiky/ui/screens/widgets/all_task_widget.dart';
import 'package:goaltiky/ui/screens/widgets/task_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../constants.dart';
import '../../models/ctasks.dart';
import 'add_tasks/add_tasks.dart';
import 'new_root/new_root.dart';

class DetailPage extends StatefulWidget {
  final int taskId;
  const DetailPage({Key? key, required this.taskId}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //Toggle Favorite button
  bool toggleIsFavorated(bool isFavorited) {
    return !isFavorited;
  }

  //Toggle add remove from cart
  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Ctasks> _cTasksList = Ctasks.cTasksList;
    double progressValue = 50;
    return Scaffold(
      backgroundColor: Color(0xffE2ECFF),
      body: Stack(
        children: [
          Positioned(
            top: 60,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: Color(0xff455A64),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                    child: Text(
                      'Task Details',
                      style: TextStyle(
                        fontSize: 25,
                        color: Color(0xff1868FE),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _cTasksList[widget.taskId].title,
                    style: TextStyle(
                        color: Color(0xff1868FE),
                        fontWeight: FontWeight.w400,
                        fontSize: 23.0,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 185,
                        height: 50,
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xff7DA7F7),
                              ),
                              child: Image.asset(
                                'assets/images/calendarremove.png',
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Due Date',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff7DA7F7),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  height: 25,
                                  child: Text(
                                    _cTasksList[widget.taskId].duedate,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xff1868FE),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 185,
                        height: 50,
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xff7DA7F7),
                              ),
                              child: Image.asset(
                                'assets/images/profile2user.png',
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Project Team',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff7DA7F7),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  height: 25,
                                  child: Text(
                                    _cTasksList[widget.taskId].duedate,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xff1868FE),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Work Details',
                    style: TextStyle(
                      color: Color(0xff1868FE),
                      fontWeight: FontWeight.w400,
                      fontSize: 23.0,
                    ),
                  ),
                  Container(
                    width: 350,
                    height: 100,
                    child: Text(
                      _cTasksList[widget.taskId].decription,
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff7DA7F7),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Work Progress',
                        style: TextStyle(
                          color: Color(0xff1868FE),
                          fontWeight: FontWeight.w400,
                          fontSize: 23.0,
                        ),
                      ),
                      Container(
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
                                color: Color.fromARGB(30, 0, 169, 181),
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
                                ),
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                  positionFactor: 0.5,
                                  angle: 90,
                                  widget: Text(
                                    progressValue.toStringAsFixed(0) + '%',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'All Tasks',
                    style: TextStyle(
                      color: Color(0xff1868FE),
                      fontWeight: FontWeight.w400,
                      fontSize: 23.0,
                    ),
                  ),
                  Container(
                    height: size.height * .33,
                    child: ListView.builder(
                      itemCount: _cTasksList.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return AllTaskWidget(
                          taskId: _cTasksList[index].ctaskId,
                          index: index,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 65,
        width: 65,
        child: FloatingActionButton(
            shape: CircleBorder(),
          backgroundColor: Color(0xff1868FE),
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                child:  AddTasks(),
                type: PageTransitionType.bottomToTop,
              ),
            );
          },
          child: const Icon(Icons.add,size: 40,),
        ),
      ),
    );
  }
}

class PlantFeature extends StatelessWidget {
  final String plantFeature;
  final String title;
  const PlantFeature({
    Key? key,
    required this.plantFeature,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Constants.blackColor,
          ),
        ),
        Text(
          plantFeature,
          style: TextStyle(
            color: Constants.primaryColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
