import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../../models/ctasks.dart';
import '../cart_page.dart';
import '../create_work/create_work.dart';
import '../time_line_page.dart';
import '../home_page.dart';
import '../profile_page.dart';
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
    'Profile',
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
      Icons.person,
      color: Colors.white,
    ),
  ];
  List<Widget> _widgetOptions() {
    return [const HomePage(),
      TimeTrackingPage(),
      // TimeLinePage(favoritedPlants: favorites,),
      CreateWork(),
      // CartPage(addedToCartPlants: myCart,),
      const ProfilePage(),
      CartPage(addedToCartPlants: myCart,),];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titleList[_bottomNavIndex],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Color(0xff1868FE)
          ),
        ),
        backgroundColor: Color(0xFFD2DCFF),
        elevation: 0.0,
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
      drawer: DrawerWidget(),
    );
  }
}
