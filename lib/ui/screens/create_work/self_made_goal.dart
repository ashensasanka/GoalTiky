import 'package:flutter/material.dart';
import 'package:goaltiky/ui/screens/create_work/date_picker.dart';
import 'package:page_transition/page_transition.dart';

import '../../../models/ctasks.dart';
import '../detail_page.dart';

class SelfMadeGoal extends StatefulWidget {
  const SelfMadeGoal({super.key});

  @override
  State<SelfMadeGoal> createState() => _SelfMadeGoalState();
}

class _SelfMadeGoalState extends State<SelfMadeGoal> {
  TimeOfDay? selectedTime;
  String? dropdownValue;
  TimePickerEntryMode entryMode = TimePickerEntryMode.dial;
  Orientation? orientation;
  MaterialTapTargetSize tapTargetSize = MaterialTapTargetSize.padded;
  TextDirection textDirection = TextDirection.ltr;
  bool use24HourTime = false;
  List<TextEditingController> listController = [TextEditingController()];

  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<Ctasks> _completedList = Ctasks.cTasksList;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffE2ECFF),
      body: SingleChildScrollView(
        child: Padding(
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
                        'Create New Work',
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
              SizedBox(
                height: 20,
              ),
              Text(
                'Task Title',
                style: TextStyle(
                  color: Color(0xff1868FE),
                  fontWeight: FontWeight.w500,
                  fontSize: 23.0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff455A64),
                ),
                width: 350,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: TextField(
                    cursorColor: Colors.white,
                    controller: textEditingController,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Work Details',
                style: TextStyle(
                  color: Color(0xff1868FE),
                  fontWeight: FontWeight.w500,
                  fontSize: 23.0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff7DA7F7).withOpacity(0.26),
                ),
                width: 350,
                height: 110,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: TextField(
                    maxLines: 4,
                    cursorColor: Colors.blue,
                    controller: textEditingController,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Work Type',
                style: TextStyle(
                  color: Color(0xff1868FE),
                  fontWeight: FontWeight.w500,
                  fontSize: 23.0,
                ),
              ),
              SizedBox(
                height: 70,
                width: 150,
                child: DropdownButtonFormField<String>(
                  icon: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.white,
                    ),
                  ),
                  iconSize: 30,
                  iconDisabledColor: Colors.blue,
                  iconEnabledColor: Colors.pink,
                  decoration: InputDecoration(
                    fillColor: Color(0xff455A64),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                  ),
                  hint: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: const Text(
                      'Type',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  dropdownColor: Color(0xff455A64),
                  value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(
                      () {
                        dropdownValue = newValue!;
                      },
                    );
                  },
                  items: <String>['Indevidual', 'Group']
                      .map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              dropdownValue == 'Group'
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Add Team Members',
                          style: TextStyle(
                            color: Color(0xff1868FE),
                            fontWeight: FontWeight.w500,
                            fontSize: 23.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 300,
                              child: SizedBox(
                                height: 60,
                                child: ListView.builder(
                                  itemCount: listController.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return index != 0
                                        ? Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 20, 0),
                                            child: Container(
                                              width: 190,
                                              decoration: BoxDecoration(
                                                color: Color(0xff455A64),
                                              ),
                                              child: Stack(
                                                alignment: AlignmentDirectional
                                                    .bottomEnd,
                                                children: [
                                                  Positioned(
                                                    left: 40,
                                                    child: Container(
                                                      width: 140,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          10),
                                                              height: 60,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xff455A64),
                                                              ),
                                                              child:
                                                                  TextFormField(
                                                                controller:
                                                                    listController[
                                                                        index],
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(
                                                                () {
                                                                  listController[
                                                                          index]
                                                                      .clear();
                                                                  listController[
                                                                          index]
                                                                      .dispose();
                                                                  listController
                                                                      .removeAt(
                                                                          index);
                                                                },
                                                              );
                                                            },
                                                            child: Image.asset(
                                                                'assets/images/closesquare.png'),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : Text('');
                                  },
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(
                                  () {
                                    listController.add(TextEditingController());
                                  },
                                );
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xff7DA7F7),
                                ),
                                child: Image.asset(
                                  'assets/images/addsquare.png',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Text(''),
              SizedBox(
                height: 20,
              ),
              Text(
                'Time & Date',
                style: TextStyle(
                  color: Color(0xff1868FE),
                  fontWeight: FontWeight.w500,
                  fontSize: 23.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xff7DA7F7),
                            ),
                            child: Image.asset(
                              'assets/images/clock.png',
                            ),
                          ),
                          onTap: () async {
                            final TimeOfDay? time = await showTimePicker(
                              context: context,
                              initialTime: selectedTime ?? TimeOfDay.now(),
                              initialEntryMode: entryMode,
                              orientation: orientation,
                              builder: (BuildContext context, Widget? child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    materialTapTargetSize: tapTargetSize,
                                  ),
                                  child: Directionality(
                                    textDirection: textDirection,
                                    child: MediaQuery(
                                      data: MediaQuery.of(context).copyWith(
                                        alwaysUse24HourFormat: use24HourTime,
                                      ),
                                      child: child!,
                                    ),
                                  ),
                                );
                              },
                            );
                            setState(
                              () {
                                selectedTime = time;
                              },
                            );
                          },
                        ),
                        if (selectedTime != null)
                          Container(
                            height: 50,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Color(0xff455A64),
                            ),
                            child: Center(
                              child: Text(
                                '${selectedTime!.format(context)}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 23),
                              ),
                            ),
                          ),
                        if (selectedTime == null)
                          Container(
                            height: 50,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Color(0xff455A64),
                            ),
                            child: Center(
                              child: Text(''),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Container(
                      width: 170,
                      height: 50,
                      child: DatePicker(restorationId: 'app')),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
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
                      'Create',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
