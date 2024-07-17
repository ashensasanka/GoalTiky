import 'package:firebase_auth/firebase_auth.dart';
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
  List<Ctasks> cTaskList = [];
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    fetchClaims(); // Call the method to fetch claims when the widget initializes
  }

  // Method to fetch claims from Firestore
  void fetchClaims() async {
    List<Ctasks> claims = await Ctasks.getTasksFromFirestore();
    setState(
          () {
            cTaskList = claims; // Update the state with retrieved claims
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}
