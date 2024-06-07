import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../constants.dart';
import '../../../models/ctasks.dart';
import '../detail_page.dart';

class AllTaskWidget extends StatefulWidget {
  const AllTaskWidget({Key? key, required this.index, required this.taskId})
      : super(key: key);
  final int index;
  final int taskId;

  @override
  State<AllTaskWidget> createState() => _AllTaskWidgetState();
}

class _AllTaskWidgetState extends State<AllTaskWidget> {
  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  @override
  Widget build(BuildContext context) {
    List<Ctasks> cTaskList = Ctasks.cTasksList;

    return Container(
      decoration: BoxDecoration(
        color: Color(0xff455A64),
      ),
      height: 60.0,
      padding: const EdgeInsets.only(left: 10),
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
              child: Text(
                cTaskList[widget.index].title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            height: 45,
            width: 45,
            alignment: Alignment.center,
            child: IconButton(
              onPressed: () {
                setState(
                  () {
                    bool isSelected =
                        toggleIsSelected(cTaskList[widget.taskId].isSelected);

                    cTaskList[widget.taskId].isSelected = isSelected;
                  },
                );
              },
              icon: Icon(
                cTaskList[widget.taskId].isSelected == true
                ? Icons.circle_outlined
                : Icons.check_circle_outline,
                color: cTaskList[widget.taskId].isSelected == true
                    ? Colors.white
                    : Colors.black,
                size: 30,
              ),
            ),
            decoration: BoxDecoration(
              color: cTaskList[widget.taskId].isSelected == true
                  ? Colors.red
                  : Color(0xff4EBF68),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 1),
                  blurRadius: 5,
                  color: Constants.primaryColor.withOpacity(.3),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
