import 'package:flutter/material.dart';
import 'package:to_do_task/models/todo_model.dart';
import 'package:to_do_task/services/todo_db.dart';

class EventAddScren extends StatefulWidget {
  const EventAddScren({super.key});

  @override
  State<EventAddScren> createState() => _EventAddScrenState();
}

class _EventAddScrenState extends State<EventAddScren> {
  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventDescriptionController = TextEditingController();
  TextEditingController eventLocationController = TextEditingController();
  TextEditingController eventTimeController = TextEditingController();

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
              DropdownMenu(
                dropdownMenuEntries: [],
              ),
              DropdownButton(items: [], onChanged: (_) {}),
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
                priorityColor: 'color',
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
