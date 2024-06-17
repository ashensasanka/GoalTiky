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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 60, 10, 0),
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
                    height: size.height * .78,
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
            Container(
              height: 85,
              width: size.width,
              decoration: BoxDecoration(
                color: Color(0xff6EACFF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: 61,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 3),
                              blurRadius: 5,
                              color: Colors.grey,
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.face,
                                color: Colors.blueAccent,
                              ),
                              onPressed: () {},
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: "Type Something...",
                                    hintStyle:
                                        TextStyle(color: Colors.grey),
                                    border: InputBorder.none),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.photo_camera,
                                color: Colors.blueAccent,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.attach_file,
                                color: Colors.blueAccent,
                              ),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          color: Color(0xff20A090), shape: BoxShape.circle),
                      child: InkWell(
                        child: Icon(
                          Icons.send_rounded,
                          color: Colors.white,
                          size: 25,
                        ),
                        onLongPress: () {},
                      ),
                    )
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
