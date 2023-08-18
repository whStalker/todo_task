import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_task/models/todo_model.dart';
import 'package:to_do_task/services/todo_db.dart';

class EventInfoScreen extends StatelessWidget {
  const EventInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = ModalRoute.of(context)!.settings.arguments as TodoModel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff009FEE),
        shadowColor: Colors.transparent,
        toolbarHeight: 40,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.35,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff009FEE),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // back and edit button area
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Circula back button
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20,
                            child: Padding(
                              padding: EdgeInsets.only(left: 7),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),

                        // Edit button
                        GestureDetector(
                          onTap: () {},
                          child: const Row(
                            children: [
                              Icon(
                                Icons.edit,
                                size: 20,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Edit',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Event name
                    Text(
                      todos.eventName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Event Description
                    Text(
                      todos.eventDescription,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Event time
                    Row(
                      children: [
                        const Icon(
                          Icons.watch_later_rounded,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          todos.eventTime,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),

                    // Event Location
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          todos.eventLocation,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Remainder',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('15 minut before'),
                  const SizedBox(height: 15),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(todos.eventDescription),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          await TodoDB().deleteEvent(todos.id!);
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            bottom: 20,
          ),
          child: Container(
            height: 55,
            decoration: BoxDecoration(
              color: const Color(0xffFEE8E9),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons.trashCan,
                  color: Colors.red,
                ),
                SizedBox(width: 10),
                Text(
                  'Delete Event',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
