import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../../models/ctasks.dart';
import '../cart_page.dart';
import '../favorite_page.dart';
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
    'Favorite',
    'Cart',
    'Profile',
    'Profile',
  ];
  List<Widget> iconList = [
    Icon(
      Icons.home,
      color: Colors.white,
    ),
    Icon(
      Icons.favorite,
      color: Colors.white,
    ),
    Icon(
      Icons.shopping_cart,
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
      FavoritePage(favoritedPlants: favorites,),
      CartPage(addedToCartPlants: myCart,),
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
          ),
        ),
        backgroundColor: Color(0xFFD2DCFF),
        elevation: 0.0,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
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
