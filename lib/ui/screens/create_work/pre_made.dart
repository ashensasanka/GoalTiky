import 'package:flutter/material.dart';
import 'dart:convert';
import '../../../function.dart';

class PreMade extends StatefulWidget {
  const PreMade({super.key});

  @override
  State<PreMade> createState() => _PreMadeState();
}


class _PreMadeState extends State<PreMade> {
  TextEditingController messageController = TextEditingController();
  String output = '20';
  String url = '';
  var data;
  getValue() async {
    // url = 'http://127.0.0.1:5000/api?query=' + messageController.text;
    url = 'http://10.0.2.2:5000/api?query=' + messageController.text;
    data = await fetchdata(url);
    var decoded = jsonDecode(data);
    setState(() {
      output = decoded['output'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE2ECFF),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: Color(0xff455A64),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(65, 0, 0, 0),
                    child: Text(
                      'Pre Made AI Goal',
                      style: TextStyle(
                        fontSize: 25,
                        color: Color(0xff1868FE),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Text(output),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xff455A64),
              ),
              child: TextField(
                cursorColor: Colors.black,
                controller: messageController,
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                getValue();
              },
              child: Text('data'),
            )
          ],
        ),
      ),
    );
  }
}
