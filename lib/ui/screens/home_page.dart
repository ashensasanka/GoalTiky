import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:goaltiky/ui/screens/widgets/task_widget.dart';
import 'package:page_transition/page_transition.dart';
import '../../constants.dart';
import '../../models/ctasks.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;

    List<Ctasks> _completedList = Ctasks.cTasksList;

    //Toggle Favorite button
    bool toggleIsFavorated(bool isFavorited) {
      return !isFavorited;
    }

    return Scaffold(
      backgroundColor: Color(0xffE2ECFF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    width: size.width * .9,
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black54.withOpacity(.6),
                        ),
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search Task',
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.mic,
                          color: Colors.black54.withOpacity(.6),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
                    child: Text(
                      'Completed Tasks',
                      style: TextStyle(
                        color: Color(0xff1868FE),
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: Color(0xff1868FE),
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * .3,
              child: ListView.builder(
                itemCount: _completedList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: DetailPage(
                            taskId: _completedList[index].ctaskId,
                          ),
                          type: PageTransitionType.bottomToTop,
                        ),
                      );
                    },
                    child: Container(
                      width: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Color(0xff7DA7F7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          Positioned(
                            top: 15,
                            left: 20,
                            child: Container(
                              width: 150,
                              child: Text(
                                _completedList[index].title,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 150,
                            left: 10,
                            child: Container(
                              width: 150,
                              child: Text(
                                'Team Members',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 35,
                            left: 10,
                            child: Container(
                              width: 250,
                              child: const Row(
                                children: [
                                  Text(
                                    'Completed',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 70,
                                  ),
                                  Text(
                                    '100%',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 20),
                            child: Container(
                              width: 180,
                              child: LinearProgressIndicator(
                                minHeight: 6,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                value:
                                    0.5,
                                backgroundColor: Colors.grey[200],
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.blue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
                    child: Text(
                      'Ongoing  Works',
                      style: TextStyle(
                        color: Color(0xff1868FE),
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: Color(0xff1868FE),
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: size.height * .5,
              child: ListView.builder(
                itemCount: _completedList.length,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: DetailPage(
                            taskId: _completedList[index].ctaskId,
                          ),
                          type: PageTransitionType.bottomToTop,
                        ),
                      );
                    },
                    child: TaskWidget(
                      index: index,
                      cTaskList: _completedList,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
