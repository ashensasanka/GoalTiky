import 'package:flutter/material.dart';
import 'package:goaltiky/ui/screens/profile/test_page.dart';
import 'package:goaltiky/ui/screens/widgets/profile_widget.dart';
import 'package:page_transition/page_transition.dart';

import '../../../constants.dart';
import 'badges_rewards.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffE2ECFF),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(children: [
                Container(
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          ExactAssetImage('assets/images/profile.jpg'),
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0xffFED36A),
                      width: 5.0,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: -25,
                  child: RawMaterialButton(
                    onPressed: () {},
                    elevation: 2.0,
                    fillColor: Colors.black,
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.blue,
                    ),
                    padding: EdgeInsets.all(10.0),
                    shape: CircleBorder(),
                  ),
                ),
              ]),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: size.height * .7,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfileWidget(
                      icon: Icons.person,
                      title: 'Daniel Martinez',
                      onTap: () {

                      },
                    ),
                    ProfileWidget(
                      icon: Icons.batch_prediction,
                      title: 'Badges & Rewards',
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: const BadgesRewards(),
                            type: PageTransitionType.bottomToTop,
                          ),
                        );
                      },
                    ),
                    ProfileWidget(
                      icon: Icons.password,
                      title: 'Password',
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: const Profile(),
                            type: PageTransitionType.bottomToTop,
                          ),
                        );
                      },
                    ),
                    ProfileWidget(
                      icon: Icons.task,
                      title: 'My Tasks',
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: const Profile(),
                            type: PageTransitionType.bottomToTop,
                          ),
                        );
                      },
                    ),
                    ProfileWidget(
                      icon: Icons.privacy_tip,
                      title: 'Privacy',
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: const Profile(),
                            type: PageTransitionType.bottomToTop,
                          ),
                        );
                      },
                    ),
                    ProfileWidget(
                      icon: Icons.settings,
                      title: 'Setting',
                      onTap: () {

                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
