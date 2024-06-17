import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final ValueChanged<DateTime>? onDateSelected;
  final String? restorationId;

  const DatePicker({super.key, this.restorationId, this.onDateSelected});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

/// RestorationProperty objects can be used because of RestorationMixin.
class _DatePickerState extends State<DatePicker> with RestorationMixin {
  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2024, 6, 26));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021),
          lastDate: DateTime(2030),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(
        () {
          _selectedDate.value = newSelectedDate;
          widget.onDateSelected?.call(newSelectedDate);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
            ),
          );
        },
      );
    }
  }

  bool state = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            _restorableDatePickerRouteFuture.present();
            state = true;
          },
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xff7DA7F7),
                ),
                child: Image.asset(
                  'assets/images/calendar.png',
                ),
              ),
              state
                  ? Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Color(0xff455A64),
                      ),
                      child: Center(
                        child: Text(
                          '${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 23),
                        ),
                      ),
                    )
                  : Container(
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
      ),
    );
  }
}
