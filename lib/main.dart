import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:goaltiky/ui/onboarding_screen.dart';
import 'package:goaltiky/ui/screens/chat_page/chat_page.dart';
import 'package:goaltiky/ui/screens/drawer/community_page.dart';
import 'package:goaltiky/ui/screens/home_page.dart';

import 'auth_page/user_auth.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Screen',
      home: UserAuthPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/community': (context) => CommunityPage(),
        '/chatbot': (context) => ChatPage(),
        // Other routes...
      },
    );
  }
}
