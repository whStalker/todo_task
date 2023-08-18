import 'package:flutter/material.dart';
import 'package:to_do_task/models/todo_model.dart';
import 'package:to_do_task/services/todo_db.dart';

class EventAddScren extends StatefulWidget {
  const EventAddScren({super.key});

  @override
  State<EventAddScren> createState() => _EventAddScrenState();
}

List<int> priorityColorList = [
  0xFFC6E6F6, // low priority color - blue
  0xFFF6E3C6, // medium priority color  - yellow
  0xFFF6CFC6, // high priority color  - red
];

List<int> secondColorValue = [
  0xFF009FEE, // low priority color
  0xFFEE8F00, // medium priority color
  0xFFEE2B00, // high priority color
];

// List<Color> priorityColorList = [
//   const Color(0xFFC6E6F6),
//   const Color(0xFFF6CFC6),
//   const Color(0xFFF6E3C6),
// ];

int dropdownValueColor = priorityColorList.first;

class _EventAddScrenState extends State<EventAddScren> {
  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventDescriptionController = TextEditingController();
  TextEditingController eventLocationController = TextEditingController();
  TextEditingController eventTimeController = TextEditingController();

  int selectedColorIndex = 0;

  void changeColor(color) {
    setState(() {
      selectedColorIndex = priorityColorList.indexOf(color);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Event name enter area
              const Text(
                'Event Name',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextFormField(
                controller: eventNameController,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
                cursorColor: Colors.black,
              ),
              const SizedBox(height: 20),

              // Event description enter area
              const Text(
                'Event description',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextFormField(
                controller: eventDescriptionController,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
                cursorColor: Colors.black,
                maxLines: 6,
              ),
              const SizedBox(height: 20),

              // Event location enter area
              const Text(
                'Event location',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextFormField(
                controller: eventLocationController,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
                cursorColor: Colors.black,
              ),
              const SizedBox(height: 20),

              // Event priority color enter

              const Text(
                'Priority color',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),

              DropdownButton<int>(
                value: priorityColorList[selectedColorIndex],
                onChanged: (colorValue) {
                  changeColor(colorValue);

                  debugPrint('index: ${selectedColorIndex}');

                  // setState(() {
                  //   dropdownValueColor = colorValue!;

                  //   debugPrint('color is : ${colorValue}');
                  // });
                },
                items: priorityColorList.map<DropdownMenuItem<int>>(
                  (value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Container(
                        height: 30,
                        width: 40,
                        color: Color(value),
                      ),
                    );
                  },
                ).toList(),
              ),
              const SizedBox(height: 20),

              // Event time enter area
              const Text(
                'Event time',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextFormField(
                controller: eventTimeController,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
                cursorColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GestureDetector(
          onTap: () async {
            await TodoDB().createEvent(
              TodoModel(
                eventName: eventNameController.text,
                eventDescription: eventDescriptionController.text,
                priorityTaskColor: priorityColorList[selectedColorIndex],
                prioritySecondColor: secondColorValue[selectedColorIndex],
                eventTime: eventTimeController.text,
                eventLocation: eventLocationController.text,
              ),
            );
            eventNameController.clear();
            eventDescriptionController.clear();
            eventLocationController.clear();
            eventTimeController.clear();

            setState(() {});

            Navigator.pop(context);
          },
          child: Container(
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xff009FEE),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
