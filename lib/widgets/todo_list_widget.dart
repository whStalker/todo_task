import 'package:flutter/material.dart';
import 'package:to_do_task/models/todo_model.dart';

class TodoListWidget extends StatelessWidget {
  final List<TodoModel> todos;
  const TodoListWidget({required this.todos, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final data = todos[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                'event_info_screen',
                arguments: todos[index],
              );
            },
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                color: Color(
                  data.priorityTaskColor,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    height: 10,
                    decoration: BoxDecoration(
                      color: Color(
                        data.prioritySecondColor,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Event name
                        Text(
                          data.eventName,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(data.prioritySecondColor),
                          ),
                        ),
                        const SizedBox(height: 7),

                        //Event description
                        Text(data.eventDescription),
                        const SizedBox(height: 10),

                        // Event time and location ROW
                        Row(
                          children: [
                            Icon(
                              Icons.watch_later_rounded,
                              color: Color(data.prioritySecondColor),
                            ),
                            Text(
                              data.eventTime,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Icon(
                              Icons.location_on,
                              color: Color(data.prioritySecondColor),
                            ),
                            Text(
                              data.eventLocation,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
