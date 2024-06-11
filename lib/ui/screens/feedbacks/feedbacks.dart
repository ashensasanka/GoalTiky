import 'package:flutter/material.dart';

import '../../../models/badges.dart';
import '../../../models/feedback.dart';
import '../widgets/badge_widget.dart';
import '../widgets/feedback_widget.dart';

class FeedBacks extends StatefulWidget {
  const FeedBacks({super.key});

  @override
  State<FeedBacks> createState() => _FeedBacksState();
}

class _FeedBacksState extends State<FeedBacks> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<FeedBack> _feedbackList = FeedBack.feedbackList;
    return Scaffold(
      backgroundColor: Color(0xffE2ECFF),
      body: Container(
        height: size.height * .8,
        child: ListView.builder(
          itemCount: _feedbackList.length,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return FeedBackWidget(
              index: index,
              feedbackList: _feedbackList,
            );
          },
        ),
      ),
    );
  }
}
