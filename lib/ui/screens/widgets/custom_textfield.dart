import 'package:flutter/material.dart';

import '../../../constants.dart';

class CustomTextfield extends StatelessWidget {
  final IconData icon;
  final bool obscureText;
  final String hintText;
  final TextEditingController textEditingController;

  const CustomTextfield({
    Key? key,
    required this.icon,
    required this.obscureText,
    required this.hintText, required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Color(0xff1868FE),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: TextField(
          controller: textEditingController,
          obscureText: obscureText,
          style: TextStyle(
            color: Constants.blackColor,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              icon,
              color: Constants.blackColor.withOpacity(.3),
            ),
            hintText: hintText,
          ),
          cursorColor: Constants.blackColor.withOpacity(.5),
        ),
      ),
    );
  }
}
