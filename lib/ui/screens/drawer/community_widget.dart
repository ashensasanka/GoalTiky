import 'package:flutter/material.dart';
import 'package:goaltiky/models/community.dart';
import '../../../models/badges.dart';

class CommunityWidget extends StatelessWidget {
  const CommunityWidget({
    Key? key,
    required this.index,
    required this.badgeList,
  }) : super(key: key);

  final int index;
  final List<Community> badgeList;

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
      margin: const EdgeInsets.only(bottom: 20),
      width: size.width,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
            child: Image.asset(badgeList[index].image),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  badgeList[index].title,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.white,
                    fontStyle: FontStyle.italic
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Container(
                  width: 240,
                  child: Text(
                    '${badgeList[index].decription}',
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
