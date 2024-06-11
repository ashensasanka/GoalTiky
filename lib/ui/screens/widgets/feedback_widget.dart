import 'package:flutter/material.dart';
import 'package:goaltiky/models/feedback.dart';
import '../../../models/badges.dart';

class FeedBackWidget extends StatelessWidget {
  const FeedBackWidget({
    Key? key,
    required this.index,
    required this.feedbackList,
  }) : super(key: key);

  final int index;
  final List<FeedBack> feedbackList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: Color(0xff76B5C5),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 130.0,
      padding: const EdgeInsets.only(left: 10, top: 10),
      margin: const EdgeInsets.only(bottom: 20,left: 10,right: 10),
      width: size.width,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
            child: Image.asset(feedbackList[index].profimg),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Colors.red
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Container(
                        height: 20,
                        width: 2,
                        decoration: BoxDecoration(
                          color: Colors.white
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                      child: Text(
                        feedbackList[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Colors.white,
                          fontStyle: FontStyle.italic
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Container(
                        height: 20,
                        width: 2,
                        decoration: BoxDecoration(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Container(
                  width: 240,
                  child: Text(
                    '${feedbackList[index].decription}',
                    style: TextStyle(color: Color(0xff433AD9),
                    fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
