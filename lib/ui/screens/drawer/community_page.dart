import 'package:flutter/material.dart';
import 'package:goaltiky/models/community.dart';

import '../../../models/badges.dart';
import '../widgets/badge_widget.dart';
import 'community_widget.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Community> _communityList = Community.communityList;
    return Scaffold(
      backgroundColor: Color(0xffE2ECFF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 60, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
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
                      padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
                      child: Text(
                        'Community',
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
              Container(
                height: size.height * .8,
                child: ListView.builder(
                  itemCount: _communityList.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return CommunityWidget(
                      index: index,
                      badgeList: _communityList,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
