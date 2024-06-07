import 'package:flutter/material.dart';

class SelfMadeGoal extends StatefulWidget {
  const SelfMadeGoal({super.key});

  @override
  State<SelfMadeGoal> createState() => _SelfMadeGoalState();
}

class _SelfMadeGoalState extends State<SelfMadeGoal> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    padding: const EdgeInsets.fromLTRB(65, 0, 0, 0),
                    child: Text(
                      'Create New Work',
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
              padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Task Title',
                    style: TextStyle(
                      color: Color(0xff1868FE),
                      fontWeight: FontWeight.w500,
                      fontSize: 23.0,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff455A64),
                    ),
                    width: 350,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: TextField(
                        cursorColor: Colors.white,
                        controller: textEditingController,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'Work Details',
                    style: TextStyle(
                      color: Color(0xff1868FE),
                      fontWeight: FontWeight.w500,
                      fontSize: 23.0,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff7DA7F7).withOpacity(0.26),
                    ),
                    width: 350,
                    height: 110,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: TextField(
                        maxLines: 4,
                        cursorColor: Colors.blue,
                        controller: textEditingController,
                        style: TextStyle(
                            fontSize: 15
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'Work Type',
                    style: TextStyle(
                      color: Color(0xff1868FE),
                      fontWeight: FontWeight.w500,
                      fontSize: 23.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {

                    },
                    child: Container(
                      height: 55,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Color(0xff1868FE),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                        child: Text(
                          'Create',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
