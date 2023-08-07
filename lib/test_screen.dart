import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'package:spinner_date_time_picker/spinner_date_time_picker.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

DateTime currentDate = DateTime.now();

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.timer_rounded),
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: DateTime(2023),
                firstDate: DateTime(1950),
                lastDate: DateTime(2950),
                initialDatePickerMode: DatePickerMode.year,
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                selectableDayPredicate: (day) {
                  return false;
                },
              );
            },
            child: Text(currentDate.year.toString()),
          ),
        ],
      ),
    );
  }
}
