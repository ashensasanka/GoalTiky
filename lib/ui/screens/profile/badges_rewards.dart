import 'package:flutter/material.dart';
import '../../../models/badges.dart';
import '../../../models/ctasks.dart';
import '../widgets/badge_widget.dart';

class BadgesRewards extends StatefulWidget {
  const BadgesRewards({super.key});

  @override
  State<BadgesRewards> createState() => _BadgesRewardsState();
}

class _BadgesRewardsState extends State<BadgesRewards> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Badges> _badgeList = Badges.badgeList;
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
                    SizedBox(width: 40,),
                    Image.asset('assets/images/Group6543.png'),
                    Text(
                      '  Badges & Rewards',
                      style: TextStyle(
                        fontSize: 25,
                        color: Color(0xff1868FE),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height * .8,
                child: ListView.builder(
                  itemCount: _badgeList.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return BadgeWidget(
                      index: index,
                      badgeList: _badgeList,
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
