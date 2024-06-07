import 'package:flutter/material.dart';
import 'package:goaltiky/ui/screens/create_work/self_made_goal.dart';
import 'package:page_transition/page_transition.dart';

class CreateWork extends StatefulWidget {
  const CreateWork({super.key});

  @override
  State<CreateWork> createState() => _CreateWorkState();
}

class _CreateWorkState extends State<CreateWork> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCFDDFD),
      body: Column(
        children: [
          SizedBox(
            width: 410,
            height: 380,
            child: Image.asset('assets/images/create_task.png'),
          ),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: () {
              // Navigator.pushReplacement(
              //   context,
              //   PageTransition(
              //     child: const NewRootPage(),
              //     type: PageTransitionType.bottomToTop,
              //   ),
              // );
            },
            child: Container(
              height: 60,
              width: 350,
              decoration: BoxDecoration(
                color: Color(0xff6D98E9),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text(
                  'Pre made AI Goal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  child: const SelfMadeGoal(),
                  type: PageTransitionType.bottomToTop,
                ),
              );
            },
            child: Container(
              height: 60,
              width: 350,
              decoration: BoxDecoration(
                color: Color(0xff6D98E9),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text(
                  'Self made Goal',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
