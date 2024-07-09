import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../../../models/ctasks.dart';
import '../create_work/create_work.dart';
import '../feedbacks/feedbacks.dart';
import '../time_line_page.dart';
import '../home_page.dart';
import '../profile/profile_page.dart';
import '../widgets/drawer_widget.dart';

class NewRootPage extends StatefulWidget {
  const NewRootPage({super.key});

  @override
  State<NewRootPage> createState() => _NewRootPageState();
}

class _NewRootPageState extends State<NewRootPage> {
  int _bottomNavIndex = 0;
  List<Ctasks> favorites = [];
  List<Ctasks> myCart = [];
  List<String> titleList = [
    'Welcome Back!',
    'Time Lines',
    'How Create Work',
    'Profile',
    'Feedbacks',
  ];
  List<Widget> iconList = [
    Icon(
      Icons.home,
      color: Colors.white,
    ),
    Icon(
      Icons.calendar_month,
      color: Colors.white,
    ),
    Icon(
      Icons.add_circle_outline_rounded,
      color: Colors.white,
    ),
    Icon(
      Icons.person,
      color: Colors.white,
    ),
    Icon(
      Icons.feedback_outlined,
      color: Colors.white,
    ),
  ];
  List<Widget> _widgetOptions() {
    return [
      const HomePage(),
      TimeTrackingPage(),
      const CreateWork(),
      ProfilePage(),
      const FeedBacks(),
    ];
  }

  void updateNavIndex(int index) {
    setState(
      () {
        _bottomNavIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          titleList[_bottomNavIndex],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Color(0xff1868FE),
          ),
        ),
        backgroundColor: Color(0xFFD2E1FD),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xffE2ECFF),
        color: Color(0xff004BFE),
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(
            () {
              _bottomNavIndex = index;
            },
          );
        },
        items: iconList,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),
      drawer: DrawerWidget(onNavIndexChange: updateNavIndex),
    );
  }
}
