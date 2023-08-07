import 'package:flutter/material.dart';
import 'package:to_do_task/models/todo_model.dart';
import 'package:to_do_task/services/todo_db.dart';
import 'package:to_do_task/widgets/calendar_widget.dart';
import 'package:to_do_task/widgets/todo_list_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<List<TodoModel>>? futureTodos;
  final todoDB = TodoDB();

  @override
  void initState() {
    super.initState();
    getAllData();
  }

  void getAllData() {
    setState(() {
      futureTodos = todoDB.getAllEvent();
    });
  }

  DateTime? pickeDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          ),
        ],
        centerTitle: true,
        title: GestureDetector(
          onTap: () {
            debugPrint('picker tap');
          },
          child: Column(
            children: [
              Text(
                'September',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '28 September 2021',
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          // Month Select Area
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'September',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back_ios_new),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Calendar select area
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.38,
              width: double.infinity,
              child: CalendarWidget(),
            ),
          ),

          // Event add area
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Schedule',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Event add button
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'event_add_screen');
                  },
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      color: const Color(0xff009FEE),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        '+ Add Event',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Task List widget
          FutureBuilder(
            future: futureTodos,
            builder: (context, snapshot) {
              final todos = snapshot.data;
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data == null) {
                return const Center(
                  child: Text('No even available'),
                );
              } else {
                debugPrint('${snapshot.data!.runtimeType}');
                return Expanded(
                  child: TodoListWidget(todos: todos!),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
