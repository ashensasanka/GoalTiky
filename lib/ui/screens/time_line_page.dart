import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

const kTileHeight = 50.0;

class TimeTrackingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd2e1fd),
      body: ListView(
        children: [
          buildOrderCard(context, 1),
          buildOrderCard(context, 2),
          // Container(
          //   child: ListView.builder(
          //     itemCount: 1,
          //     itemBuilder: (context, index) {
          //       final data = _data(index + 1);
          //       return Center(
          //         child: Container(
          //           width: 360.0,
          //           child: Card(
          //             margin: EdgeInsets.all(20.0),
          //             child: Column(
          //               mainAxisSize: MainAxisSize.min,
          //               children: [
          //                 Padding(
          //                   padding: const EdgeInsets.all(20.0),
          //                   child: _OrderTitle(
          //                     orderInfo: data,
          //                   ),
          //                 ),
          //                 Divider(height: 1.0),
          //                 _DeliveryProcesses(processes: data.deliveryProcesses),
          //                 Divider(height: 1.0),
          //                 Padding(
          //                   padding: const EdgeInsets.all(20.0),
          //                   child: _OnTimeBar(driver: data.driverInfo),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}

Widget buildOrderCard(BuildContext context, int index) {
  final data1 = _data1(index);
  final data2 = _data2(index);
  return Center(
    child: Container(
      width: 400.0,
      child: Card(
        color: Color(0xff00b5fd),
        margin: EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: _OrderTitle(
                orderInfo: data1,
              ),
            ),
            index == 1?
            _DeliveryProcesses1(
              processes: data1.deliveryProcesses,
              orderInfo: data1,
            ):
            _DeliveryProcesses2(
              processes: data2.deliveryProcesses,
              orderInfo: data2,
            ),
          ],
        ),
      ),
    ),
  );
}

class _OrderTitle extends StatelessWidget {
  const _OrderTitle({
    Key? key,
    required this.orderInfo,
  }) : super(key: key);

  final _OrderInfo orderInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        orderInfo.id == 1
            ? Text(
                'ONGOING TASKS',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xffA02055),
                  fontWeight: FontWeight.bold,
                ),
              )
            : Text(
                'FINISH TASKS',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff249e81),
                  fontWeight: FontWeight.bold,
                ),
              ),
        Spacer(),
        Text(
          '${orderInfo.date.day}/${orderInfo.date.month}/${orderInfo.date.year}',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class _InnerTimeline1 extends StatelessWidget {
  const _InnerTimeline1({
    required this.messages,
  });

  final List<_DeliveryMessage> messages;

  @override
  Widget build(BuildContext context) {
    bool isEdgeIndex(int index) {
      return index == 0 || index == messages.length + 1;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: FixedTimeline.tileBuilder(
        theme: TimelineTheme.of(context).copyWith(
          nodePosition: 0,
          connectorTheme: TimelineTheme.of(context).connectorTheme.copyWith(
                thickness: 1.0,
              ),
          indicatorTheme: TimelineTheme.of(context).indicatorTheme.copyWith(
                size: 10.0,
                position: 0.5,
              ),
        ),
        builder: TimelineTileBuilder(
          indicatorBuilder: (_, index) =>
              !isEdgeIndex(index) ? Indicator.outlined(borderWidth: 1.0) : null,
          startConnectorBuilder: (_, index) => Connector.solidLine(),
          endConnectorBuilder: (_, index) => Connector.solidLine(),
          contentsBuilder: (_, index) {
            if (isEdgeIndex(index)) {
              return null;
            }

            return Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(messages[index - 1].toString()),
            );
          },
          itemExtentBuilder: (_, index) => isEdgeIndex(index) ? 10.0 : 30.0,
          nodeItemOverlapBuilder: (_, index) =>
              isEdgeIndex(index) ? true : null,
          itemCount: messages.length + 2,
        ),
      ),
    );
  }
}


class _DeliveryProcesses1 extends StatelessWidget {
  const _DeliveryProcesses1(
      {Key? key, required this.processes, required this.orderInfo})
      : super(key: key);

  final List<_DeliveryProcess> processes;
  final _OrderInfo orderInfo;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: Color(0xffA02055),
        fontSize: 12.5,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FixedTimeline.tileBuilder(
          theme: TimelineThemeData(
            nodePosition: 0,
            color: Color(0xffA02055),
            indicatorTheme: IndicatorThemeData(
              position: 0,
              size: 20.0,
            ),
            connectorTheme: ConnectorThemeData(
              thickness: 2.5,
            ),
          ),
          builder: TimelineTileBuilder.connected(
            connectionDirection: ConnectionDirection.before,
            itemCount: processes.length,
            contentsBuilder: (_, index) {
              if (processes[index].isCompleted) return null;

              return Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 240,
                          child: Text(
                            processes[index].name,
                            style: DefaultTextStyle.of(context).style.copyWith(
                                  fontSize: 18.0,
                              color: Color(0xffA02055),
                                ),
                          ),
                        ),
                        orderInfo.id == 1
                            ? SizedBox(
                                height: 30,
                                width: 50,
                                child: GestureDetector(
                                  onTap: () {
                                    // Handle button press
                                    // Navigator.push(
                                    //   context,
                                    //   PageTransition(
                                    //     child: NewRootPage(),
                                    //     type: PageTransitionType.bottomToTop,
                                    //   ),
                                    // );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffA02055),
                                      borderRadius: BorderRadius.circular(
                                          10), // Set the corner radius here
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Edit',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(
                                height: 30,
                                width: 50,
                                child: Image.asset(
                                  'assets/images/cindicate.png',
                                ),
                              ),
                      ],
                    ),
                    _InnerTimeline1(messages: processes[index].messages)
                  ],
                ),
              );
            },
            indicatorBuilder: (_, index) {
              if (processes[index].isCompleted) {
                return OutlinedDotIndicator(
                  borderWidth: 2.5,
                );
              } else {
                return OutlinedDotIndicator(
                  borderWidth: 2.5,
                );
              }
            },
            connectorBuilder: (_, index, ___) => SolidLineConnector(
              color: null,
            ),
          ),
        ),
      ),
    );
  }
}

class _DeliveryProcesses2 extends StatelessWidget {
  const _DeliveryProcesses2(
      {Key? key, required this.processes, required this.orderInfo})
      : super(key: key);

  final List<_DeliveryProcess> processes;
  final _OrderInfo orderInfo;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: Color(0xff2055FF),
        fontSize: 12.5,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FixedTimeline.tileBuilder(
          theme: TimelineThemeData(
            nodePosition: 0,
            color: Color(0xff989898),
            indicatorTheme: IndicatorThemeData(
              position: 0,
              size: 20.0,
            ),
            connectorTheme: ConnectorThemeData(
              thickness: 2.5,
            ),
          ),
          builder: TimelineTileBuilder.connected(
            connectionDirection: ConnectionDirection.before,
            itemCount: processes.length,
            contentsBuilder: (_, index) {
              if (processes[index].isCompleted) return null;

              return Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 240,
                          child: Text(
                            processes[index].name,
                            style: DefaultTextStyle.of(context).style.copyWith(
                              fontSize: 18.0,
                              color: Color(0xff249e81)
                            ),
                          ),
                        ),
                        orderInfo.id == 1
                            ? SizedBox(
                          height: 30,
                          width: 50,
                          child: GestureDetector(
                            onTap: () {
                              // Handle button press
                              // Navigator.push(
                              //   context,
                              //   PageTransition(
                              //     child: NewRootPage(),
                              //     type: PageTransitionType.bottomToTop,
                              //   ),
                              // );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xff6196C7),
                                borderRadius: BorderRadius.circular(
                                    10), // Set the corner radius here
                              ),
                              child: Center(
                                child: Text(
                                  'Edit',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        )
                            : SizedBox(
                          height: 30,
                          width: 50,
                          child: Image.asset(
                            'assets/images/cindicate.png',
                          ),
                        ),
                      ],
                    ),
                    _InnerTimeline1(messages: processes[index].messages)
                  ],
                ),
              );
            },
            indicatorBuilder: (_, index) {

                return DotIndicator(
                  color: Color(0xff249e81),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 12.0,
                  ),
                );
            },
            connectorBuilder: (_, index, ___) => SolidLineConnector(
              color: Color(0xff249e81),
            ),
          ),
        ),
      ),
    );
  }
}

_OrderInfo _data1(int id) => _OrderInfo(
      id: id,
      date: DateTime.now(),
      deliveryProcesses: [
        _DeliveryProcess(
          'Working on a group project',
          messages: [
            _DeliveryMessage('8:30am', 'Package received by driver'),
            _DeliveryMessage('11:30am', 'Reached halfway mark'),
          ],
        ),
        _DeliveryProcess(
          'Attend tutoring session',
          messages: [
            _DeliveryMessage('13:00pm', 'Driver arrived at destination'),
            _DeliveryMessage('11:35am', 'Package delivered by m.vassiliades'),
          ],
        ),
        _DeliveryProcess(
          'Assignment Submission',
          messages: [
            _DeliveryMessage('13:00pm', 'Driver arrived at destination'),
            _DeliveryMessage('11:35am', 'Package delivered by m.vassiliades'),
          ],
        ),
        _DeliveryProcess.complete(),
      ],
    );

_OrderInfo _data2(int id) => _OrderInfo(
  id: id,
  date: DateTime.now(),
  deliveryProcesses: [
    _DeliveryProcess(
      'Submit Project Proposal',
      messages: [
        _DeliveryMessage('8:30am', 'Package received by driver'),
        _DeliveryMessage('11:30am', 'Reached halfway mark'),
      ],
    ),
    _DeliveryProcess(
      ' Submit the Final Report',
      messages: [
        _DeliveryMessage('13:00pm', 'Driver arrived at destination'),
        _DeliveryMessage('11:35am', 'Package delivered by m.vassiliades'),
      ],
    ),
    _DeliveryProcess(
      'Submit Project Proposal',
      messages: [
        _DeliveryMessage('13:00pm', 'Driver arrived at destination'),
        _DeliveryMessage('11:35am', 'Package delivered by m.vassiliades'),
      ],
    ),
    _DeliveryProcess.complete(),
  ],
);

class _OrderInfo {
  const _OrderInfo({
    required this.id,
    required this.date,
    required this.deliveryProcesses,
  });

  final int id;
  final DateTime date;
  final List<_DeliveryProcess> deliveryProcesses;
}

class _DeliveryProcess {
  const _DeliveryProcess(
    this.name, {
    this.messages = const [],
  });

  const _DeliveryProcess.complete()
      : this.name = 'Done',
        this.messages = const [];

  final String name;
  final List<_DeliveryMessage> messages;

  bool get isCompleted => name == 'Done';
}

class _DeliveryMessage {
  const _DeliveryMessage(this.createdAt, this.message);

  final String createdAt; // final DateTime createdAt;
  final String message;

  @override
  String toString() {
    return '$createdAt $message';
  }
}
