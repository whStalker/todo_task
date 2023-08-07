import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

DateTime dateTime = DateTime.now();

List<DateTime> getDaysInMonth(DateTime date) {
  int year = date.year;
  int month = date.month;
  int daysInMonth = DateTime(year, month + 1, 0).day;
  List<DateTime> days = [];

  for (int day = 1; day <= daysInMonth; day++) {
    days.add(DateTime(year, month, day));
  }

  return days;
}

int selectedItemId = -1;

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: GridView.builder(
            itemCount: 7,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              mainAxisExtent: 35,
            ),
            itemBuilder: (contex, index) {
              return Container(
                // color: Colors.grey,
                child: Center(
                  child: Text(DateFormat('E')
                      .format(getDaysInMonth(dateTime)[index])
                      .toString()),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: getDaysInMonth(dateTime).length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              crossAxisSpacing: 5,
              mainAxisExtent: 35,
              mainAxisSpacing: 5,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedItemId = index;
                  });
                },
                child: Container(
                  color: selectedItemId == index
                      ? Colors.blueAccent
                      : Colors.white,
                  child: Center(
                    child: Text(DateFormat('d')
                        .format(getDaysInMonth(dateTime)[index])
                        .toString()),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
