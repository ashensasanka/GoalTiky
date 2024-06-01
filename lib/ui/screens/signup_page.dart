import 'package:flutter/material.dart';
import 'package:goaltiky/ui/screens/signin_page.dart';
import 'package:goaltiky/ui/screens/widgets/custom_textfield.dart';
import 'package:page_transition/page_transition.dart';

import '../../constants.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width,
            height: 400,
            color: Color(0xff1868FE),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 40),
                  child: Text(
                    'Manage your task',
                    style: TextStyle(fontSize: 25.0, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child:
                  CustomTextfield(
                    obscureText: false,
                    hintText: 'User Name',
                    icon: Icons.person,
                    textEditingController: name,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: CustomTextfield(
                    obscureText: false,
                    hintText: 'Your Email',
                    icon: Icons.alternate_email,
                    textEditingController: email,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: CustomTextfield(
              obscureText: true,
              hintText: 'Password',
              icon: Icons.lock,
              textEditingController: password,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: CustomTextfield(
              obscureText: true,
              hintText: 'Confirm Password',
              icon: Icons.lock,
              textEditingController: password,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 55,
                width: size.width,
                decoration: BoxDecoration(
                  color: Color(0xff1868FE),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'I accept App’s Terms of User and Privacy Policy.',
              style: TextStyle(
                color: Color(0xff777777),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color(0xffD7D7D7),
                  ),
                ),
                child: Image.asset(
                  'assets/images/android.png',
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color(0xffD7D7D7),
                  ),
                ),
                child: Image.asset(
                  'assets/images/google.png',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                PageTransition(
                  child: const SignIn(),
                  type: PageTransitionType.bottomToTop,
                ),
              );
            },
            child: Center(
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: 'Have an Account? ',
                    style: TextStyle(
                      color: Constants.blackColor,
                    ),
                  ),
                  TextSpan(
                    text: 'Login',
                    style: TextStyle(
                      color: Color(0xff1868FE),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
