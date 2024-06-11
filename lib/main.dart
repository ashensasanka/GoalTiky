import 'package:flutter/material.dart';
import 'package:goaltiky/ui/onboarding_screen.dart';
import 'package:goaltiky/ui/screens/drawer/community_page.dart';
import 'package:goaltiky/ui/screens/home_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Screen',
      home: OnboardingScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/community': (context) => CommunityPage(),
        // Other routes...
      },
    );
  }
}
