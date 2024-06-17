import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goaltiky/ui/screens/new_root/new_root.dart';

import '../ui/onboarding_screen.dart';

class UserAuthPage extends StatefulWidget {
  UserAuthPage({Key? key,});

  @override
  State<UserAuthPage> createState() => _UserAuthPageState();
}

class _UserAuthPageState extends State<UserAuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // User is logged in
          if (snapshot.hasData) {
            User? user = snapshot.data;
            if (user != null) {
              return NewRootPage();
            }
          }
          // User is not logged in
          return OnboardingScreen();
        },
      ),
    );
  }
}
